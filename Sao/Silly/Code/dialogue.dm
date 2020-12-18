

client/secretVerbs/verb/nextDialogue()
	set hidden = 1
	showDialogue()

client/var/tmp
	dialogueNum; dialogueCount
	list/dialogueQueu = list()

client/proc/addDialogue(speaker,text)
	if(!text)return
	dialogueNum++
	dialogueQueu["[dialogueNum]"] = list(speaker,text)
	if(dialogueNum<=1) showDialogue()


client/proc/showDialogue()
	if(!guiToggles["dialogue"])
		guiToggles["dialogue"]=1
		if(!src.mob.screen.hud["dialogue"])
			var/tmp/obj/UI/dialogue/dialogue = new
			mob.screen.Add("dialogue",dialogue)
			mob.screen.Show("dialogue")
		animate(src.mob.screen.hud["dialogue"][1], pixel_y=0, time=1)

	if(dialogueNum > dialogueCount)
		dialogueCount++
		mob.frozen = 1
		verbs += /client/secretVerbs/verb/nextDialogue
		src.mob.screen.hud["dialogue"][1].maptext = "<text align=left valign=top><span style='-dm-text-outline:1px black OUTLINE_SHARP;color:white;font-size:10pt;font-weight:bold'>[dialogueQueu["[dialogueCount]"][1]]<span>\
		<br><text align=left valign=top><span style='-dm-text-outline:1px black OUTLINE_SHARP;color:white;font-size:8pt;font-weight:bold'>[dialogueQueu["[dialogueCount]"][2]]<span>"
		dialogueQueu -= "[dialogueCount]"
		winset(src, "interact", "parent=macro;name=Space;command=nextDialogue")
		//world << "set to dialogue"
		return
	guiToggles["dialogue"]=0
	winset(src, "interact", "parent=macro;name=Space;command=Interact")
	//world << "gets called to interact"

	mob.frozen = 0
	animate(src.mob.screen.hud["dialogue"][1], pixel_y=-72, time=1)
	verbs -= /client/secretVerbs/verb/nextDialogue
	dialogueNum = 0; dialogueCount = 0

