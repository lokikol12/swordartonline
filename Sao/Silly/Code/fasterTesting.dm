mob/proc/GM_becomeShinigami(mob/player)


	outputMessage(world,"<b><font color = aqua>Race Info: [player] is now a Shinigami!","gametext")
	player.race = "Shinigami"
	player.rechargeStats()
	if(!player.client.equipment["Zanpakuto"])
		var/obj/B = new/obj/equipment/unique/sword
		player.client.addToInventory(B)
	var/obj/C = new/obj/equipment/unique/shinigamisuit
	player.client.addToInventory(C)
	player.getSquad()
	player.status = "Member"
	player.client.equipment["Zanpakuto"][1].Wear()
	player.client.equipment["Shinigami Suit"][1].Wear()
	var/shikai = input("Pick a shikai","Pick") as null | anything in zanList + "TrueIchigo"
	player.getShikai(shikai)


mob/proc/pickShikai()
	var/shikai = input("Pick a shikai","Pick") as null | anything in zanList + "TrueIchigo"
	getShikai(shikai)
	skill()
	traitPicker()