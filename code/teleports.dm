
turf
	telehouses
		var/houseowner = ""
		var/house
		house1to
			house = 1
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 5,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=5000000)
									M.Cor-=5000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs += /mob/techniques/verb/TeleportHome
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(12,317,4)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(12,317,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house1from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(352,369,4)
				else
					return



		house2to
			house = 2
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 5,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=5000000)
									M.Cor-=5000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs +=/mob/techniques/verb/TeleportHome2
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									savehouses()
									usr.loc = locate(13,343,4)
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(13,343,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house2from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(344,369,4)
				else
					return





		house3to
			house = 3
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 5,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=5000000)
									M.Cor-=5000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs += /mob/techniques/verb/TeleportHome3
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									savehouses()
									usr.loc = locate(14,368,4)
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(14,368,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house3from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(241,366,4)
				else
					return




		house4to
			house = 4
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 25,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=25000000)
									M.Cor-=25000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs += /mob/techniques/verb/TeleportHome4
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									savehouses()
									usr.loc = locate(10,395,4)
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(10,395,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house4from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(230,366,4)
				else
					return




		house5to
			house = 5
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 25,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=25000000)
									M.Cor-=25000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs += /mob/techniques/verb/TeleportHome5
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(13,224,4)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(13,224,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house5from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(393,229,4)
				else
					return



		house6to
			house = 6
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 25,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=25000000)
									M.Cor-=25000000
									houseowner = M.key
									M.houseowner1 = 1
									M.verbs += /mob/techniques/verb/TeleportHome6
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(16,207,4)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(16,207,4)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house6from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(382,229,4)
				else
					return

		house7to
			house = 7
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome7
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(361,329,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(361,329,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house7from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(75,14,5)
				else
					return


		house8to
			house = 8
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome8
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(372,373,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(372,373,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house8from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(89,14,5)
				else
					return


		house9to
			house = 9
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome9
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(332,358,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(332,358,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house9from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(102,14,5)
				else
					return


		house10to
			house = 10
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome10
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(281,375,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(281,375,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house10from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(102,2,5)
				else
					return

		house11to
			house = 11
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome11
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(354,277,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(354,277,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house11from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(89,2,5)
				else
					return



		house12to
			house = 12
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome12
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(309,285,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(309,285,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house12from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(75,2,5)
				else
					return



		house13to
			house = 13
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome13
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(286,251,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(286,251,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house13from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(255,36,5)
				else
					return






		house14to
			house = 14
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome14
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(267,288,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(267,288,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house14from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(246,29,5)
				else
					return



		house15to
			house = 15
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome15
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(226,268,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(226,268,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house15from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(255,23,5)
				else
					return


		house16to
			house = 16
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							outputMessage(M,"You own a house","gametext")
							return
						if(M.guild_leader == 1)
							return
						if(M.houseowner1 == 1)
							return
						if(M.home == 0)
							M.home = 1
						if(M.home == 1)
							M.home = 2
						switch(input("Would you like to buy this house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.verbs += /mob/techniques/verb/TeleportHome16
									M.verbs += /mob/techniques/verb/leavehouse
									outputMessage(M,"Congratulations! You just bought a house!", "gametext")
									usr.loc = locate(224,286,5)
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(224,286,5)
							outputMessage(M,"Welcome home.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This house belongs to someone else.", "gametext")
							return
				else
					return

		house16from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(265,29,5)
				else
					return




//guildhouses


		ghouse1to
			house = 1111
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 1,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a guild house")
									return
								if(M.Cor>=15000000)
									M.Cor-=15000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(373,3,3)
									M.verbs += /mob/techniques/verb/GuildHouse
									M.verbs += /mob/techniques/verb/GiveTeleport
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(373,3,3)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse1from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(357,378,3)
				else
					return


		ghouse2to
			house = 1112
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 5,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=5000000)
									M.Cor-=5000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(269,4,3)
									M.verbs += /mob/techniques/verb/GuildHouse2
									M.verbs += /mob/techniques/verb/GiveTeleport2
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(269,4,3)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse2from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(333,378,3)
				else
					return


		ghouse3to
			house = 1113
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 50,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=50000000)
									M.Cor-=50000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(74,337,4)
									M.verbs += /mob/techniques/verb/GuildHouse3
									M.verbs += /mob/techniques/verb/GiveTeleport3
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(74,337,4)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse3from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(298,366,4)
				else
					return



		ghouse4to
			house = 1118
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 500,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=500000000)
									M.Cor-=500000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(183,107,11)
									M.verbs += /mob/techniques/verb/GuildHouse4
									M.verbs += /mob/techniques/verb/GiveTeleport4
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(183,107,11)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse4from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(30,30,4)
				else
					return



		ghouse5to
			house = 1119
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 1,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=1000000000)
									M.Cor-=1000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(145,4,4)
									M.verbs += /mob/techniques/verb/GuildHouse5
									M.verbs += /mob/techniques/verb/GiveTeleport5
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(145,4,4)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse5from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(15,29,4)
				else
					return






		ghouse6to
			house = 1120
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 2,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=2000000000)
									M.Cor-=2000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(227,332,5)
									M.verbs += /mob/techniques/verb/GuildHouse6
									M.verbs += /mob/techniques/verb/GiveTeleport6
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(227,332,5)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse6from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(233,37,5)
				else
					return




		ghouse7to
			house = 1121
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 2,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=2000000000)
									M.Cor-=2000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(218,373,5)
									M.verbs += /mob/techniques/verb/GuildHouse7
									M.verbs += /mob/techniques/verb/GiveTeleport7
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(218,373,5)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse7from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(219,37,5)
				else
					return



		ghouse8to
			house = 1122
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 500,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=500000000)
									M.Cor-=500000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(240,7,4)
									M.verbs += /mob/techniques/verb/GuildHouse8
									M.verbs += /mob/techniques/verb/GiveTeleport8
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(240,7,4)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse8from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(97,316,3)
				else
					return






		ghouse9to
			house = 1123
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 5,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=5000000000)
									M.Cor-=5000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(128,201,6)
									M.verbs += /mob/techniques/verb/GuildHouse9
									M.verbs += /mob/techniques/verb/GiveTeleport9
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(128,201,6)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse9from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(241,283,6)
				else
					return









		ghouse10to
			house = 1124
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 5,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=5000000000)
									M.Cor-=5000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(206,182,6)
									M.verbs += /mob/techniques/verb/GuildHouse10
									M.verbs += /mob/techniques/verb/GiveTeleport10
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(206,182,6)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse10from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(257,300,6)
				else
					return





		ghouse11to
			house = 1125
			Enter(mob/M)
				if(ismob(M)&&M.client)
					if(!fexists("housesaves/[src.house]/")) //If there is no folder with variable house as it's name
						if(M.guildhouseowner == 1)
							return
						if(M.guild_leader == 0)
							return
						switch(input("Would you like to buy this Guild house for 5,000,000,000 Cor?", text) in list ("Yes", "No"))
							if("Yes")
								if(M.guildhouseowner == 1)
									outputMessage(M,"You already own a Guild house")
									return
								if(M.Cor>=5000000000)
									M.Cor-=5000000000
									houseowner = M.key
									M.guildhouseowner = 1
									outputMessage(M,"Congratulations! You just bought a Guild house!", "gametext")
									usr.loc = locate(288,172,6)
									M.verbs += /mob/techniques/verb/GuildHouse11
									M.verbs += /mob/techniques/verb/GiveTeleport11
									savehouses()
								else
									outputMessage(M,"You do not have enough Cor.", "gametext")
							if("No")
								return
					else //If a folder is found
						if(fexists("housesaves/[src.house]/[usr.key]")) //If file name is equal to mob trying to enter
							usr.loc = locate(288,172,6)
							outputMessage(M,"Welcome back.", "gametext")
							return
						else //If houseowner isn't equal to mob trying to enter
							outputMessage(M,"This Guild house belongs to someone else.", "gametext")
							return
				else
					return

		ghouse11from
			Enter(mob/M)
				if(ismob(M)&&M.client)
					usr.loc = locate(252,10,6)
				else
					return
















	tele
  teletohueco
   icon = 'dimention.dmi'
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(148,183,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromhueco
   icon = 'dimention.dmi'
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(43,154,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  teletohospital
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(44,186,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromhospital
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(49,92,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return




	 teletoking
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(90,119,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromking
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(59,143,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


	 teletourahara
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(12,179,1)
      usr.safe = 1
    else
	 			if(istype(A,/obj/)) return
  telefromurahara
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(76,179,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletouraharab
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(17,138,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromuraharab
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(7,195,1)
      usr.safe = 1
    else
	 			if(istype(A,/obj/)) return
	 teletotower
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(89,143,1)
    else
	 			if(istype(A,/obj/)) return
  telefromtower
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(166,86,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromss
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(148,159,1)
    else
	 			if(istype(A,/obj/)) return
	 teletoss
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(70,196,4)
    else
	 			if(istype(A,/obj/)) return
  telefromshiniteach
  	density=1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(100,64,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoshiniteach
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(84,86,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  teletolab
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(11,181,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromlab
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(180,46,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoln
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(166,2,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromln
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(12,181,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoln

	 teletouqi
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(54,1,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromuqi
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(141,75,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletouqi



	 teletotut
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(50,100,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtut
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(121,195,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotut



	 teletotuted
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(44,158,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtuted
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(120,151,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotuted


	 teletotutbleach
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(44,145,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtutbleach
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(19,189,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotutbleach



	 teletofmastarter
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(190,1,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromfmastatrer
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(146,187,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletofmastarter



	 teletotutfmatun2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(5,160,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromfmatun2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(46,2,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotfmatun2

	 teletotutfmatun
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(128,2,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromfmatun
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(115,191,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotfmatun






	 teletotutma
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(169,194,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtutfma
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(169,7,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotutfma




	 teletostarter
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(38,1,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromstarter
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(51,177,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletostarter


	 teletovaibase2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(77,2,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvaibase2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(58,3,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletovaibase2


	 teletovaibase3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(97,7,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvaibase3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(84,2,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletovaibase3

 	teletotunnel
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(148,126,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtunnel
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(24,145,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotunnel

	 teletofma3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(132,176,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromfma3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(24,149,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletofma

	 teletotunnel1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(148,163,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefrotunnel1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(109,188,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotunnel1


	 teletourasabasement2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(98,195,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromurasbasement2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(16,138,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletourasbasememt2


	 teletoshinji
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(61,12,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromshinji
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(177,194,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoshinji



	 teletoed
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(93,180,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromed
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(132,192,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoed




  teletoquincy2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(90,10,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromquincy2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(88,195,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoquincy2






  teletoquincy3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(10,1,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromquincy3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(20,5,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoquincy3







		teletohellmp2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(24,181,8)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromhellmp2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(14,197,7)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return











		teletohellmp
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(95,1,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromhellmp
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(131,23,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletohell2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(134,132,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromhell2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(88,157,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletohella3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(54,104,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromhella3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(118,112,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




  teletonzone
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(40,81,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromnzone
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(167,184,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletonzone



  teletofmaw
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(6,1,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromfmaw
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(128,138,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletofmaw






  teletoFinalroom
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(124,2,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromFinalroom
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(108,7,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoFinalroom



  teletoYawcho
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(154,6,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromYawcho
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(5,25,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoYawcho


  teletoYawcho2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(10,72,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromYawcho2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(163,13,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoYawcho2



  teletoYawcho3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(9,123,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromYawcho3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(11,101,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoYawcho3





  teletoschool
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(186,1,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(27,149,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool

  teletoschool1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(193,13,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(191,5,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool1

  teletoschool2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(181,13,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(183,5,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool2

  teletoschool3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(193,23,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(191,10,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool3

  teletoschool4
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(181,22,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool4
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(183,10,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool4

  teletoschool5
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(186,31,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromschool5
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(169,14,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoschool5

  teletocrossroad
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(76,18,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcrossroad
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(14,195,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocrossroad

  teletoshiba
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(192,182,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromshiba
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(8,144,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromshibaladder
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(105,60,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletolnbasement
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(122,9,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromlbbasement
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(94,8,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletolnbasement

  teletolnbase
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(97,1,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromlbbase
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(148,184,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletolnbase


//Teleport to and from squadhouses+hospital

	telesquads
		teletosquad1 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,78,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromsquad1 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(6,118,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad2 //squad 2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,78,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromsquad2 //squad 2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(48,122,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad3 //squad 3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,99,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad3 //squad 3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(4,99,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosshospital //sshospital or squad 4
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(75,19,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsshospital //sshospital or squad 4
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(115,64,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad5 //squad 5
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,99,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad5 //squad 5
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(67,127,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad6 //squad 6
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,120,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad6 //squad 6
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(107,125,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad7 //squad 7
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,120,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad7 //squad 7
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(65,76,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad8 //squad 8
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,141,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad8 //squad 8
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(175,106,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad9 //squad 9
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,141,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad9 //squad 9
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(178,88,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad10 //squad 10
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,162,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad10 //squad 10
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(176,59,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad11 //squad 11
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,162,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad11 //squad 11
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(128,31,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad12 //squad 12
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(173,183,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad12 //squad 12
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(84,38,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletosquad13 //squad 13
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(154,183,5)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromsquad13 //squad 13
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(8,36,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

















// caves

	 teletocave1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(89,14,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(80,10,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave1


	 teletocave2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(86,190,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(73,14,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave2



	 teletocave3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(43,17,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(45,10,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave3


	 teletocave4
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(43,24,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave4
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(25,181,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave4


	 teletocave5
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(42,191,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave5
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(21,119,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave5



	 teletocave6
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(25,114,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave6
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(66,194,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave6




	 teletocave7
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(109,192,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave7
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(40,109,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave7


	 teletocave8
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(138,2,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave8
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(187,39,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave8


	 teletocave9
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(144,1,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave9
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(195,39,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave9


	 teletocave10
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(183,170,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave10
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(111,8,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave10




	 teletocave11
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(133,170,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave11
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(191,39,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave11

	 teletocave12
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(131,28,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave12
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(189,64,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave12






	 teletocave13
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(174,182,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave13
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(4,1,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave13





	 teletocave14
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(160,199,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave14
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(11,38,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave14


	 teletocave15
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(5,39,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave15
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(41,24,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave15



	 teletocave16
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(70,9,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave16
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(99,5,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave16





	 teletocave17
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(159,46,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave17
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(65,12,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave17





	 teletosoul
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(185,19,7)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromsoul
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(103,155,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletosoul





	 teletoaizen
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(13,63,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromaizen
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(97,19,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletoaizen




	 teletocave20
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(15,28,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromcave20
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(94,132,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletocave20





	 teletotour
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(105,63,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtour
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(73,95,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotour


	 teletotour2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(74,95,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromtour2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(104,93,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletotour2



	 teletosecret1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(130,180,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromsecret1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(83,108,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
	 teletosecret1





	 teletogmroom
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(106,198,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromgmroom
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(36,5,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return



  teletomystic
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(57,43,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefrommystic
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(18,175,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletovegeta
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(88,181,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegta
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(18,175,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return

  teletovegeta2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(190,59,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(93,32,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletovegeta3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(36,175,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(195,11,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return

  teletovegeta4
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(162,135,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletovegeta5
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(10,44,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta5
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(182,118,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return



  teletovegeta6
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(17,116,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta6
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(175,142,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletovegeta7
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(120,109,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta7
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(184,2,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return




  teletovegeta8
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(122,77,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromvegeta8
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(142,2,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return








  teletosub
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(175,164,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromsub
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(188,50,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletosub2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(94,190,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromsub2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(195,5,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletosub3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(184,16,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromsub3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(190,41,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return



  teletoncave
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(127,162,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromncave
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(131,2,8)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletoncave1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(106,2,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromncave1
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(70,117,3)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return





  teletoncave2
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(69,2,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromncave2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(25,110,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return






  teletoearth
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(100,76,10)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return







  teletoln3
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(137,62,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromln3
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(125,93,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return






  teletoln4
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(82,6,13)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromln4
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(93,85,11)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletokty
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(163,63,13)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromkty
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(178,5,13)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return


  teletodon
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(184,121,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromdon
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(21,91,2)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return



  teletoyama
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(57,104,6)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromyama
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(69,49,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return

  teletorenji
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(182,167,9)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromrenji
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(25,74,4)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return






  teletotounry1
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(251,328,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return

  teletounry2
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(281,331,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return



  telefromtounry
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(266,344,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return





  teletoevent
   Enter(A)
    if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(258,346,5)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
  telefromevent
   Enter(A)
	 		if(ismob(A))
	 			var/mob/M = A
     if(M.client)
      usr.loc = locate(168,346,1)
      usr.safe = 0
    else
	 			if(istype(A,/obj/)) return
