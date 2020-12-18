mob/owner/verb/GiveSub(mob/M in oview(5))
	set category = "GM"
	M.verbs += /mob/techniques/verb/SubBuff
	M.traits += "Rebirth1"
	M.sub = 1

mob/moderator/verb/GiveFanBuff(mob/M in oview(10))
	set category = "GM"
	M.verbs += /mob/techniques/verb/FanBuff
	outputMessage(M,"<folor color=gold>Thanks for Favoriting the game!</font>","gametext")

mob/techniques/verb/FanBuff()
	set category = "Other"
	set name = "Fan Buff"
	if(usr.fan == 1)
		outputMessage(usr,"<b>You have already got your Fan Buff</b>")
		return
	if(usr.fan == 0)
		usr.sub = 1
		usr.statpoints += 10000
		usr.exp += 50000
		usr.Cor += 5000000
		usr.verbs -= /mob/techniques/verb/FanBuff
		outputMessage(usr,"<b>You have got your Fan buff</b>","gametext")


mob/techniques/verb/SubBuff()
	set category = "Sub"
	set name = "Sub Buff"
	if(usr.subbuff == 1)
		outputMessage(usr,"<b>You have already got your Sub Buff</b>")
		return
	if(usr.subbuff == 0)
		usr.subbuff = 1
		usr.statpoints += 100000
		usr.exp += 5000000
		usr.Cor += 100000000
		usr.verbs -= /mob/techniques/verb/SubBuff
		outputMessage(usr,"<b>You have got your one time sub buff</b>","gametext")


