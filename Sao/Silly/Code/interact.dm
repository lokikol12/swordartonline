
mob/World_Map
	var/dialogue
	var/dontInteract// for mobs that talk after a condition is met. 0 for everybody else.
	verb/Interact()
		set hidden = 1
		if(canInteract(usr))
			interactWith(usr)
			converse(usr)

	proc/converse(mob/m)
		if(m && m.client && !dontInteract && dialogue) m.client.addDialogue(src,dialogue)

	proc/canInteract(mob/m)
		if(m.frozen) return 0
		if(!m.isFacing(src))return 0
		return 1
	//intentionally blank
	proc/interactWith(mob/m)

mob
	proc/isFacing(mob/target)
		if(!target) return
		var/tmp/nFacing = get_dir(src, target)
		if(dir == nFacing) return 1
		switch(nFacing)
			if(4 to 6)
				if(dir == 4 || dir == 5 || dir == 6)return 1
			if(8 to 10)
				if(dir == 8 || dir == 9 || dir == 10)return 1
		return 0


client/verb/Interact()
	set hidden = 1
	if(guiToggles["dialogue"])
		winset(src, "interact", "parent=macro;name=Space;command=nextDialogue")
		return
	for(var/obj/equipment/equip in oview(1))
		equip.Interact()

	var/restrictMob = 0
	for(var/mob/World_Map/npc in oview(2))
		if(restrictMob)return
		if(mob.isFacing(npc))
			npc.Interact()
			restrictMob = 1

