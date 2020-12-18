var/list/mobEnemyList = null


mob/Login()
	..()
	populateEnemyList()

proc/populateEnemyList()

	if(mobEnemyList) return

	mobEnemyList = list()

	for(var/mob/enemy/t in world)
		if(!mobEnemyList[t.type]) mobEnemyList[t.type] = t

client

	var Quest/quest = null
	var/questHudStatus = null
	var/list/questsList
	var/list/hud
	var/questGuiOffset = 36
	var/list/questCapacity = list(0,6)
	var/list/populateQuestUI


	proc/initQuestList()
		if(!quest) quest = new()
		if(!questsList) questsList = list()
		if(!questsList["ongoing"]) questsList["ongoing"] = list()
		if(!questsList["complete"]) questsList["complete"] = list()

	proc/initQuestGui()

		var/obj/UI/Quest/title/title = new
		var/obj/UI/Quest/titleUI/titleUI = new
		src.mob.screen.Add("QuestTitle", list(title,titleUI))
		var/obj/UI/Quest/background/questInfo = new
		src.mob.screen.Add("QuestInfo", questInfo)

	//Maybe make list/killTracker accept multiple mobs later
	proc/gainExp(amount)
		if(!amount) return
		src.mob.exp += amount
		outputMessage(src,"<span style='color:yellow;font-size:2;font-weight:bold'>You were awarded </span><span style='color:white;font-size:2;font-weight:bold'>[amount]</span><span style='color:yellow;font-size:2;font-weight:bold'> experience</span>", "gametext")
		src.mob.levelup()

	proc/getSoulFragments(amount)
		if(!amount) return
		src.mob.Cor += amount
		outputMessage(src,"<span style='color:yellow;font-size:2;font-weight:bold'>You were awarded </span><span style='color:white;font-size:2;font-weight:bold'>[amount]</span><span style='color:yellow;font-size:2;font-weight:bold'> soul fragments!</span>", "gametext")

	proc/trackQuestKills(mob/m)
		if(!m) return
		for(var/Quest/t in questsList["ongoing"])
			if(!t.killTracker) return

			var/i
			for(i=1, i<=t.killTracker.len, i++)

				var/enemy = t.killTracker[i][1]

				if(istype(m, enemy))

					if(t.killTracker[i][2] < t.killTracker[i][3])
						t.killTracker[i][2]++
						outputMessage(src,"<span style='color:yellow;font-size:2;font-weight:bold'>[t.name]: [m.name]</span> <span style='color:red;font-size:2;font-weight:bold'>([t.killTracker[i][2]]/[t.killTracker[i][3]])","gametext")
					checkQuestCompletion(t)


	//add more conditions later. Currently it only has a mob kill tracker
	proc/checkQuestCompletion(Quest/q)

		if(q.killTracker)
			if(guiToggles["quest"] == 1 && src.mob.screen.hud["QuestInfo"][1].maptext != null) //hack. kek.
				displayQuestSummary(q)
			var/i
			for(i=1, i<=q.killTracker.len, i++)
				var/cKills = q.killTracker[i][2]
				var/nKills = q.killTracker[i][3]
				if(nKills > cKills) return



			completeQuest(q)

	proc/addQuest(Quest/qPath,t)

		if(!qPath) return

		if(questCapacity[1] >= questCapacity[2])
			outputMessage(src,"<span style='font-color:white;font-size:2;font-weight:bold'>You can't do more than [questCapacity[2]] quests at the same time.</span>","gametext")
			return
		for(var/Quest/q in questsList["ongoing"])
			if(qPath.name == questsList["ongoing"][q].name)
				addDialogue("Narrator", "[qPath.name] is an already ongoing quest.")
				return


		if(!questsList["ongoing"]) questsList["ongoing"] = list()


		if(qPath.req)
		{
			if(qPath.req["level"] && mob.soulpower < qPath.req["level"])
				outputMessage(src,"<span style='font-color:red;font-size:2;font-weight:bold'>You need to be level [qPath.req["level"]]+ for this quest!","gametext")
				return

			if(qPath.req["prevQuest"] == null || !qPath.req["prevQuest"])
				goto goHere

			var/Quest/prevQuest = qPath.req["prevQuest"]
			var findPrev = questsList["complete"].Find(prevQuest)

			if(!findPrev)
			{
				outputMessage(src,"<span style='font-color:red;font-size:2;font-weight:bold'>Previous Quest has not been completed yet.","gametext")
				return
			}


		}
		goHere
		if(!t) addDialogue("Narrator","<span style='color:red;font-size:2;font-weight:bold'>[qPath.name] was added to quests.")
		questsList["ongoing"][qPath] += qPath
		questCapacity[1]++

		if(qPath.killTracker)
			var xPos = 0
			var/i
			for(i=1, i<=qPath.killTracker.len, i++)
				if(mobEnemyList[qPath.killTracker[i][1]])
					xPos += 32
					var/obj/o = new
					o.appearance = mobEnemyList[qPath.killTracker[i][1]].appearance
					o.plane = 110
					o.pixel_x = 258
					o.pixel_y = 250
					o.pixel_x += xPos
					o.maptext_y = -20
					src.mob.screen.Add("QuestKillTargets",o)
		/* breaks saving for whatever fucking reason. Add in later.
		if(qPath.rewards["items"])
			var xPos = 0
			var/i
			for(i=1, i<=qPath.rewards["items"].len, i++)
				xPos += 32
				var/obj/UI/itemRewards/o = new(qPath.rewards["items"][i])
				o.pixel_x = 364
				o.pixel_x += xPos
				var/obj/UI/itemInteraction/itemInteraction = new(qPath.rewards["items"][i])
				itemInteraction.pixel_x = o.pixel_x;itemInteraction.pixel_y = o.pixel_y

				src.mob.screen.Add("QuestItemReward",list(o,itemInteraction))
		*/
		populateQuestGui()

		if(guiToggles["quest"] == 1)
			clearQuestList()
			populateQuestGui()
			clearQuestSummary()
			//clearQuestList()


	proc/repeatQuest(Quest/qPath)
		if(!qPath.auto_repeat) return
		addQuest(qPath)
		var/i
		for(i=1, i<=qPath.killTracker.len, i++)
			qPath.killTracker[i][2] = 0



	proc/completeQuest(Quest/qPath)

		if(!qPath)return
		if(!qPath || !questsList["ongoing"][qPath]) return
		outputMessage(src,"<span style='color:green;font-size:2;font-weight:bold'> [qPath.name] was completed!","gametext")
		questCapacity[1]--
		questRewards(qPath)

		if(guiToggles["quest"] == 1)

			var/q = questsList["ongoing"].Find(qPath,1,questsList["ongoing"].len)
			//reposition quests to fill void
			if(q < questsList["ongoing"].len)
				var/i
				//world << questsList["ongoing"].len
				for(i=q+1, i<=questsList["ongoing"].len, i++)
					if(!(src.mob.screen.hud[questsList["ongoing"][i]])) return
					var/a
					for(a=1, a<=src.mob.screen.hud[questsList["ongoing"][i]].len, a++)
						src.mob.screen.hud[questsList["ongoing"][i]][a].pixel_y += questGuiOffset

		src.mob.screen.Remove(questsList["ongoing"][qPath])
		questsList["ongoing"] -= qPath

		if(questsList["complete"] != null)

			if(!qPath in questsList["complete"])
				questsList["complete"] += qPath
				//world << "added to complete"
		repeatQuest(qPath)
		if(guiToggles["quest"] == 1)
			//clearQuestList()
			clearQuestSummary()
			questToggle()
			//displayQuestSummary(qPath)


	proc/expandQuest(Quest/qPath)

		clearQuestList()
		displayQuestSummary(qPath)

	proc/clearQuestSummary()
		src.mob.screen.hud["QuestInfo"][1].maptext = null
		src.mob.screen.Hide("QuestKillTargets")

	proc/displayQuestSummary(Quest/qPath)

		var/questInfo
		questInfo += {"
		<span style='color:white;font-size:2pt'>
		<b>Name</b>
		[qPath.name]
		<b>Summary</b>
		[qPath.summary]
		</span>"}

		if(qPath.killTracker)

			questInfo += {"<span style='color:white;font-weight:bold;font-size:2pt'>Progress
			<br><br>
			</span>"}
			src.mob.screen.Show("QuestKillTargets")
			var/i
			//var/xPos = 0
			for(i=1, i<=qPath.killTracker.len, i++)
				if(mobEnemyList[qPath.killTracker[i][1]])

					var/cKills = qPath.killTracker[i][2]
					var/nKills = qPath.killTracker[i][3]

					if(cKills >= nKills)

						src.mob.screen.hud["QuestKillTargets"][i].maptext = "<span style='font-size:1pt;color:green;font-weight:bold'>([cKills]/[nKills])</span>"
					else
						src.mob.screen.hud["QuestKillTargets"][i].maptext = "<span style='font-size:1pt;color:red;font-weight:bold'>([cKills]/[nKills])</span>"


		if(qPath.rewards)
			questInfo += {"
			<font color=white size=1><b>Rewards
			\green Exp <font color=yellow>  Fragments
			\green[qPath.rewards["exp"]]  <font color=yellow>[qPath.rewards["fragments"]]
			"}
			if(qPath.rewards["items"])

				var/i
				for(i=1, i<=qPath.rewards["items"].len, i++)
					//
					questInfo += "<img src=[qPath.rewards["items"][i].icon]>"
					//questInfo += "[qPath.rewards["items"][i].name]"


		src.mob.screen.hud["QuestInfo"][1].maptext = questInfo



	proc/clearQuestList()
		for(var/t in questsList["ongoing"])
			src.mob.screen.Hide(questsList["ongoing"][t])

	proc/questRewards(Quest/quest)

		if(!quest.rewards) return

		if(quest.rewards["exp"])
			gainExp(quest.rewards["exp"])

		if(quest.rewards["fragments"])
			getSoulFragments(quest.rewards["fragments"])

		if(quest.rewards["items"])
			var/i
			for(i=1, i<=quest.rewards["items"].len, i++)
				//equipment += quest.rewards["items"][i]
				//usr.contents += quest.rewards["items"][i]
				usr.client.addToInventory(quest.rewards["items"][i])

	proc/populateQuestGui()

		if(!questsList["ongoing"])return
		var/counter = 0
		for(var/Quest/t in questsList["ongoing"])
			counter++

			//var/Quest/quest = new t

			var/obj/UI/Quest/populate/foreground/foreground = new
			var/obj/UI/Quest/populate/desc/desc = new
			var/obj/UI/Quest/populate/photo/pic = new
			//pic.icon_state = t.photo
			var/icon/ophoto = new(pic.icon, t.photo)

			pic.underlays += ophoto

			if(counter>0)

				var multiplier = (questGuiOffset * counter) - questGuiOffset

				foreground.pixel_y -= multiplier
				desc.pixel_y -= multiplier
				desc.pos = counter
				pic.pixel_y -= multiplier
				desc.maptext = "<span style='font-color:white;font-size:4pt;font-weight:bold'>[questsList["ongoing"][t].name]\n</span><span style='font-color:white;font-size:4pt'>[questsList["ongoing"][t].desc]</span>"

			//src.mob.screen.Add("QuestList[t]", list(foreground,desc,pic))
			//populateQuestUI += list(foreground,desc,pic)
			//src.mob.screen.Show("QuestList[t]")
			src.mob.screen.Add(questsList["ongoing"][t], list(foreground,desc,pic))

			if(guiToggles["quest"] == 1)
				src.mob.screen.Show(questsList["ongoing"][t])



client
	proc/questToggle()
		switch(guiToggles["quest"])
			if(1)
				src.mob.screen.Hide("QuestTitle")
				src.mob.screen.Hide("QuestInfo")
				src.mob.screen.hud["QuestInfo"][1].maptext = null
				if(src.mob.screen.hud["QuestKillTargets"]) src.mob.screen.Hide("QuestKillTargets")
				guiToggles["quest"] = 0
				clearQuestList()
			if(0)
				if(questsList["ongoing"].len < 1)
					outputMessage(src,"<span style='color:red;font-size:2;font-weight:bold'>You don't have any ongoing quests.","gametext")
					return

				src.mob.screen.Show("QuestTitle")
				src.mob.screen.Show("QuestInfo")
				guiToggles["quest"] = 1
				populateQuestGui()


	verb/QuestMenu()
		set hidden = 1
		questToggle()


mob/Login()
	..()
	client.initQuestList()
	client.initQuestGui()

