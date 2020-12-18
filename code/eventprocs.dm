world
	proc
		Start_Raid()
			set category = "GM"
			set name = "Start Raid Entry"
			if(tournament2 == 1)
				outputMessage(usr,"<font color=white><b><u>There is already a event being held!</font></b></u>","gametext")
				return
			else
				outputMessage("world","<center><font size=3><font color = yellow><center>Raid entry 3 minutes untill battle.!<br><font size = 1>To join please go to Event tab and select Enter raid.","gametext")
				tournament2 = 1
				spawn(1000)
				Stop_Raid_Entance()
				for(var/mob/M in world)
					M.verbs -=  /mob/verb/telefloor1
					M.verbs += new/mob/Tournament/verb/Enter_Raid()
					M.verbs += new/mob/Tournament/verb/Leave_Raid()

world
	proc
		Stop_Raid_Entance()
			set category = "GM"
			set name = "Start Raid Battle"
			if(tournament2 == 1)
				outputMessage("world","<center><font size=3><font color = yellow><b><center>The raid entry has now ended.","gametext")
				outputMessage("world","<font size=1><font color = red><b>The following people are in the raid","gametext")
				spawn(6000)
				End_Raid()
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


world
	proc
		End_Raid()
			set category = "GM"
			set name = "End Raid"
			if(tournament2 == 1)
				outputMessage("world","<center><font size=3><font color = yellow><b><center>Raid ended the raid.","gametext")
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



		discord()
			world << "<b><font color = red>Join on us Discord https://discord.gg/m8FBFU4 </br> Join us on Youtube https://www.youtube.com/channel/UCP2BTQgbPpZ1BIVS4pANo3Q "







world
	proc
		DoubleExp()
			for(var/mob/M in world)
				if(M.client)
					M.doubleexp = 1
					outputMessage(M,"<b><font color= yellow>Double Exp has started</b></font>","gametext")
					spawn(30000)
						for(var/mob/E in world)
							if(E.doubleexp == 1)
								outputMessage(E,"<b><font color = yellow>Double Exp has ended</b></font>","gametext")
								E.doubleexp = 0

		DoubleCor()
			for(var/mob/M in world)
				if(M.client)
					M.doublecor = 1
					outputMessage(M,"<b><font color= yellow>Double Cor drops has started</b></font>","gametext")
					spawn(30000)
						for(var/mob/E in world)
							if(E.doublecor == 1)
								outputMessage(E,"<b><font color = yellow>Double Cor drops has ended</b></font>","gametext")
								E.doublecor = 0


		Doubledoublestatgain()
			for(var/mob/M in world)
				if(M.client)
					M.doublestatgain = 1
					outputMessage(M,"<b><font color= yellow>Stat Point Event has started</b></font>","gametext")
					spawn(30000)
						for(var/mob/E in world)
							if(E.doublestatgain == 1)
								outputMessage(E,"<b><font color = yellow>Stat point event has ended</b></font>","gametext")
								E.doublestatgain = 0