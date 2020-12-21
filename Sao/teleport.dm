turf
	teleSao



		teletoraid2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.soulpower <= 9999)
						outputMessage(M,"Level 10k and up!.","gametext")
						return
					if(M.client)
						usr.loc = locate(97,397,7)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromraid2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(144,265,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletosubroom
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.sub == 0)
						outputMessage(M,"Sub Room, Maybe we will see you soon.","gametext")
						return
					if(M.client)
						usr.loc = locate(42,2,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromsubroom
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(172,316,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return





		teletodojo2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(12,2,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromdojo2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(184,316,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return





		teletofloor5hos
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(138,16,3)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromfloor5hos
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(355,365,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return












		teletofloor12dude
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(72,228,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor12dude
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(282,46,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletofloor11dude
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(15,225,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor11dude
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(51,3,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor4quest
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(15,72,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefrom4floorquest
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(177,343,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletotrait
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(66,2,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromtrait
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(343,387,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletophantom
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(47,70,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromphantom
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(351,32,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletoasuna
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(126,37,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromasuna
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(376,164,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return







		teletoitemshop //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(15,41,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromitemshop//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(181,331,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return







		teletosaocave //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(144,133,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromsaocave//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(232,266,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return





		teletodojo //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(54,44,1)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromdojo //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(136,345,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletosao //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(74,2,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromsao //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(79,348,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletohos //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(136,311,1)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromhos //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(133,2,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletowild1 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(82,286,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromwild1 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(88,311,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor1boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(177,3,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor2 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss1 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(382,161,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor2
		teletowild2 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(369,163,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromwild2 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(351,166,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor2boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(224,2,1)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor3 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss2 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(349,10,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor 3
		teletowild3 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(383,6,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromwild3 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(322,5,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor3boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(122,2,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletofloor4 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss3 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(7,389,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor
		teletowild4 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(13,394,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromwild4 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(29,379,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor4boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(25,138,2)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletofloor5 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss4 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(181,7,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor 5
		teletofloor5part2 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(343,387,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor6 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss5 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(123,4,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor6 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(125,360,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		teletofloor6boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(9,2,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletofloor7 //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss6 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(382,50,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor7

		teletofloor7boss //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(9,97,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

		teletofloor8//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss7 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(327,376,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

//floor8

		teletofloor8room //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(70,374,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor8room //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(234,384,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletofloor8boss//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(7,275,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor9//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss8 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(123,146,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


//floor9

		teletofloor9boss//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(26,161,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletofloor10
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss9 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(303,1,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor10part2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(71,33,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletofloor10hos //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(109,34,4)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromfloor10hos //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(82,31,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletorankup //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(148,17,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromrankup //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(74,76,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletofloor10wild //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(5,75,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor10wild//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(18,54,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor10boss//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(115,54,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor11//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss10 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(59,3,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



// floor 11

		teletofloor11boss//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(17,130,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor12//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss11 == 0)
						outputMessage(M,"Beat the boss first","gametext")
						return
					if(M.client)
						usr.loc = locate(277,39,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor 12


		teletofloor12boss//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(348,155,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor13//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss12 == 0)
						return
					if(M.client)
						usr.loc = locate(262,315,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




///floor13



		teletofloor13npc //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(113,220,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor13npc//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(237,311,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return






		teletofloor13w //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(55,369,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor13w//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(391,258,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletofloor13w2//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(123,399,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletofloor14//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss13 == 0)
						return
					if(M.client)
						usr.loc = locate(24,154,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
//floor14




		teletofloor14npc //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(113,197,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor14npc//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(21,154,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return





		teletofloor14w //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(61,312,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor14w//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(64,84,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletofloor15//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.boss14 == 0)
						return
					if(M.client)
						usr.loc = locate(274,10,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return

//floor15



		teletofloor15hos //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(341,192,6)
						usr.safe = 1
					else
						if(istype(A,/obj/))
							return
		telefromfloor15hos//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(280,13,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return






		teletofloor15npc //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(150,226,5)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor15npc//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(266,30,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return







		teletofloor15c //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(29,213,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor15c//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(252,36,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return




		teletofloor15d //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(82,209,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor15d//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(384,89,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletofloor15a //squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(3,209,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefromfloor15a//squad 1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(218,115,6)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return