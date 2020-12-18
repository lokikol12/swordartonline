mob
	var foundsword = 0, quest1 = 0


mob
 Quest
  icon = 'missionman.dmi'
  name = "{NPC}Grimm's Adventures."
  npc = 1
  verb
   Talk()
    set category = "NPC's"
				set src in oview(2)
    switch(input("Would you like to turn in your mysterious points?","Hollow Hunter",text) in list ("Yes","No"))
			  if("Yes")
			   switch(input("Which reward have you met?","Hollow Hunter",text) in list ("Low rewards","Medium rewards","Hard rewards"))
		     if("Low rewards")
		     	if(usr.soulpower >= 10)
		     		usr << "<b><font color = gray>And you Reward is [usr.Dkills * 20] Exp.</b></font>"
		     		usr.exp += 20 * usr.Dkills
		     		usr.statpoints += 1 * usr.Dkills
		     		usr.Dkills = 0
		     		sleep(500)
		     	else
		     		usr << "<b><font color = gray>You need to be level 10.</b></font>"
		     if("Medium rewards")
		     	if(usr.soulpower >= 50)
		     		usr << "<b><font color = gray>And you Reward is [usr.Skills * 50] Exp.</b></font>"
		     		usr.exp += 50 * usr.Skills
		     		usr.statpoints += 2 * usr.Skills
		     		usr.Skills = 0
		     		sleep(500)
		     	else
		     		usr << "<b><font color = gray>You need to be level 50.</b></font>"
		     if("Hard rewards")
		     	if(usr.soulpower >= 150)
		     		usr << "<b><font color = gray>And you Reward is [usr.Mkills * 150] </b></font>"
		     		usr.exp += 150 * usr.Mkills
		     		usr.statpoints += 4 * usr.Mkills
		     		usr.Mkills = 0
		     		sleep(500)
		     	else
		     		usr << "<b><font color = gray>You need to be level 150.</b></font>"

