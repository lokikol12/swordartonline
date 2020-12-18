mob
	World_Map
		Itemdealer
			npc = 1
			name = "{NPC}Unique Item dealer"
			icon = 'NPCs.dmi';icon_state = "seller"
			interactWith(mob/player)
				switch(input("Welcome to the shop, looking for some odds and ends?", text) as null|anything in list ("Buy"))
					if(null)
						return
					if("Buy")
						switch(input("What do you want to buy?", text) as null|anything in list ("Magic Coat(75k)","Loyalty Armor(75k)","Staff of Ice(5mill)","LordSword(5mill)","TrueForm(10bill)","Blood Oath Armor(1bill)","ArchMage suit(1bill)","CoatofMidnight(1bill)","Staff of Light(100mill)","Elucidator(2bill)","DarkRepulser(2bill)","UnityVox(250mill)","Excalibur(500mill)"))
							if(null)
								return



							if("Magic Coat(75k)")
								if(player.Cor>= 75000)
									player.Cor -= 75000
									var/obj/K = new/obj/equipment/legendary/magearmor1
									player.client.addToInventory(K)



							if("Loyalty Armor(75k)")
								if(player.Cor>= 75000)
									player.Cor -= 75000
									var/obj/K = new/obj/equipment/legendary/LoyaltyArmor
									player.client.addToInventory(K)





							if("Staff of Ice(5mill)")
								if(player.Cor>= 5000000)
									player.Cor -= 5000000
									var/obj/K = new/obj/equipment/unique/staffice
									player.client.addToInventory(K)


							if("LordSword(5mill)")
								if(player.Cor>= 5000000)
									player.Cor -= 5000000
									var/obj/K = new/obj/equipment/unique/LordSword
									player.client.addToInventory(K)



							if("Excalibur(500mill)")
								if(player.Cor>= 500000000)
									player.Cor -= 500000000
									var/obj/K = new/obj/equipment/unique/Excalibur
									player.client.addToInventory(K)


							if("UnityVox(250mill)")
								if(player.Cor>= 250000000)
									player.Cor -= 250000000
									var/obj/K = new/obj/equipment/unique/UnityVox
									player.client.addToInventory(K)

							if("DarkRepulser(2bill)")
								if(player.Cor>= 2000000000)
									player.Cor -= 2000000000
									var/obj/K = new/obj/equipment/unique/DarkRepulser
									player.client.addToInventory(K)


							if("Elucidator(2bill)")
								if(player.Cor>= 2000000000)
									player.Cor -= 2000000000
									var/obj/K = new/obj/equipment/unique/Elucidator
									player.client.addToInventory(K)


							if("Staff of Light(100mill)")
								if(player.Cor>= 100000000)
									player.Cor -= 100000000
									var/obj/K = new/obj/equipment/unique/stafflight
									player.client.addToInventory(K)

							if("CoatofMidnight(1bill)")
								if(player.Cor>= 1000000000)
									player.Cor -= 1000000000
									var/obj/K = new/obj/equipment/legendary/CoatofMidnight
									player.client.addToInventory(K)

							if("Blood Oath Armor(1bill)")
								if(player.Cor>= 1000000000)
									player.Cor -= 1000000000
									var/obj/K = new/obj/equipment/legendary/asunaarmor
									player.client.addToInventory(K)

							if("ArchMage suit(1bill")
								if(player.Cor>= 1000000000)
									player.Cor -= 1000000000
									var/obj/K = new/obj/equipment/legendary/magearmor3
									player.client.addToInventory(K)
							if("TrueForm(10bill)")
								if(player.Cor>= 10000000000)
									player.Cor -= 10000000000
									player.verbs += /mob/release/verb/TrueForm

					if("Sell")

						switch(input("What do you want to Sell?", text) as null|anything in list("Magic Coat(75k)","Zettu Armor(500k)","Loyalty Armor(75k)","Staff of Light(25mill)","Staff of Ice(5mill)","Staff of Fire(50k)","Lord Sword(5mill)","Blood Oath Armor(1bill)","ArchMage suit(1bill)","CoatofMidnight(1bill)","Staff of Light(100mill)","Elucidator(2bill)","DarkRepulser(2bill)","UnityVox(250mill)","Excalibur(500mill)"))

							if(null)
								return



							if("Magic Coat(75k)")

								if(player.client.equipment["Magic Coat"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Magic Coat"][1].worn)return
									player.Cor += 75000
									player.client.equipment["Magic Coat"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Magic Coat"][1],1)



							if("Zettu Armor(500k)")

								if(player.client.equipment["Zettu Armor"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Zettu Armor"][1].worn)return

									player.Cor += 500000
									player.client.equipment["Zettu Armor"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Zettu Armor"][1],1)




							if("Loyalty Armor(75k)")

								if(player.client.equipment["Loyalty Armor"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Loyalty Armor"][1].worn)return

									player.Cor += 75000
									player.client.equipment["Loyalty Armor"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Loyalty Armor"][1],1)



							if("Staff of Light(25mill)")

								if(player.client.equipment["Staff of Light"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Staff of Light"][1].worn)return

									player.Cor += 25000000
									player.client.equipment["Staff of Light"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Staff of Light"][1],1)


							if("Staff of Fire(50k)")

								if(player.client.equipment["Staff of Fire"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Staff of Fire"][1].worn)return

									player.Cor += 50000
									player.client.equipment["Staff of Fire"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Staff of Fire"][1],1)

							if("Staff of Ice(5mill)")

								if(player.client.equipment["Staff of Ice"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Staff of Ice"][1].worn)return

									player.Cor += 250000
									player.client.equipment["Staff of Ice"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Staff of Ice"][1],1)



							if("Lord Sword(5mill)")

								if(player.client.equipment["Lord Sword"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Lord Sword"][1].worn)return

									player.Cor += 5000000
									player.client.equipment["Lord Sword"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Lord Sword"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return




							if("Blood Oath Armor(1bill)")

								if(player.client.equipment["Blood Oath Armor"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Blood Oath Armor"][1].worn)return

									player.Cor += 1000000000
									player.client.equipment["Blood Oath Armor"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Blood Oath Armor"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return


							if("ArchMage suit(1bill)")

								if(player.client.equipment["Archmage Suit"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Archmage Suit"][1].worn)return

									player.Cor += 1000000000
									player.client.equipment["Archmage Suit"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Archmage Suit"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return

							if("CoatofMidnight(1bill)")

								if(player.client.equipment["Coat of Midnight"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Coat of Midnight"][1].worn)return

									player.Cor += 1000000000
									player.client.equipment["Coat of Midnight"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Coat of Midnight"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return



							if("Staff of Light(100mill)")

								if(player.client.equipment["Staff of Light"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Staff of Light"][1].worn)return

									player.Cor += 100000000
									player.client.equipment["Staff of Light"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["Staff of Light"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return


							if("UnityVox(250mill)")

								if(player.client.equipment["UnityVox"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["UnityVox"][1].worn)return

									player.Cor += 250000000
									player.client.equipment["UnityVox"][1].dontKeep = 1
									player.client.removeFromInventory(player.client.equipment["UnityVox"][1],1)


								else
									player.client.addDialogue(src,"Fuck off.")
									return




							if("Excalibur(500mill)")

								if(player.client.equipment["Excalibur"])
									//Don't let people keep the item on when they sell it. Lol.
									if(player.client.equipment["Excalibur"][1].worn)return

									player.Cor += 500000000
									player.client.removeFromInventory(player.client.equipment["Excalibur"][1],1)
									player.client.equipment["Excalibur"][1].dontKeep = 1

								else
									player.client.addDialogue(src,"Fuck off.")
									return





		Itemdealer2
			npc = 1
			name = "{NPC]Trait Sellsman"
			icon = 'NPCs.dmi';icon_state = "Itemman"
			interactWith(mob/player)
				switch(input("Welcome to the shop, looking for some odds and ends?", text) as null|anything in list ("Buy"))
					if(null)
						return
					if("Buy")
						switch(input("What do you want to buy?", text) as null|anything in list ("Health Regen increase(2B)","Mana Regen increase(2B)"))
							if(null)
								return



							if("Health Regen increase(2B)")
								if(!("HighSpeed" in player.traits))
									return
								else
									if(player.Cor>= 2000000000)
										player.Cor -= 2000000000
										player.traits += "HighSpeed"


							if("Mana Regen increase(2B)")
								if(!("HighSpeed" in player.traits))
									return
								else
									if(player.Cor>= 2000000000)
										player.Cor -= 2000000000
										player.traits += "HighSpeedMana"