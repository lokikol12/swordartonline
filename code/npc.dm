mob/World_Map
	npc = 1




	Gquest
		name = "{NPC}Guild Quest"
		icon='NPCs.dmi';icon_state="Shinigami"
		interactWith(mob/player)
			if(player.in_guild == 0)
				outputMessage(player,"You must be in a guild todo this","gametext")
				return
			else
				switch(input("Which quest will you be doing today?", text) as null|anything in list ("Easy","Medium","Hard"))
					if(null)
						return
					if("Easy")
						if(player.boss1 <= 50)
							outputMessage(player,"Kill Lord Barra 50 times and return.","gametext")
						else
							if(player.boss1 >= 50)
								player.boss1 -= 50
								player.guildpoints += 60
								outputMessage(player,"You gained 60 Guild Points.","gametext")
					if("Medium")
						if(player.boss4 <= 50)
							outputMessage(player,"Kill Hades 50 times and return.","gametext")
						else
							if(player.boss4 >= 50)
								player.boss4 -= 50
								player.guildpoints += 70
								outputMessage(player,"You gained 70 Guild Points.","gametext")
					if("Hard")
						if(player.boss8 <= 50)
							outputMessage(player,"Kill Bugsy 50 times and return.","gametext")
						else
							if(player.boss8 >= 50)
								player.boss8 -= 50
								player.guildpoints += 200
								outputMessage(player,"You gained 200 Guild Points.","gametext")


















	Hiddenman2
		name = "{NPC}Hospital Clearer"
		icon='NPCs.dmi';icon_state="Squad4"
		interactWith(mob/player)
			var/M = /mob/enemy
			if(M in view(15))
				del(M)


	Hiddenman
		name = "{NPC}Feya"
		icon='NPCs.dmi';icon_state="Tsukishima"
		interactWith(mob/player)
			if(player.gotquest1 == 1)
				return
			if(player.boss13 == 0)
				outputMessage(player,"You must first kill the boss in thie zone and then return","gametext")
				return
			else
				player.gotquest1 = 1
				outputMessage(player,"[player] has learned Spirit Slash.","gametext")
				player.verbs += /mob/techniques/verb/SpiritSlash





	Zezen
		name = "{NPC}Zezen"
		icon='NPCs.dmi';icon_state="tut1"
		dialogue = "How's it going?"
		interactWith(mob/player)
			if(player.hadesguardkill <= 250)
				outputMessage(player,"Go fetch me the heads of 250 Hades Guards and return.","gametext")
				return
			else
				if(player.hadesguardkill >= 250)
					player.hadesguardkill -= 250
					player.exp += 600000
					player.Cor += 3000000
					outputMessage(player,"You got 600,000 exp & 3,000,000 Cor.","gametext")
					return




	Phantom
		name = "{NPC}Phantom"
		icon='NPCs.dmi';icon_state="Phantom"
		dialogue = "How's it going?"
		interactWith(mob/player)
			if(player.larzakills <= 50)
				outputMessage(player,"Kill Lord Larza 50 times and return","gametext")
				return
			else
				if(player.larzakills >= 50)
					player.larzakills -= 50
					player.exp += 350000
					player.Cor += 1000000
					outputMessage(player,"You got 350,000 exp & 1,000,000 Cor.","gametext")
					return


	Kirito
		name = "{NPC}Kirito "
		icon='saonpcs.dmi';icon_state="Kirito"
		dialogue = "How's it going?"
		interactWith(mob/player)
			if(player.boarkills <= 24)
				outputMessage(player,"Kill 25 Wild Boars and come back","gametext")
				return
			else
				if(player.boarkills >= 25)
					player.boarkills -= 25
					player.exp += 50000
					player.Cor += 50000
					outputMessage(player,"You got 50,000 exp & 50,000 Cor.","gametext")
					return

	Asuna
		name = "{NPC}Asuna "
		icon='saonpcs.dmi';icon_state="Asuna"
		dialogue = "How's it going?"
		interactWith(mob/player)
			if(player.forsakenkills <= 74)
				outputMessage(player,"Kill 75 Forsakens and come back","gametext")
				return
			else
				if(player.forsakenkills >= 75)
					player.forsakenkills -= 75
					player.exp += 150000
					player.Cor += 500000
					outputMessage(player,"You got 150,000 exp & 500,000 Cors.","gametext")
					return


	Rankup
		name = "{NPC}Nobuyuki Sugou"
		icon='NPCs.dmi';icon_state="Dangai"
		interactWith(mob/player)
			if(player.floor10 == 0)
				return
			else
				outputMessage(player,"You have done a something most wont, for that you will be rewarded","gametext")
				if(player.race == "BladeSmith")
					player.race = "Master Blade [player]"
					player.verbs += /mob/release/verb/BladeRelease
					return
				if(player.race == "Wizard")
					player.race = "Archmage [player]"
					player.verbs += /mob/release/verb/ArchmageForm




	Spirit14
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor15 == 1)
				return
			if(player.floor14 == 0)
				return
			else
				outputMessage(player,"Welcome to floor 15.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor15 = 1
				player.floor = 15





	Spirit13
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor14 == 1)
				return
			if(player.floor13 == 0)
				return
			else
				outputMessage(player,"Welcome to floor 14, From now on the only skills you will learn will be hidden in the world.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor14 = 1
				player.floor = 14






	Spirit12
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor13 == 1)
				return
			if(player.floor12 == 0)
				return
			else
				outputMessage(player,"Welcome to floor 13.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor13 = 1
				player.floor = 13
				if(player.race == "Master Blade [player]")
					player.verbs += /mob/techniques/verb/Mugetsu
				if(player.race == "Archmage [player]")
					player.verbs += /mob/techniques/verb/heal










	Spirit11
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor12 == 1)
				return
			if(player.floor11 == 0)
				return
			else
				outputMessage(player,"Welcome to the Twelfth floor.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor12 = 1
				player.floor = 12
				if(player.race == "Master Blade [player]")
					player.verbs += /mob/techniques/verb/Jakuho
				if(player.race == "Archmage [player]")
					player.verbs += /mob/techniques/verb/DeathDragon



	Spirit10
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor11 == 1)
				return
			if(player.floor10 == 0)
				return
			else
				outputMessage(player,"Welcome to the eleventh floor.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor11 = 1
				player.floor = 11
				if(player.race == "Master Blade [player]")
					player.verbs += /mob/techniques/verb/Sai
				if(player.race == "Archmage [player]")
					player.verbs += /mob/techniques/verb/IceBlast





	Spirit9
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor10 == 1)
				return
			if(player.floor9 == 0)
				return
			else
				outputMessage(player,"Welcome to the Tenth floor, you are really grinding hard after this go north and talk to that the Class Changer.","gametext")
				player.exp += 1000000
				player.statpoints += 2000000
				player.floor10 = 1
				player.floor = 10







	Spirit8
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor9 == 1)
				return
			if(player.floor8 == 0)
				return
			else
				outputMessage(player,"You made it to floor nine, i aplude you.","gametext")
				player.exp += 500000
				player.statpoints += 150000
				player.floor9 = 1
				player.floor = 9
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/MutiShuriken
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/Inferno





	Spirit7
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor8 == 1)
				return
			if(player.floor7 == 0)
				return
			else
				outputMessage(player,"You made it to floor eight, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 50000
				player.floor8 = 1
				player.floor = 8
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/Cyclone_Slash
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/lanza







	Spirit6
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor7 == 1)
				return
			if(player.floor6 == 0)
				return
			else
				outputMessage(player,"You made it to the Seventh floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 50000
				player.floor7 = 1
				player.floor = 7
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/CresentBlade
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/LightingStorm





	Spirit5
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor6 == 1)
				return
			if(player.floor5 == 0)
				return
			else
				outputMessage(player,"You made it to the Sixth floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 50000
				player.floor6 = 1
				player.floor = 6
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/Kuroi_Engetsu
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/RapidKiBlast




	Spirit4
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor5 == 1)
				return
			if(player.floor4 == 0)
				return
			else
				outputMessage(player,"You made it to the Fifth floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 50000
				player.floor5 = 1
				player.floor = 5
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/ShootDragon
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/Waterball

	Spirit3
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor4 == 1)
				return
			if(player.floor3 == 0)
				return
			else
				outputMessage(player,"You made it to the Forth floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 50000
				player.floor4 = 1
				player.floor = 4
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/Life_Shaver
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/FireArrow

	Spirit2
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor3 == 1)
				return
			if(player.floor2 == 0)
				return
			else
				outputMessage(player,"You made it to the Third floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 15000
				player.floor3 = 1
				player.floor = 3
				if(player.race == "BladeSmith")
					player.verbs += /mob/techniques/verb/CircleSlash
				if(player.race == "Wizard")
					player.verbs += /mob/techniques/verb/Rikujokoro

	Spirit
		name = "{NPC}Spiritman"
		icon='spiritman.dmi';icon_state="spiritman"
		interactWith(mob/player)
			if(player.floor2 == 1)
				return
			else
				outputMessage(player,"You made it to the second floor, i aplude you.","gametext")
				player.exp += 250000
				player.statpoints += 15000
				player.floor2 = 1
				player.floor = 2
				player.verbs += /mob/release/verb/EnchantSpeed


	Nanao
		name = "{NPC}Nobuyuki Sugou"
		icon='NPCs.dmi';icon_state="Dangai"
		interactWith(mob/player)
			if(player.soulpower>=10)
				if(player.race != "BladeSmith")
					var/obj/B = new/obj/equipment/unique/sword
					player.client.addToInventory(B)
					player.race = "BladeSmith"
					player.verbs += /mob/techniques/verb/Ryodan
					outputMessage(world,"[player] has chosen the path of the blade.","gametext")
					return
			else
				outputMessage(player,"Come back after level 10 to pick your path","gametext")
				return

	Nanao2
		name = "{NPC}Nobuyuki Sugou"
		icon='NPCs.dmi';icon_state="Dangai"
		interactWith(mob/player)
			if(player.soulpower>=10)
				if(player.race != "Wizard")
					player.race = "Wizard"
					player.verbs += /mob/techniques/verb/kiblast
					outputMessage(world,"[player] has become a Wizard","gametext")
					return

	SaoStub
		name = "{NPC}Stubborn "
		pixel_y = 2
		maptext_x = -82;maptext_y = -4
		maptext_width = 232
		maptext = {"<span style='-dm-text-outline: 1px black OUTLINE_SHARP;color:white;font-size:2pt;font-weight:bold'>Press spacebar to interact with me.</span>"}
		icon='NPCs.dmi';icon_state="tut1"
		interactWith(mob/player)
			switch(input("Hey [player]-san! How are you feeling?", "Kodra") as null|anything in list ("Im great let be go beat these floors","What the hell is going on here?"))
				if(null)
					player.client.addDialogue(src,"Maybe next time.")
					return
				if("Im great let be go beat these floors")
					outputMessage(player,"Welcome to the game, Make sure yo reach out for help this is in stage 1 so be patient.")
				if("What the hell is going on here?")
					outputMessage(player,"The world as you see it is just a illusion, we are trapped in the world of Sword Art Online. The goal is to beat all 100 floors and then find a way to escape. Please [player]-son, wont you save us?")





// old npcs
	Dummy2
		name = "{NPC}Punching bag"
		icon='dummies.dmi';icon_state="three"
		interactWith(mob/player)
			outputMessage(player,"Attack me","gametext")
			return



	missionman
		name = "{NPC}Kodra"
		icon='NPCs.dmi';icon_state="mission"
		dialogue = "You need to be level 15 for this mission."
		interactWith(mob/player)
			if(player.soulpower>=15)
				dialogue = "The challenge set before you can only be done once every 5 minutes.(lvl.15)"
				switch(input("Well shall we begin?", text) in list ("Yes","No"))
					if("Yes")
						player.loc = locate(8,138,5)
						player.safe = 0



	Doctor3
		name = "{NPC}Doctor"
		icon='NPCs.dmi';icon_state="Doctor"
		interactWith(mob/player)
			switch(input("Do you want to set floor 5 as your spawn point?", text) in list ("Yes","No"))
				if("Yes")
					player.spawn1 = 0
					player.spawn2 = 0
					player.spawn3 = 1
				else
					dialogue = "Guess not."

	Doctor2
		name = "{NPC}Doctor"
		icon='NPCs.dmi';icon_state="Doctor"
		interactWith(mob/player)
			switch(input("Do you want to set floor 5 as your spawn point?", text) in list ("Yes","No"))
				if("Yes")
					player.spawn1 = 0
					player.spawn2 = 1
				else
					dialogue = "Guess not."

	Doctor
		name = "{NPC}Doctor"
		icon='NPCs.dmi';icon_state="Doctor"
		interactWith(mob/player)
			switch(input("Do you require medical attention?", text) in list ("Yes","No"))
				if("Yes")
					player.rechargeStats()
					player.levelup()
					dialogue = "All done!"
					player.updateHud()
				else
					dialogue = "Guess not."


	Squad4
		name = "{NPC}Hanataro"
		icon='NPCs.dmi';icon_state="Squad4"
		interactWith(mob/player)
			switch(input("Do you require medical attention?", text) in list ("Yes","No"))
				if("Yes")
					player.Skills += 10
					player.rechargeStats()
					dialogue = "All done!"
					player.updateHud()
				else
					dialogue = "Guess not."



	sacredwater
		name = "{NPC}Fountain of youth"
		icon='waterfoutain.dmi';icon_state="one"
		interactWith(mob/player)
			if(player.busy1)
				dialogue = "One drink per minute."
				return
			else
				dialogue = "*drinks from Fountain of youth*"
				player.health = player.mhealth
				player.mana = player.mmana




	Nenriki
		name = "{NPC}Nenriki "
		icon='NPCs.dmi';icon_state="tut2"
		dialogue = "Hopefully you figured how to level up and get stronger, go face your challenges, Kill the vaizards, Stop Vasto ichigo, and fuse with the hougyoku before Azien does!."
		interactWith(mob/player)
			if(player.soulpower <= 9)return
			switch(input("Are you ready to go to the mainland?", text) in list ("Yes","No"))
				if("Yes")
					player.Cor += 100000
					player.race = "Human"
					player.statpoints += 50
					player.exp += 1000
					player.loc = locate(186,33,6)


	Clothing_Seller
		name = "{NPC}Clothing Selling"
		icon = 'NPCs.dmi';icon_state = "Clothing"

		interactWith(mob/player)
			var/purchase = input("Yo sup, wanna buy some clothes?", "Purchase clothes") as null | anything in list("Yes")
			if(!purchase) return

			var/obj/pick_cloth = input("Pick an item.","Pick item") as null | anything in clothingItemsList
			if(!pick_cloth) return
			var/iconColor = input("Which color would you like it to be?") as color
			if(iconColor)pick_cloth.color = iconColor
			player.client.addToInventory(pick_cloth)


	Hair_Cutter
		name = "{NPC}Hair Cutter"
		icon = 'NPCs.dmi';icon_state = "Barber"
		interactWith(mob/player)
			switch(input("Do you want a haircut?", text) in list ("Yes","No"))
				if("Yes") player.updateHair()



