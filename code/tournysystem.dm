/////////////////////////King-manga-man's Tournament System!///////////////////////////////
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
		tmp/tourny = 0

var/tournament = 0




mob/Tournament
	verb
		Enter_Tournament()
			set category = "Event"
			set name = "Enter Tournament"
			if(usr.tourny == 1)
				outputMessage(usr,"<font color=green><b><u>You're already in the tournament!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(266,344,5)
				usr.tourny=1
				usr.safe=0
				outputMessage("world","<font color=green><b><u>[usr] has joined the tournament!</font></b></u>","gametext")
		Leave_Tournament()
			set category = "Event"
			set name = "Leave Tournament"
			if(usr.tourny == 0)
				outputMessage(usr,"<font color=green><b><u>You're not in the tournament!</font></b></u>","gametext")
				return
			else
				usr.loc=locate(133,3,1)
				usr.tourny=0
				usr.safe=0
				outputMessage("world","<font color=green><b><u>[usr] has left the tournament!</font></b></u>","gametext")

mob/moderator
	verb
		Start_Tourny()
			set category = "GM"
			set name = "Start Tournament"
			if(tournament == 1)
				outputMessage(usr,"<font color=green><b><u>There is already a tournament being held!</font></b></u>","gametext")
				return
			else
				var/ID=input("You want to start a tournament? The Prize is 50mil Cor?")as text
				if(ID == "")
					return
				else
					outputMessage("world","<center><font size=3><font color = green><b><center>[usr] has started a tournament, the prize is 50M Cor!<br><font size = 1>To join please go to tournament tab and select Enter Tournament.","gametext")
					tournament = 1
					for(var/mob/M in world)
						M.verbs += new/mob/Tournament/verb/Enter_Tournament()
						M.verbs += new/mob/Tournament/verb/Leave_Tournament()
		Stop_Tourny_Entance()
			set category = "GM"
			set name = "Stop Tournament Entry"
			if(tournament == 1)
				outputMessage("world","<center><font size=3><font color=green><b><center>The tournament entry has now ended.","gametext")
				outputMessage("world","<font size=1><font color = red><b>The following people are in the tournament","gametext")
				for(var/mob/M in world)
				 if(M.tourny)
				  outputMessage("world","[M]","gametext")
				for(var/mob/M in world)
					M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
					M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			else
				outputMessage(usr,"<font color=green><b><u>There is no tournament being held!</font></b></u>","gametext")
				return
		End_Tourny()
			set category = "GM"
			set name = "End Tournament"
			if(tournament == 1)
				var/ID=input("You are now ending the tournament, who won?")as text
				if(ID == "")
					return
				else
					outputMessage("world","<center><font size=3><font color = green><b><center>[usr] has ended the tournament, the winner is [ID] and they will recieve their prize shortly.","gametext")
					tournament = 0
					for(var/mob/M in world)
						M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
						M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			else
				outputMessage(usr,"<font color=green><b><u>There is no tournament to end!</font></b></u>","gametext")
				return
		Tourny_Announce()
			set category = "GM"
			set name = "Tournament Announce"
			if(tournament == 1)
				var/ID=input("What do you wish to announce to the people in the tournament?")as text
				if(ID == "")
					return
				else
					for(var/mob/M in world)
						if(M.tourny == 1)
							M << "<center><font size=2><font color=green><b><center>[usr] would like to tournament announce!<center><br>[ID]"

			else
				outputMessage(usr,"<font color=green><b><u>There is no tournament to announce to</font></b></u>","gametext")
				return

		Tourny_Fix(mob/M as mob in world)
			set category = "GM"
			set name = "Tournament Fix"
			if(M.tourny == 1)
				M.loc=locate(133,3,1)
				M.tourny=0
				M.safe=0
				outputMessage("world","<b><font color = red>Info: [usr] has tournament fixed [M].","gametext")
			else
				return


mob/Logout()
	src.verbs -= new/mob/Tournament/verb/Enter_Tournament()
	src.verbs -= new/mob/Tournament/verb/Leave_Tournament()

turf/Tournament
	Tournament_Safe_Transfer
	Enter()
		if(usr.safe==0)
			usr.safe=0
			usr.loc=locate(133,3,1)
		else
			usr.safe=0
			usr.loc=locate(133,3,1)
