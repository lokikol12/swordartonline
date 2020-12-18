
mob
	var
		tmp/tourny2 = 0


var/tournament2 = 0





mob/Tournament
	verb
		Enter_Raid()
			set category = "Other"
			set name = "Enter Raid"
			if(usr.tourny2 == 1)
				outputMessage(usr,"<font color=white><b><u>You're already in the raid!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(70,40,2)
				usr.tourny2=1
				usr.inevent=1
				usr.safe=1
				outputMessage("world","<font color=white><b><u>[usr] has joined the raid!</font></b></u>","gametext")
		Leave_Raid()
			set category = "Other"
			set name = "Leave Raid"
			if(usr.tourny2 == 0)
				outputMessage("world","<font color=white><b><u>You're not in the raid!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(133,3,1)
				usr.tourny2=0
				usr.inevent=0
				usr.safe=0
				outputMessage("world","<font color=white><b><u>[usr] has left the raid!</font></b></u>","gametext")

mob/moderator
	verb
		Start_Raid2()
			set category = "GM"
			set name = "Start Raid Entry"
			if(tournament2 == 1)
				outputMessage(usr,"<font color=white><b><u>There is already a event being held!</font></b></u>","gametext")
				return
			else
				outputMessage("world","<center><font size=3><font color = Silver><b><center>[usr] has started raid entry 3 minutes untill battle.!<br><font size = 1>To join please go to Event tab and select Enter raid.","gametext")
				tournament2 = 1
				for(var/mob/M in world)
					M.verbs -=  /mob/verb/telefloor1
					M.verbs += new/mob/Tournament/verb/Enter_Raid()
					M.verbs += new/mob/Tournament/verb/Leave_Raid()
		Stop_Raid_Entance()
			set category = "GM"
			set name = "Start Raid Battle"
			if(tournament2 == 1)
				outputMessage("world","<center><font size=3><font color = Silver><b><center>The raid entry has now ended.","gametext")
				outputMessage("world","<font size=1><font color = red><b>The following people are in the raid","gametext")
				for(var/mob/M in world)
				 if(M.tourny2)
				  M.loc=locate(81,397,5)
				  M.safe = 0
				  outputMessage("world","[M]","gametext")
				for(var/mob/M in world)
					M.verbs -= new/mob/Tournament/verb/Enter_Raid()
					M.verbs -= new/mob/Tournament/verb/Leave_Raid()
			else
				outputMessage(usr,"<font color=white><b><u>There is no tournament being held!</font></b></u>","gametext")
				return
		End_Raid()
			set category = "GM"
			set name = "End Raid"
			if(tournament2 == 1)
				outputMessage("world","<center><font size=3><font color = Silver><b><center>[usr] has ended the raid.","gametext")
				tournament2 = 0
				for(var/mob/M in world)
					if(M.inevent)
						M.loc = locate(133,3,1)
						M.inevent=0
				for(var/mob/M in world)
					M.verbs -= new/mob/Tournament/verb/Enter_Raid()
					M.verbs -= new/mob/Tournament/verb/Leave_Raid()
			else
				outputMessage(usr,"<font color=white><b><u>There is no raid to end!</font></b></u>","gametext")
				return
		Raid_Announce()
			set category = "GM"
			set name = "Raid Announce"
			if(tournament2 == 1)
				var/ID=input("What do you wish to announce to the people in the raid?")as text
				if(ID == "")
					return
				else
					for(var/mob/M in world)
						if(M.tourny2 == 1)
							M << "<center><font size=2><font color = Silver><b><center>[usr] would like to raid announce!<center><br>[ID]"

			else
				outputMessage(usr,"<font color=white><b><u>There is no raid to announce to</font></b></u>","gametext")
				return

		Tourny_Fix2(mob/M as mob in world)
			set category = "GM"
			set name = "Raid Fix"
			if(M.tourny2 == 1)
				M.loc=locate(44,186,1)
				M.tourny2=0
				M.safe=0
				outputMessage("world","<b><font color = red>Info: [usr] has raid fixed [M].","gametext")
			else
				return


mob/Logout()
	src.verbs -= new/mob/Tournament/verb/Enter_Raid()
	src.verbs -= new/mob/Tournament/verb/Leave_Raid()


