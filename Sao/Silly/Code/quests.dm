
Quest

	var

		name
		desc
		photo = "Placeholder" //icon_state in "interface/quest"
		list/req
		list/killTracker = null
		list/rewards
		auto_repeat = null
		summary = null

	HollowQuest
		name = "Hollow Hunting"
		photo = "HollowQuest"
		desc = "Kill some hollows!"
		summary = "In-depth review of the fucking hollow kills and whatnot. You're getting there. Kill some bullies and demihollows!"
		//auto_repeat = 1
		req = list("level"=1)//,"prevQuest"=/Quest/Tutorial)
		killTracker = list(list(/mob/enemy/Robot,0,1), list(/mob/enemy/Lizzardman,0,1))  //enemy, current kills, needed kills
		rewards = list("exp"=1000, "fragments"=15000, "items"=newlist(/obj/equipment/common/clothshirt,/obj/equipment/common/clothpant))



mob/World_Map/Quests
	var/list/listOfQuests = null

	strange_dude

		name = "Strange Dude"
		icon = 'NPCs.dmi'
		icon_state = "idk"
		listOfQuests = list(new/Quest/HollowQuest)

		interactWith(mob/player)
			var/chooseQuest = input("Which quest would you like to take on?","Pick a quest!") as null | anything in listOfQuests
			if(chooseQuest)
				player.client.addQuest(chooseQuest)