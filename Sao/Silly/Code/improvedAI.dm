
obj/aggroImage
	layer = 100
	maptext = "<text align=center valign=top><span style='-dm-text-outline:1px red OUTLINE_SHARP;color:white;font-size:6pt;font-weight:bold'>!<span>"

mob/enemy

	var/mob/target
	var/RefreshTimeAI = 10
	var/prevMoveTime
	var/canMoveTime
	var/movementDelay = 5
	var/movementSpeed = 2
	var/tmp/isAggro = 0
	// list("skillName"=list(delayStatus, delay))
	var/list/skillDelays = list("attack"=list(0,30),"teleport"=list(0,280))
	var/list/skillTraits = list("aggro")
	var/obj/aggroImage/aggroImage = new
	var/list/statMods = list(1.2,1.5,1.1,1.5)

	proc/buffStats() // 1 to add and -1 to subtract
		strmod *= 1.35
		defmod *= 2.35
		reimod *= 1.35
		resmod *= 2.35
		return
	proc/revertBuff()

		strmod = statMods[1]
		defmod = statMods[2]
		reimod = statMods[3]
		resmod = statMods[4]

	proc/onDelay(skill)
		if(!target || !skill || !skillDelays[skill])return 0
		if(skillDelays[skill][1]) return 1
		skillDelays[skill][1] = 1
		spawn(skillDelays[skill][2] * rand())
			skillDelays[skill][1] = 0
		return 0

	proc/aiAttack()
		if(onDelay("attack")) return

		for(var/mob/t in oview(1,src))
			if(target != t)continue
			attstyle = "Physical"
			flick("attack", src)
			takeDamage(src, target)

	proc/teleportBehind()

		if(onDelay("teleport")) return
		var/tmp/nFacing = get_dir(src, target)
		switch(nFacing)
			if(1) loc = locate(target.x, target.y+1, target.z)
			if(2) loc = locate(target.x, target.y-1, target.z)
			if(4 to 6) loc = locate(target.x+1, target.y, target.z)
			if(8 to 10) loc = locate(target.x-1, target.y, target.z)
		faceMob()
		aiAttack()

	proc/faceMob()
		var/tmp/nFacing = get_dir(src, target)
		if(!needsToFace(nFacing))return
		dir = nFacing


	proc/needsToFace(nFacing)
		if(!nFacing) return
		if(dir == nFacing) return 0
		switch(nFacing)
			if(8 to 10)
				if(dir == 8 || dir == 9 || dir == 10)return 0
			if(11 to 14)
				if(dir == 11 || dir == 12 || dir == 14)return 0
		return 1

	proc/checkAggro()

		if(!"aggro" in skillTraits) return
		//aggro at 30% max_hp and less.
		if(!isAggro && (health <= healthwas*0.50))
			vis_contents |= aggroImage
			//world << "mob is aggro!"

			movementSpeed *= 0.4
			isAggro = 1
			buffStats()


	proc/approach()
		var/dist = get_dist(src,target)
		if(isAggro&&dist > 3) {teleportBehind(); return}
		faceMob()
		if(dist <= 1 )
			aiAttack()
			return
		skillAI()
		walk_to(src, target, 1,movementDelay, movementSpeed)

	proc/retreat()
		revertBuff()
		health = healthwas
		target = null
		vis_contents -= aggroImage
		isAggro = 0
		walk_to(src, oldspot, 1,movementDelay, movementSpeed)

	// run old skill code for now...while I get time to remake it.
	proc/skillAI()
		set waitfor = 0
		if(!target)return
		if(prob(10)) //10% chance to run this code
			if(length(Skills))
				var/skill = text2path("/mob/techniques/verb/[pick(Skills)]")
				if(!(skill in verbs)) verbs += skill
				usr = src
				call(src,skill)()
/*
				if(!(chosenSkills in src.verbs))
					world << src
					src.verbs += chosenSkills
				call(src.chosenSkills)()*/

	proc/movementLoop()
		set waitfor = 0
		if(!target) return
		do
			if(world.tick_usage > 85) sleep(world.tick_lag)
// run old skill code for now...while I remake it.
			checkAggro()
			approach()
			sleep(world.tick_lag)
		while(target && get_dist(src,target) <= MOB_AGGRO_DISTANCE)
		retreat()



