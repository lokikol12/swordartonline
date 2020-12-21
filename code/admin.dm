mob
	var
		tele = 0

//verbs for moderators
// alright so now your coding well almost lets start small, project 1 click enemies tab and find better names for all of the mobs change the names by jus deleteing and putting in new ones
//note dont change the mobs var name ie barra change the mobs output name ie name = "Barragon" and keep the ""
// yoyo so starting out dont change any codes if your un sure jus ask first
var/list/mutedPlayers


mob/moderator
	verb






		Admin_Say(msg as text)
			set category = "GM"
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
						if(M.GM >= 1)
							M << "<b><font color=yellow>(Admin-Say) [usr]: [msg]</b>"





		EventWho()
			set category = "GM"
			set name = "Event Who"
			if(usr.who)
				return
			var/tmp/C=0
			usr.who = 1
			outputMessage(usr,"<font size=1><b><font color=red><center>----------------------WHO------------------------","gametext")
			for(var/mob/M in world)
				if(M.client)
					if(M.inevent == 1)
						C += 1
						outputMessage(usr,"<font size=1><font color=red>[M.name]([M.key])-{[M.guild_name]}{[M.soulpower]}{Floor: [M.floor]}","gametext")
			outputMessage(usr,"<font color = red>[C] Players in Event!","gametext")
			sleep(150)
			usr.who = 0

		Reboot()
			set name = "Reboot"
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = red>World Rebooting in 30 seconds. Save! This was triggered by [usr]!" //left these messages to show up in normal chat.
			sleep(100)
			world << "<b><font color = red>World Rebooting in 20 seconds. Save!"
			sleep(100)
			world << "<b><font color = red>World Rebooting in 10 seconds. Save!"
			sleep(100)
			world.Reboot()

		Prize4()
			set category = "GM"
			set name = "Guild prize 10pts"
			var/mob/M = input("Who would you like to reward?","Choose a player.") as null | anything in onlinePlayers
			if(!M) return
			outputMessage(world,"<b>[usr] has rewarded [M]!","gametext")
			M.guildpoints += 10


		DoubleExp2()
			set name = "Double Exp event"
			set category = "GM"
			for(var/mob/M in world)
				if(M.client)
					M.doubleexp = 1
					outputMessage(M,"<font color =green>Double Exp has started</font>","gametext")
					spawn(40000)
						if(M.doubleexp == 1)
							M.doubleexp = 0
							outputMessage(M,"<font color =green>Double Exp has ended</font>","gametext")


		DoubleCor2()
			set name = "Double Cor event"
			set category = "GM"
			for(var/mob/M in world)
				if(M.client)
					M.doublecor = 1
					outputMessage(M,"<font color = green>Double Cor has started</font>","gametext")
					spawn(40000)
						if(M.doublecor == 1)
							M.doublecor = 0
							outputMessage(M,"<font color =green>Double Cor has ended</font>","gametext")

		Doublestatgain()
			set name = "Stat Point Event"
			set category = "GM"
			for(var/mob/M in world)
				if(M.client)
					M.doublestatgain = 1
					outputMessage(M,"<font color = green>Stat point Event has started</font>","gametext")
					spawn(40000)
						if(M.doublestatgain == 1)
							M.doublestatgain = 0
							outputMessage(M,"<font color =green>Stat point event has ended</font>","gametext")




		endDoubleCor2()
			set name = "Double Cor End"
			set category = "GM"
			for(var/mob/M in world)
				M.doublecor = 0

		endDoubleexp2()
			set name = "Double Exp End"
			set category = "GM"
			for(var/mob/M in world)
				M.doubleexp = 0


		FixSword()
			set category = "GM"
			set name = "Sword & staff Fix"
			var/mob/M = input("Who would you like to fix?","Choose a player.") as null | anything in onlinePlayers
			if(!M) return
			outputMessage(M,"<b>[usr] has fixed you!","gametext")
			outputMessage(usr,"<b>[M] has been fixed by you!","gametext")
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

		Fix()
			set category = "GM"
			set name =  "Fix Overlays & Frozen"

			if(usr.lock)
				return

			var/mob/M = input("Who would you like to fix?","Choose a player.") as null | anything in onlinePlayers
			if(!M) return
			outputMessage(M,"<b>[usr] has fixed you!","gametext")
			outputMessage(usr,"<b>[M] has been fixed by you!","gametext")
			M.overlays = 0
			M.icon = 'base.dmi'
			M.sight = 0
			M.loc = usr.loc
			M.frozen = 0
			M.invisibility = 0
			M.safe = 0
			M.resting = 0
			M.underlays = 0
			M.firing = 0

		Boot()
			set name = "Boot"
			set category = "GM"
			if(src.lock)
				return
			var/mob/M = input("Who would you like to boot?","Choose a player.") as null | anything in onlinePlayers - src
			if(!M)
				src << "\red There is nobody to boot."
				return
			if(src.client)
				if(M.GM >= usr.GM)
					return
				if(M.key=="Nenriki"||M.key=="Kodra777"||M.key=="Nintares")
					return
				if(M != null)
					var/R = input("Why are you booting [M.name]?","Boot") as text|null
					if(R == "" ||R == null)
						outputMessage(world,"<b><font color = red>GM Info: [src] has booted [M]","gametext")
					else
						outputMessage(world,"<b><font color = red>GM Info: [src] has booted [M] ([R])","gametext")
					del(M.client)
					if(M)
						del(M)

		Mute()
			set category = "GM"
			if(usr.lock)
				return
			var/mob/M = input("Who would you like to mute?","Choose a player.") as null | anything in onlinePlayers
			if(!M)
				src << "\red There is nobody to mute."
				return
			//if(M.GM >= usr.GM)
				//return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					var/Reason=input("Why are you muting [M]?")as null|text
					if(!Reason)
						return
					else
						if(!mutedPlayers) mutedPlayers = list()
						mutedPlayers += M
						outputMessage(world,"<b><font size = 1><font color = red>[M] has been muted by [src]. ([Reason])","gametext")
						M.muted=1
						return text2file("[time2text(world.realtime)]: [M] was muted by [usr]<BR>","logs/GMlog.html")
				if("No")
					return

		Unmute()
			set category = "GM"

			if(usr.lock)
				return
			if(!mutedPlayers)
				src << "\red Nobody is currently muted."
				return
			var/mob/M = input("Who would you like to unmute?","Choose a player.") as null | anything in mutedPlayers
			if(!M) return


			M.muted = 0
			outputMessage(world,"<b><font size=1><font color = red>GM Info: [src] unmutes [M]","gametext")
			text2file("[time2text(world.realtime)]: [M] was unmuted by [usr]<BR>","logs/GMlog.html")


		Summon(mob/M in world)
			set name = "Summon"
			set category = "GM"
			if(usr.lock)
				return
			if(M.enemy||M.vailast)
				return
			if(M.npc)
				return
			if(M!=src)
				M.loc = locate(src.x,src.y,src.z)
				M.safe = 0

		Teleport(mob/M in world)
			set category = "GM"
			if(usr.lock)
				return
			if(M.enemy||M.vailast)
				return
			if(M.tele)
				return
			else
				src.loc = locate(M.x,M.y,M.z)
				src.safe = 0

		Announce(txt as text)
			set name = "Announce"
			set category = "GM"
			world << "<font size=3><font color = red><b><center>[usr] would like to announce:<center><br>[txt]"




mob/admin
	verb
		Rename(mob/M as mob in world)
			set category="GM"
			if(src.lock)
				return
			if(M.key=="Nenriki"&&src.key!="Nenriki"||M.key=="Kodra777"&&src.key!="Kodra777"||M.key=="Nintares"&&src.key!="Nintares")
				return
			if(M!=src)
				return
			var/ID=input("What do you wish to rename [M]'s name to?")as text
			if(ID == "")
				outputMessage(src,"Don't leave names blank.","gametext")
				return
			outputMessage(world,"<b><font color = yellow>Info: [usr] has changed [M]'s name to [ID]!","gametext")
			M.name=ID



		World_Mute_Toggle()
			set name = "World Mute"
			set category = "GM"
			if(usr.lock)
				return
			if(worldC == 1)
				world << "<b><font color = red>GM Info: [src] mutes the world!" //left these messages to show up in normal chat.
				worldC=0
			else
				world << "<b><font color = red>GM Info: [src] unmutes the world!"
				worldC=1

		Key_Ban(mob/M in world)
			set category = "GM"
			set name = "Ban(key)"
			if(usr.lock)
				return
			if(M.GM >= usr.GM)
				return
			if(!M)
				return
			if(M==src)
				return
			if(M.key=="Nenriki"||M.key=="Kodra777"||M.key=="Nintares")
				return
			if(M.key != null)
				Bans.Add(M.key)
				Bans[M.key]="[M.client.address]"
				outputMessage(world,"<b><font size=1><font color = red>GM Info: [M] has been banned by [usr].(Key)","gametext")
				del(M.client)
				if(M)
					del(M)

		UnBanKey(Key in Bans)
			set category = "GM"
			set name = "Unban(key)"
			if(usr.lock)
				return
			if(!Key)
				return
			var/confirm=input(usr,"Unban","Are you sure you want to unban [Key]?") in list("Yes","No")
			switch(confirm)
				if("Yes")
					Bans.Remove(Key)
					outputMessage(world,"<b><font size=1><font color = red>GM Info: [Key] has been unbanned by [usr].(Key)","gametext")
				if("No")
					return

		IPBan(mob/M in world)
			set category = "GM"
			set name = "Ban(IP)"
			if(src.lock)
				return
			if(M.GM >= src.GM)
				return
			if(!M) return
			if(M==src)
				return
			if(M.key=="Nenriki"||M.key=="Kodra777"||M.key=="Nintares")
				return
			if(M.key != null)
				IPBans.Add(M.client.address)
				var/savefile/save
				save = new ("worldsaves/Bans.sav")
				save["IPBans"] << IPBans
				outputMessage(world,"<b><font size=1><font color = red>GM Info: [M] has been banned by [usr].(IP)","gametext")
				del(M.client)
				if(M)
					del(M)
				return

		UnBanIP(IP in IPBans)
			set category = "GM"
			set name = "Unban(IP)"
			if(usr.lock)
				return
			if(!IP)
				return
			var/confirm=input(usr,"Unban","Really unban [IP]?") in list("Yes","No")
			switch(confirm)
				if("Yes")
					IPBans.Remove(IP)
					outputMessage(world,"<b><font size=1><font color = red>GM Info: [IP] has been unbanned by [usr].(IP)","gametext")
				if("No")
					return

		Kill(mob/M in world)
			set category = "GM"
			if(M.key=="Nenriki"&&src.key!="Nenriki"||M.key=="Kodra777"&&src.key!="Kodra777"||M.key=="Nintares"&&src.key!="Nintares"||M.key=="Ace128"&&src.key!="Ace128")
				return
			M.safe = 0
			M.health = 0
			M.Death(usr)

mob/owner
	verb
		Tele_Togle()
			set category = "GM"
			if(usr.tele==0)
				usr.tele = 1
				outputMessage(usr,"<font color=silver size=4>You now cant be teleported to","gametext")
			else
				usr.tele = 0
				outputMessage(usr,"<font color=silver size=4>You can now be teleported to","gametext")

		Login_Access_Toggle()
			set category = "GM"
			set name = "Toggle world private"
			if(src.lock)
				return
			if(private == 1)
				outputMessage(world,"<b><font color = red>GM Info: The world is public now!","gametext")
				private=0
			else
				outputMessage(world,"<b><font color = red>GM Info: The world is private now!","gametext")
				private=1





		Make_GM(mob/M in world)
			set category = "GM"
			if(usr.lock)
				return
			switch(input("What GM level do you wish to give them?", text) in list ("Moderator","Admin","Cancel",))
				if("Moderator")
					M.verbs += typesof(/mob/moderator/verb)
					M.GM = 1
				if("Admin")
					M.verbs += typesof(/mob/admin/verb)
					M.GM = 2
				if("Cancel")
					return

		Remove_GM(mob/M in world)
			set category = "GM"
			if(usr.lock)
				return
			if(M.key=="Nenriki"||M.key=="Kodra777")
				return
			M.verbs -= typesof(/mob/moderator/verb)
			M.verbs -= typesof(/mob/admin/verb)
			M.GM = 0

		WipeHouses()
			set category = "GM"
			set name = "Wipe house files"
			for(var/turf/telehouses/T in world)
				if(fexists("housesaves/[T.house]/"))
					fdel("housesaves/[T.house]/")
					outputMessage(usr,"<font color=read><b>House number [T.house] has been wiped of ownership.</b></font>", "gametext")


		Edit(mob/O in world)
			set name = "Edit"
			set category = "GM"
			var/variable = input("Which var?","Var") in O:vars + list("Cancel")
			if(variable == "Cancel")
				return
			var/default
			var/typeof = O:vars[variable]
			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
					text2file("[time2text(world.realtime)]: [O] was restored to default by [usr]<BR>","logs/GMlog.html")
				if("Text")
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
					text2file("[time2text(world.realtime)]: [O] had one of his [variable] edited with text by [usr]<BR>","logs/GMlog.html")
				if("Num")
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
					text2file("[time2text(world.realtime)]: [O] had one of his [variable] edited with numbers by [usr]<BR>","logs/GMlog.html")
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null

		Boost(mob/M in world)
			set category = "GM"
			switch(input("Are you sure you want to give [M] a stat boost?") in list("Yes","No"))
				if("Yes")
					var/percentage=input("Enter a boost percentage up to 100%")as num
					if(percentage<=0||percentage>100)
						return
					else
						outputMessage(M,"<b>You have received a [percentage]% stat boost.</b>","gametext")
						M.mhealth += M.mhealth*(percentage/100) //divide input by 100 to get correct percentage
						M.mreiryoku += M.mreiryoku*(percentage/100)
						M.mstrength += M.mstrength*(percentage/100)
						M.strength = M.mstrength //set current strength equal to maxattack, since max is the stat that is increased
						M.mdefence += M.mdefence*(percentage/100)
						M.defence = M.mdefence //set current defence equal to maxdefence, since max is the stat that is increased
						M.mreiatsu += M.mreiatsu*(percentage/100)
						M.reiatsu = M.mreiatsu
						M.skill()
				if("No")
					return

		Create()
			set name = "Create"
			set category = "GM"
			if(usr.lock)
				return
			var/varItem
			var/varType = input("What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
			if(varType == "Cancel") //checks selection from first prompt
				return
			if(varType == "Object") //checks selection from first prompt
				varItem = input("What do you want to make?","Create obj") in typesof(/obj) + list("Cancel")
			if(varType == "Mob") //checks selection from first prompt
				varItem = input("What do you want to make?","Create mob") in typesof(/mob) + list("Cancel")
			if(varType == "Turf") //checks selection from first prompt
				varItem = input("What do you want to make?","Create turf") in typesof(/turf) + list("Cancel")
			if(varItem == "Cancel") //checks selection from second prompt(list of chosen type)
				return
			else //if it's not cancelled in first or second prompt, create item of choice
				new varItem(locate(src.x,src.y-1,src.z))

		SaveHouses()
			set category = "GM"
			set name = "Save all houses"
			savehouses()

		Delete(M as obj in view(8))
			set name = "Delete"
			set category = "GM"
			if(usr.lock)
				return
			outputMessage(src,"[M] has been deleted.","gametext")
			del(M)

		GiveVerb()
			var/tmp/list/targets = list()
			set category = "GM"
			set name = "Give verb"
			for(var/mob/M in world)
				if(!M.client)
					continue
				targets += M
			var/mob/M = input("Who would you like to give a verb?","Give verb") as null|mob in targets
			if(!M)
				return
			var/Vlist = typesof(/mob/verb/,/mob/techniques/verb/,/mob/moderator/verb/,/mob/admin/verb/,/mob/release/verb/)
			if(!Vlist)
				return
			var/verb/V = input("Which verb do you want to give [M]?", "Give verb") as null|anything in Vlist
			if(!V)
				return
			M.verbs += V
			outputMessage(usr,"You have given [M] the [V] verb.","gametext")

		RemoveVerb()
			var/tmp/list/targets = list()
			set category = "GM"
			set name = "Remove verb"
			for(var/mob/M in world)
				if(!M.client)
					continue
				targets += M
			var/mob/M = input("Who would you like to remove a verb from","Give verb") as null|mob in targets
			if(!M)
				return
			var/verb/V = input("Which verb do you want to remove [M]?", "Give verb") as null|anything in M.verbs
			if(!V)
				return
			M.verbs -= V
			outputMessage(usr,"You have removed [M]'s [V] verb.","gametext")

		EditTraits()
			var/tmp/list/targets = list()
			set category = "GM"
			set name = "Edit Traits"
			for(var/mob/M in world)
				if(!M.client)
					continue
				targets += M
			var/mob/M = input("Who would you like to remove a verb from","Give verb") as null|mob in targets
			if(M==null)
				return
			var/choice
			if(!M.client)
				return
			switch(input("What would you like to do?","Edit Traits") as null|anything in list("Add","Remove"))
				if(null)
					return
				if("Add")
					choice = input("Which trait would you like to add?","Edit Traits") as null|anything in list("LevelLimit","LevelLimit2","Saiyan","BetaTester","PhilosophersStone","Stubborn","Zaraki","Legendary Vaizard","Kurosaki","HighSpeed","Ishida","Vaizard","Hierro","Vasto","Kuchiki")
					if(choice==null)
						return
					if(choice in M.traits)
						usr << "<b>[M] already has [choice]</b>"
					else
						M.traits += choice
						usr << "<b>[choice] has been added to [M]'s traits</b>"
				if("Remove")
					choice = input("Which trait would you like to remove?","Edit traits") as null|anything in M.traits
					if(choice==null)
						return
					if(!(choice in M.traits))
						usr << "<b>[M] doesn't have [choice]</b>"
					else
						M.traits -= choice
						usr << "<b>[choice] has been removed from [M]'s traits</b>"
