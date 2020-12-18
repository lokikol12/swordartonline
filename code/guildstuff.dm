mob/World_Map
	npc = 1



	Guildmissions
		name = "{NPC}Guild Trader"
		icon='NPCs.dmi';icon_state="mission"
		interactWith(mob/player)
			if(player.in_guild == 0)
				outputMessage(player,"You need to be in a guild to do this.","gametext")
				return
			else
				switch(input("Welcome to the Guild Shop.", text) as null|anything in list ("Guild Items","Stat Gain Increase","Double Exp 1hr","Double Cor 1hr"))
					if(null)
						return
					if("Guild Items")
						switch(input("Which item would you like to buy?", text) as null|anything in list ("Blood Oath Armor(50GP)","Excalibur(30GP)"))
							if(null)
								return
							if("Excalibur(30GP)")
								if(player.guildpoints>= 30)
									player.guildpoints -= 30
									var/obj/K = new/obj/equipment/unique/Excalibur
									player.client.addToInventory(K)
							if("Blood Oath Armor(50GP)")
								if(player.guildpoints >= 50)
									player.guildpoints -= 50
									var/obj/K = new/obj/equipment/legendary/asunaarmor
									player.client.addToInventory(K)
					if("Double Exp 1hr")
						switch(input("This is doule exp for the guild for a hour it cost 50GP?", text) as null|anything in list ("Yes","No"))
							if(null)
								return
						if("No")
							return
						if("Yes")
							if(player.guildpoints >= 50)
								player.guildpoints -= 50
								for(var/mob/M in world)
									if(M.guild_name == player.guild_name)
										M.doubleexp = 1
										outputMessage(M,"Double Exp has started for 1 hour","gametext")
										spawn(40000)
											M.doubleexp = 0
											outputMessage(M,"Double Exp has ended","gametext")

					if("Double Cor 1hr")
						switch(input("This is doule Cor gains for the guild for a hour it cost 50GP?", text) as null|anything in list ("Yes","No"))
							if(null)
								return
						if("No")
							return
						if("Yes")
							if(player.guildpoints >= 50)
								player.guildpoints -= 50
								for(var/mob/M in world)
									if(M.guild_name == player.guild_name)
										M.doublecor = 1
										outputMessage(M,"Double Cor has started for 1 hour","gametext")
										spawn(40000)
											M.doublecor = 0
											outputMessage(M,"Double Cor has ended","gametext")


					if("Stat Gain Increase")
						switch(input("This will increase all members and future members stat gains by 50% and cost 250GP", text) as null|anything in list ("Yes","No"))
							if(null)
								return
							if("Yes")
								if(statincrease == 1)
									return
								if(player.guildpoints >= 250)
									player.guildpoints -= 250
									player.traits += "Rebirth1"
									outputMessage(player,"You gained a increase to stat gains","gametext")
									for(var/mob/M in world)
										if(M.guild_name == player.guild_name)
											if(!(M == player))
												M.traits += "Rebirth1"
												outputMessage(M,"You gained a stat increase","gametext")
												statincrease = 1
							if("No")
								return




