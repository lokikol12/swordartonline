
mob
	verb
		OOC_Toggle()
			set category = "Other"
			if(usr.OOC)
				usr.OOC = 0
				outputMessage(usr,"<b>[usr] has turned his OOC off!","gametext")
			else
				usr.OOC = 1
				outputMessage(usr,"<b>[usr] has turned his OOC on!","gametext")
mob
	var
		tmp/joe = 0


mob/proc
	load()
		src.loc = locate(33,15,2)
		spawn(30)
			if(!src)
				return
			if(src.joe)
				return
			if(fexists("playersaves/[src.key]"))
				var/savefile/load
				load = new ("playersaves/[src.key]")
				load["mob"] >> src
				load["x"] >> src.x
				load["y"] >> src.y
				load["z"] >> src.z
				var/list/L
				load["verbs"] >> L
				for(var/X in L)
					if(!X)
						continue
					src.verbs += X
				src.verbs += typesof(/mob/verb/)
				outputMessage("world","<font size=1><font color=blue>Info: [src] has logged on the server.","gametext")
				src.joe = 1
				if(src)
					src.inshikai = 0
					src.rundelay = src.defaultrundelay
					src.inbankai = 0
					src.inhoug = 0
					src.inhom = 0
					src.inssj2 = 0
					src.inbankai2 = 0
					src.inSegundaEtapa = 0
					src.inssj1 = 0
					src.inpowercontrol = 0
					src.inrelease = 0
					src.flashstep = 0
					src.doubleexp = 0
					src.doublecor = 0
				if(src.guild_leader)
					src.overlays += /obj/gl
				src.OOC = 1
				src.cansave=1
				src.auraon=0
				src.frozen = 0
				src.defence = src.mdefence
				src.strength = src.mstrength
				src.reiatsu = src.mreiatsu
				src.resistance = src.mresistance
				del(usr)
				if(src.inevent)
					src.inevent = 0
					src.loc = locate(133,3,1)
				if(src.race == "Soul")
					src.alpha = 128
				else
					src.alpha = 255
				src.addHud()

				var/tmp/list/wearingItems
				load["wearing"] >> wearingItems
				client.wearing += wearingItems
				var/list/equipment
				load["equipment"] >> equipment
				src.client.loadEquipment(equipment)
				/*
				var/list/inventoryChange
				load["changedToSystem"] >> inventoryChange
				for(var/x in inventoryChange)
					src.client.changedToSystem += x
				if(src.client.changedToSystem.len < 1) src.client.changeEquipmentSystem()
				*/
				var/list/quests
				load["quests"] >> quests

				for(var/q in quests["ongoing"])
					src.client.addQuest(quests["ongoing"][q],"bypass")

				verbs -= /mob/techniques/verb/SpecialAttack

				//for(var/q in quests["complete"])
					//src.client.addQuest(quests["complete"][q])







mob/Login()
	src.loc = locate(313,32,1)
	src.frozen = 1
	//src.client.view=8
	if(src.key in owners)
		src.verbs += typesof(/mob/owner/verb)
		src.verbs += typesof(/mob/admin/verb)
		src.verbs += typesof(/mob/moderator/verb)
		src.GM=2
	if(src.key in Moderator)
		src.verbs += typesof(/mob/moderator/verb)
	if(private)
		if(!(src.key in owners))
			src << "<b>This server is private at the moment, sorry."
			del src
		return
	..()

mob/Logout()
	if(!src)
		return..()
	else
		src.resetToDefault()
		for(var/obj/O in src.petals)
			del(O)
		for(var/obj/O in src.blades)
			del(O)
		for(var/obj/M in world)
			if(M.owner == src||M.Gowner == src)
				del(M)
		for(var/mob/zabimaru/M in world)
			if(M.owner == src)
				del M
		src.swordon = 0
		src.saveproc()
		del(src)
		return..()

client
	var/tmp/banned=0
	New()
		if(src.key == "Guest")
			del(src)
		..()
		if(Bans && Bans.Find(key))
			src.verbs-=src.verbs
			outputMessage(src,"<font color = red><big>You're banned from [world.name].</font>","gametext")
			spawn() del(src)
		if(IPBans && IPBans.Find(address))
			src.verbs-=src.verbs
			outputMessage(src,"<font color = red><big>You're banned from [world.name].</font>","gametext")
			spawn()
				src.banned = 1
				del(src)

mob
	proc
		newchar()
			if(!src.creating)
				src.creating = 1
				if(fexists("playersaves/[src.key]"))
					switch(alert(usr, "Are you sure that you want to overwrite your old Character?", "Character Creation", "Yes","No"))
						if("Yes")
							sleep(1)
							fdel("playersaves/[src.key].sav")
						if("No")
							creating = 0
							return
				var/name = input("","What name would you like?") as text|null
				if(length(name) < 2)
					alert("Your name must be longer than two characters!")
					return
				if(length(name) > 20)
					alert("Your name can not be longer than twenty characters!")
					return
				if(name == src.key)
					alert("Your name can't be the same as your key!")
					return
				if(!usr)
					return
				src.name = Capitalize(name)
				src.icon='base.dmi'
				updateHair()
				src.cansave=1
				src.OOC=1
				outputMessage("world","<b><font color = yellow>Info: [src] has logged on to the game for the first time!","gametext")
				src.loc = locate(33,15,2)
				spawn(20)
					src.loc = locate(70,8,1)
				src.frozen = 0
				src.addHud()
				var/a=src.s_Support()
				//testing isn't easy.
				if(src.key == "Kodra777") {client.gainExp(10000000)}

				if(a!=src.key)
					if(a)
						alert("Thank you for ranking us! You get 15000  Experience for ranking us!")
						src.mexp += 15000
						src.statpoints += 200
				spawn(50)
					src.creating = 0
			else
				return

proc
	s_Key()
		var/a=findtextEx(world.hub,".")
		return copytext(world.hub,1,a)
mob
	proc
		s_Support()
			if(src.client.IsByondMember())
				var/http[]=world.Export("http://members.byond.com/[src.key]")
				if(!http){src<<"Connection to hub failed.";return}
				var/a=http["CONTENT"]
				var/b=findtextEx(file2text(a),"My favorite games")
				if(b)
					var/c=copytext(file2text(a),b)
					var/d=1
					while(d){var/e=findtextEx(c,"Posted by");if(e)c=copytext(c,e+10);else d=0}
					var/f=findtextEx(c,"http://games.byond.com/hub/Kodra777/SwordArtOnline")
					if(f)return 1
				return 0
			return src.key

client
	Del()
		if(!src.mob)
			return..()
		if(src.banned)
			return..()
		else
			src.mob.resetToDefault()
			for(var/obj/O in src.mob.petals)
				del(O)
			for(var/obj/O in src.mob.blades)
				del(O)
			for(var/obj/M in world)
				if(M.owner == src.mob||M.Gowner == src.mob)
					del(M)
			for(var/mob/zabimaru/M in world)
				if(M.owner == src.mob)
					del M
			src.mob.saveproc()
			del(mob)
			return..()