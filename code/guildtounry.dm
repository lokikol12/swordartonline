/////////////////////////King-manga-man's guildtournament System!///////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////yes i actually coded something lol ///////////////////////////////
////////////////////////i coded this from scratch so if your///////////////////////////////
///////////////////going to use this code please give credit to me/////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

mob
	var
		tmp/guildtourny = 0
		guildpoints = 0

var/guildtournament = 0




mob/guildtournament
	verb
		Enter_guildtournament()
			set category = "Event"
			set name = "Enter Guild Tournament"
			if(usr.guildtourny == 1)
				outputMessage(usr,"<font color=green><b><u>You're already in the Guild Tournament!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(266,344,5)
				usr.guildtourny=1
				usr.safe=0
				outputMessage("world","<font color=green><b><u>[usr] has joined the Guild Tournament!</font></b></u>","gametext")
		Leave_guildtournament()
			set category = "Event"
			set name = "Leave Guild Tournament"
			if(usr.guildtourny == 0)
				outputMessage(usr,"<font color=green><b><u>You're not in the Guild Tournament!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(133,3,1)
				usr.guildtourny=0
				usr.safe=0
				outputMessage("world","<font color=green><b><u>[usr] has left the Guild Tournament!</font></b></u>","gametext")

mob/moderator
	verb
		Start_guildtourny()
			set category = "GM"
			set name = "Start Guild Tournament"
			if(guildtournament == 1)
				outputMessage(usr,"<font color=green><b><u>There is already a Guild Tournament being held!</font></b></u>","gametext")
				return
			else
				var/ID=input("You want to start a Guild Tournament? The Prize is 10 Guild points?")as text
				if(ID == "")
					return
				else
					outputMessage("world","<center><font size=3><font color = green><b><center>[usr] has started a Guild Tournament, the prize is 10Guild points!<br><font size = 1>To join please go to Guild Tournament tab and select Enter Guild Tournament.","gametext")
					guildtournament = 1
					for(var/mob/M in world)
						M.verbs += new/mob/guildtournament/verb/Enter_guildtournament()
						M.verbs += new/mob/guildtournament/verb/Leave_guildtournament()
		Stop_guildtourny_Entance()
			set category = "GM"
			set name = "Stop Guild Tournament Entry"
			if(guildtournament == 1)
				outputMessage("world","<center><font size=3><font color=green><b><center>The Guild Tournament entry has now ended.","gametext")
				outputMessage("world","<font size=1><font color = red><b>The following people are in the Guild Tournament","gametext")
				for(var/mob/M in world)
				 if(M.guildtourny)
				  outputMessage("world","[M]","gametext")
				for(var/mob/M in world)
					M.verbs -= new/mob/guildtournament/verb/Enter_guildtournament()
					M.verbs -= new/mob/guildtournament/verb/Leave_guildtournament()
			else
				outputMessage(usr,"<font color=green><b><u>There is no Guild Tournament being held!</font></b></u>","gametext")
				return
		End_guildtourny()
			set category = "GM"
			set name = "End Guild Tournament"
			if(guildtournament == 1)
				var/ID=input("You are now ending the Guild Tournament, who won?")as text
				if(ID == "")
					return
				else
					outputMessage("world","<center><font size=3><font color = green><b><center>[usr] has ended the Guild Tournament, the winner is [ID] and they will recieve their prize shortly.","gametext")
					guildtournament = 0
					for(var/mob/M in world)
						M.verbs -= new/mob/guildtournament/verb/Enter_guildtournament()
						M.verbs -= new/mob/guildtournament/verb/Leave_guildtournament()
			else
				outputMessage(usr,"<font color=green><b><u>There is no guildtournament to end!</font></b></u>","gametext")
				return
		guildtourny_Announce()
			set category = "GM"
			set name = "Guild Tournament Announce"
			if(guildtournament == 1)
				var/ID=input("What do you wish to announce to the people in the Guild Tournament?")as text
				if(ID == "")
					return
				else
					for(var/mob/M in world)
						if(M.guildtourny == 1)
							M << "<center><font size=2><font color=green><b><center>[usr] would like to Guild Tournament announce!<center><br>[ID]"

			else
				outputMessage(usr,"<font color=green><b><u>There is no Guild Tournament to announce to</font></b></u>","gametext")
				return

		guildtourny_Fix(mob/M as mob in world)
			set category = "GM"
			set name = "Guild Tournament Fix"
			if(M.guildtourny == 1)
				M.loc=locate(133,3,1)
				M.guildtourny=0
				M.safe=0
				outputMessage("world","<b><font color = red>Info: [usr] has Guild Tournament fixed [M].","gametext")
			else
				return


mob/Logout()
	src.verbs -= new/mob/guildtournament/verb/Enter_guildtournament()
	src.verbs -= new/mob/guildtournament/verb/Leave_guildtournament()

turf/guildtournament
	guildtournament_Safe_Transfer
	Enter()
		if(usr.safe==0)
			usr.safe=0
			usr.loc=locate(133,3,1)
		else
			usr.safe=0
			usr.loc=locate(133,3,1)
