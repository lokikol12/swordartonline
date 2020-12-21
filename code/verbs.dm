var/worldC=1
mob/var/OOC=0
mob/var/tmp/who = 0


mob/moderator/verb/Observe(mob/M in onlinePlayers)
	set category = "Combat"
	set name = "Observe"
	src.client.eye = M
	if(M == src) //observe yourself == stop observing
		src.client.perspective = MOB_PERSPECTIVE
	else
		src.client.perspective = EYE_PERSPECTIVE


mob/techniques/verb/invis()
	set name = "Invisibility"
	set category = "Combat"
	if(usr.invisibility != 101)
		usr.invisibility = 101
	else
		usr.invisibility = 0

mob
	verb
		Send_File(mob/person in view(usr),filez as file)
			set category = "Other"
			switch(alert(person,"[usr] is trying to send you [filez].		Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(usr,"[person] accepted the file","File Accepted")
					person<<ftp(filez)
				if("No")
					alert(usr,"[person] declined the file","File Declined")


mob/verb/AFK()
	set category="Other"
	switch(alert(usr, "Do You Wish To Turn AFK On Or Off?","AFK?","On","Off"))
		if("On")//If you choose Add...
			world << output("<font color = blue>[usr] is now AFK","output")
		if("Off")//If you choose Remove...
			world << output("<font color = red>[usr] is no longer AFK","output")






















mob/techniques
	verb
		leavehouse()
			set name = "Buy Second Home"
			set category = "Other"
			if(usr.home == 2)
				outputMessage(usr,"You have two houses","gametext")
				return
			if(usr.houseowner1 == 0)
				outputMessage(usr,"You need a house first silly","gametext")
				return
			if(usr.Cor < 1000000000)
				outputMessage(usr,"This cost 1B Cor","gametext")
			else
				usr.houseowner1 = 0
				usr.Cor -= 1000000000
				outputMessage(usr,"You can now buy a second house","gametext")

mob/techniques/verb/heal()
	set category = "Combat"
	set name = "Self Heal"
	if(usr.fastheal == 1)
		return
	else
		usr.fastheal()

mob/verb
	Suicide()
		set category = "Other"
		set name = "Suicide"
		if(usr.suicide == 1)
			outputMessage(src,"Dont spam")
			return
		usr.health = 0
		usr.Death(usr)
		usr.suicide = 1
		spawn(150)
			usr.suicide = 0
mob
	verb
		FixSword2()
			set category = "Other"
			set name = "Sword & staff Fix"
			var/mob/M = usr
			outputMessage(M,"<b>You have taken off all swords and staffs (icons may bug)","gametext")
			M.swordon = 0
			M.swordon2 = 0
			M.swordon3 = 0
			M.swordon4 = 0
			M.swordon5 = 0
			M.swordon6 = 0
			M.swordon7 = 0
			M.swordon8 = 0
			M.swordon9 = 0
			M.swordon10 = 0
			M.swordon11 = 0
			M.staffon1 = 0
			M.staffon2 = 0
			M.staffon3 = 0
			M.staffon5 = 0
			M.staffon6 = 0
			M.staffon4 = 0
			M.overlays -= 'sword.dmi'
			M.rundelay = usr.defaultrundelay
			M.strmod = M.defaultstrmod
			M.defmod = M.defaultdefmod
			M.resmod = M.defaultresmod
			M.reimod = M.defaultreimod


mob/verb
    ChangeView()
        set category = "Other"
        var/tmp/viewset = input("Set your view variable", "Change View") as null|anything in list("17x17","25x25","31x31")
        switch(viewset)
            if(null)
                return
            if("17x17")
                viewset = 8
            if("25x25")
                viewset = 12
            if("31x31")
                viewset = 15
        usr.client.view = viewset

mob
	verb
		Remove_Overlays()
			set category = "Other"

			if(usr.lock)
				return
			if(usr.race != "hollow"||usr.race != "Legendary Vaizard")
				usr.icon = 'base.dmi'
			if(usr.race == "Legendary Vaizard")
				usr.icon = 'vastoichgo2.dmi'
			if(usr.race == "Hollow")
				if(usr.hollowtype=="Normal")
					usr.icon = 'hollow.dmi'
				if(usr.hollowtype=="Strong")
					usr.icon = 'hollowstrong.dmi'
				if(usr.hollowtype=="Menos Grande")
					usr.icon = 'meno.dmi'
					usr.overlays += /obj/menos2
					usr.overlays += /obj/menos3
				if(usr.hollowtype=="Adjucha")
					usr.icon = 'Adjucha.dmi'
				if(usr.hollowtype=="Vasto")
					usr.icon = 'hollowarrancar.dmi'
				if(usr.hollowtype=="InnerHollow")
					usr.icon = 'vastoichgo2.dmi'
			usr.sight = 0
			usr.loc = usr.loc
			usr.invisibility = 0
			usr.safe = 0
			usr.resting = 0
			usr.underlays = 0
			usr.firing = 0
			usr.overlays = 0



/*mob/verb/pvp()
	set category = "Other"
	set name = "Enable/Disable PvP"
	if(usr.pvp == 0)
		usr.pvp = 1
		outputMessage(usr,"You have turned PvP on","gametext")
		return
	else
		if(usr.pvp == 1)
			usr.pvp = 0
			outputMessage(usr,"You have turned off PvP","gamtext")
			return*/

mob
	verb
		Sense_Reiatsu()
			set category = "Combat"
			set name = "Sense Reiatsu"
			if(!src.sensetab)
				src.sensetab=1
				outputMessage(src,"<b>You start sensing life around you.</b>","gametext")
				//Activates the sense tab
				//Sense tab stuff is handled in Bleach.dm
			else
				src.sensetab=0
				outputMessage(src,"<b>You stop sensing life around you.</b>","gametext")
				//Deactivates the sense tab



		GM_Help()
			set category = "Other"
			switch(input("This will send an alert to all GMs, if you use this verb without reason you will be punished. Are you sure you want to use this verb?", text) in list ("Yes","No"))
				if("Yes")
					var/msg=input("What do you want to say?","Alert")as text
					for(var/mob/M in world)
						if(M.GM)
							M << "<b><font color = lime>ALERT: [usr] has alerted us and the reason is [msg]!"

		ChangeColor()
			set name = "Text color"
			set category = "Other"
			usr.textcolor = input("Which color text would you like?") as color
			sleep(5)
			usr.namecolor = input("Which color name would you like?") as color

		OOC(msg as text)
			set category = "Other"
			if(!usr || msg == " ") return
			var i
			for(i=1, i<=usr.client.specialVerbs.len, i++)
				if(findtext(msg, usr.client.specialVerbs[i]))
					usr.client.callSpecialVerb(usr.client.specialVerbs[i])
					return

			if(usr.GM<2&&usr.muted)
				alert("You are muted!")
				return
			if(msg == "")
				return
			if(!worldC)
				alert("The world is muted!")
				return
			if(length(msg) >= 200)
				alert("Your message is too long.")
				return
			if(usr.Filter(msg,tags) == TRUE)
				alert("No html allowed.")
				return
			if(usr.spamcheck == TRUE)
				outputMessage(usr,"<b>Please wait before talking again.","gametext")
				return
			else
				usr.spamcheck()
				if(!usr.textcolor||!usr.namecolor)
					if(usr.in_guild == 0)
						world << "<font color=white><b>[usr]:</font><font color=cyan> [msg]</b></font>"
					else
						world << "<font color=white><b>{[usr.guild_name]} [usr]:</font><font color=cyan> [msg]</b></font>"
				else
					if(usr.GM == 0)
						if(usr.in_guild == 1)
							world << "<font color=[usr.namecolor]><b>{[usr.guild_name]}{[usr.status]} <font color=[usr.namecolor]>[usr]</font>:</font><font color=[usr.textcolor]> [msg]</b></font>"
						else
							world << "<font color=[usr.namecolor]><b>{none} {[usr.status]} <font color=[usr.namecolor]>[usr]</font>:</font><font color=[usr.textcolor]> [msg]<font></b>"
					else
						if(usr.GM == 1)
							world << "<font color=[usr.namecolor]><b>{[usr.guild_name]}{Beater} {[usr.status]}<font color=[usr.namecolor]>[usr]</font>:</font><font color=[usr.textcolor]> [msg]</b></font>"
						if(usr.key == "Kodra777")

							world << "<font color=[usr.namecolor]><b>{[usr.guild_name]}{Beater} {[usr.status]}<font color=[usr.namecolor]>[usr]</font>:</font><font color=[usr.textcolor]> [msg]</b></font>"
					text2file("[time2text(world.realtime)]:[usr] (OOC): [msg]","logs/log.txt")
					return
		Race_Say(msg as text)
			set category = "Other"
			if(!usr.OOC)
				return
			if(!worldC)
				return
			if(Filter(msg,tags) == TRUE)
				alert("No html allowed.")
				return
			if(length(msg) >= 200)
				alert("<b>Your message is too long.</b>")
				return
			else
				if(spamcheck == TRUE)
					outputMessage(usr,"<b>Please wait before talking again!</b>","gametext")
					return
				else
					usr.spamcheck()
					for(var/mob/M in world)
						if(M.race == usr.race)
							M << "<b><font color=yellow>(Race-Say) [usr]: [msg]</b>"

		Say(msg as text)
			set category = "Other"
			if(!usr)
				return
			if(usr.muted)
				alert("You are muted!")
				return
			if(msg == "")
				return
			if(usr.Filter(msg,tags))
				alert("No html allowed.")
				return
			if(length(msg) >= 200)
				alert("Your message is too long.")
				return
			if(usr.spamcheck == TRUE)
				outputMessage(usr,"<b>Please wait before talking again!","gametext")
				return
			else
				usr.spamcheck()
				if(!usr.textcolor)
					view(usr,8) << "<font color=cyan>(Say) [usr]: [msg]</font>"
				else
					view(usr,8) << "<font color=[usr.textcolor]>(Say) [usr]: [msg]</font>"
				text2file("[time2text(world.realtime)]:(say) [usr] says, [msg]","logs/log.txt")

		Whisper()
			set category = "Other"
			if(usr.muted)
				alert("You are muted!")
				return

			var/M = input("Who would you wish to whisper to?","Whisper") as null | anything in onlinePlayers - usr

			if(!M)
				outputMessage(src,"<b><font size = 1>There is nobody to whisper to.","gametext")
				return

			var/msg=input("What do you wish to whisper to [M]?")as text

			if(length(msg) >= 200)
				alert("Your message is too long.")
				return
			else
				usr <<"<b><font size = 1><font color = aqua>You whisper:<font color = white> [msg]"
				M <<"<b><font size = 1><font color = aqua>[usr] whispers:<font color = white> [msg]"


		Who2()
			set category = "Other"
			set name = "Online Admins"
			if(usr.who)
				return
			var/tmp/C=0
			usr.who = 1
			outputMessage(usr,"<font size=1><b><font color=red><center>----------------------WHO------------------------","gametext")
			for(var/mob/M in world)
				if(M.client)
					if(M.GM >= 1)
						C += 1
						outputMessage(usr,"<font size=1><font color=red>[M.name]([M.key])-{[M.guild_name]}{[M.soulpower]}{Floor: [M.floor]}","gametext")
			outputMessage(usr,"<font color = red>[C] Players Online!","gametext")
			sleep(150)
			usr.who = 0


		Who()
			set category = "Other"
			if(usr.who)
				return
			var/tmp/C=0
			usr.who = 1
			outputMessage(usr,"<font size=1><b><font color=red><center>----------------------WHO------------------------","gametext")
			for(var/mob/M in world)
				if(M.client)
					C += 1
					outputMessage(usr,"<font size=1><font color=red>[M.name]([M.key])-{[M.guild_name]}{[M.soulpower]}{Floor: [M.floor]}","gametext")
			outputMessage(usr,"<font color = red>[C] Players Online!","gametext")
			sleep(150)
			usr.who = 0

		Save()
			set category = "Other"
			var/savefile/save
			save = new ("playersaves/[usr.key]")
			save["mob"] << usr
			save["x"] << usr.x
			save["y"] << usr.y
			save["z"] << usr.z
			save["verbs"] << usr.verbs
			outputMessage(usr,"<font color=red><b>Your game has been saved!","gametext")


	/*	Rest()
			set category = "Training"
			if(usr.bowon)
				outputMessage(usr,"<b>Please remove your bow!","gametext")
				usr.cancelRest()
				usr.updateHud()
			if(usr.inshikai)
				outputMessage(usr," Convert to base state.")
				usr.cancelRest()
				usr.unreleaseShikai()
				usr.updateHud()
			if(usr.inbankai)
				outputMessage(usr," Convert to base state.")
				usr.cancelRest()
				usr.updateHud()
				src.unreleaseBankai()
			if(usr.inbankai2)
				outputMessage(usr," Convert to base state.")
				usr.cancelRest()
				usr.updateHud()
				src.unreleaseFinalBankai()
			if(usr.inSegundaEtapa||usr.inrelease)
				usr.cancelRest()
				usr.unrelease()
			if(usr.maskon)
				usr.maskoff()
			if(!usr.resting)
				outputMessage(usr,"<b>You close your eyes and begin to rest.","gametext")
				usr.healthRegen()
				usr.manaRegen()
				usr.resting = 1
				usr.frozen = 1
				usr.icon_state = "rest"
			else
				outputMessage(usr,"<b>You stop resting.","gametext")
				usr.cancelRest()
				usr.updateHud()

*/







		Givecor()
			set category = "Other"
			set name = "Send Cor"
			var/mob/M = input("Who would you like to give Cor to?","Choose a player.") as null | anything in onlinePlayers
			if(null)return
			if(!M) return
			if(M.client.address == usr.client.address)
				outputMessage(usr,"Cant send Cor to same household contact admin.","gametext")
				return
			if(M.client)
				var/R=input("How many Cor")as num
				if(usr.Cor < R)
					outputMessage(usr,"You dont have enough Cor.","gametext")
					return
				if(R < 0)
					outputMessage(src,"<b>y u do dis.","gametext")
					return
				if(usr.Cor>= R)
					outputMessage(M,"You have got [R] Cor from [usr].","gametext")
					M.Cor += R
					outputMessage(usr,"You have gave [M] [R] Cor.","gametext")
					usr.Cor -= R
					return













mob/verb/telefloor1()
	set category = "Other"
	set name = "Floor 1 Teleport"
	src.loc = locate(136,344,1)
	src.safe = 0
	src.inevent = 0



//Below are all verbs for releases which were originally coded into the hud.
//They won't be added to a usr until they meet the requirements, just like before.

mob/release
	verb

		TrueForm()
			set category = "Combat"
			set name = "True Form"
			if(usr.safe)
				outputMessage(usr,"<b>You are in a safe zone!</b>","gametext")
				return
			if(!usr.inhom)
				usr.inhom = 1
				rundelay = 1
				usr.frozen = 1
				usr.underlays += /obj/truthopen
				usr.overlays += 'hm3.dmi'
				usr.overlays += src.hair
				usr.resmod += 4
				usr.strmod += 4
				usr.reimod += 4
				usr.defmod += 4
				spawn(10)
					usr.underlays -= /obj/truthopen
					usr.frozen = 0
					return
			else
				usr.unreleasetrueform()







		ArchmageForm()
			set category = "Combat"
			set name = "Archmage Release"
			if(usr.safe)
				outputMessage(usr,"<b>You are in a safe zone!</b>","gametext")
				return
			if(!usr.inhoug)
				usr.inhoug = 1
				rundelay = 1
				usr.verbs += /mob/techniques/verb/KuyoShiban
				usr.resmod += 5
				usr.reimod += 5
				usr.rundelay = 1
				usr.overlays += 'hougwing.dmi'
				usr.overlays += /obj/hougw
				usr.overlays += /obj/hougw2
				return
			else
				usr.releaseHoug()



		BladeRelease()
			set category = "Combat"
			set name = "Blade Release"
			if(usr.safe)
				outputMessage(usr,"<b>You are in a safe zone!</b>","gametext")
				return
			if(usr.devil)
				return
			if(usr.armon == 0)
				usr.armon = 1
				usr.rundelay = 1
				addCD("BladeRelease")
				usr.overlays += 'wings4.dmi'
				usr.overlays += /obj/ulqui3
				usr.overlays += /obj/ulqui4
				usr.defmod += 5
				usr.strmod += 5


				return
			else
				if(usr.armon == 1)
					usr.armon = 0
					usr.overlays -= 'wings4.dmi'
					usr.overlays -= /obj/ulqui3
					usr.overlays -= /obj/ulqui4
					usr.rundelay = usr.defaultrundelay
					usr.strmod = usr.defaultstrmod
					usr.defmod = usr.defaultdefmod
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod




		EnchantSpeed()
			set category = "Combat"
			set name = "Enchanted Speed"
			if(usr.safe)
				outputMessage(usr,"<b>You are in a safe zone!</b>","gametext")
				return
			if(usr.devil)
				return
			if(!usr.armon)
				usr.armon = 1
				rundelay = 1
				spawn(120)
					usr.armon = 0
					outputMessage(usr,"Your speed returned to normal","gametext")
					rundelay = 2




		GMSpeed()
			set category = "GM"
			set name = "GMSpeed"
			if(usr.devil)
				return
			if(!usr.armon)
				usr.armon = 1
				rundelay = 1
				spawn(120)
				return


		GMFlight()
			set category = "GM"
			set name = "GMFlight"
			usr.density = 0
			usr.rundelay = 1
			return


		GMLand()
			set category = "GM"
			set name = "GMLand"
			usr.density = 1
			return