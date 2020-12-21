/*

This code file contains all mobs that are killable and give stats and experience when killed
I sorted the enemies by race from weak to strong
All mobs in here belong to the mob/enemy tree

*/

mob
	enemy
		New()
			oldspot = src.loc
		proc
			AI()
				var/tmp/chosenSkills //creates a temporary variable that isn't saved
				var/tmp/mob/target = null //creates a temporary target
				for(var/mob/zabimaru/M in oview(1)) //for zabimarus within 1 tile
					step_away(src,M) //move away from zabimaru
				for(var/mob/M in oview(20)) //for every mob within a view of 8
					if(M.enemy||M.npc) //if M is an enemy or a npc
						continue //ignore
					if(M.traits in src.ignorelist||M.race in src.ignorelist) //if M's traits or race is found in src's ignorelist
						continue //ignore
					if(!target) //if the enemy doesn't have a target
						target = M //set target equal to first mob found
					if(target in get_step(src,src.dir)) //if the mob is within one tile in the direction src is facing
						src.Attack() //use the Attack() verb
					else //if they aren't within 1 tile of the src
						step_towards(src,target) //move towards the mob
						if(prob(20)) //10% chance to run this code
							if(length(src.Skills)) //if the src has anything in a list called Skills
								chosenSkills = pick(src.Skills) //set the temporary variable chosenSkills equal to something randomly picked from the Skills list
								chosenSkills = text2path("/mob/techniques/verb/[chosenSkills]")
								if(!(chosenSkills in src.verbs)) //if doesn't chosenSkills exists inside src.verbs
									src.verbs += chosenSkills //add the verb
								call(src,chosenSkills)() //use it
					if(!M) //if there's no mob in oview(8)
						target = null //set target to null

mob/enemy
	enemy = 1 // all mobs in the mob/enemy tree have their enemy variable set to 1
	strmod = 1.5 //by default mobs have a 50% more effective stat
	defmod = 1.5
	reimod = 1.5
	resmod = 1.5
	tmp/dodge = 0

	var

		list/ignorelist //define a list that holds all races the enemy will ignore




// stuff for sao


	starthollow
		name = "{NPC}Wild Black Boar"
		icon = 'boar.dmi'
		soulpower = 10
		health = 10000
		healthwas = 10000
		reiryoku = 10000000
		strength = 200
		defence = 500
		reiatsu = 500
		resistance = 500
		expgain = 1500
		spawntime = 30
		boarkills = 1
		Cor = 500
		Corwas = 500
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,2))
		itemDrops = list(list(new/obj/equipment/unique/LordSword,2))
		itemDrops = list(list(new/obj/equipment/unique/staff,2))



	boar
		name = "{NPC}Wild Adult Boar"
		icon = 'newboar.dmi'
		soulpower = 10
		health = 10000
		healthwas = 10000
		reiryoku = 10000000
		strength = 1500
		defence = 1500
		reiatsu = 1500
		resistance = 1500
		expgain = 1900
		spawntime = 60
		boarkills = 1
		Cor = 800
		Corwas = 800
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,1))
		itemDrops = list(list(new/obj/equipment/unique/LordSword,10))
		itemDrops = list(list(new/obj/equipment/unique/staff,1))


	blacksabi
		name = "{NPC}Black Goblin"
		icon = 'blacksabi.dmi'
		soulpower = 50
		icon_state = ""
		health = 50000
		healthwas = 50000
		strength = 40000
		defence = 40000
		reiatsu = 40000
		resistance = 40000
		expgain = 7000
		spawntime = 300
		Cor = 250
		Corwas = 1000
		itemDrops = list(list(new/obj/equipment/unique/LordSword,3))
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,3))
		itemDrops = list(list(new/obj/equipment/unique/staff,2))

	barra2
		name = "{NPC}Black Knight"
		icon = 'barra2.dmi'
		soulpower = 250
		icon_state = ""
		health = 250000
		healthwas = 250000
		reiryoku = 10000000
		strength = 100000
		defence = 100000
		mana = 100000
		gottitlereward = 1
		resistance = 10000
		expgain = 90000
		spawntime = 440
		Cor = 25000
		Corwas = 25000
		Skills = list("bala")
		gottitlereward = 1
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,100))







//floor 2

	evilhollow
		name = "{NPC}Forsaken"
		icon = 'adjuuaa.dmi'
		icon_state = "12"
		soulpower = 150
		enemy = 1
		rundelay = 1
		health = 350000
		healthwas = 350000
		reiryoku = 10000000
		strength = 90000
		defence = 95010
		mana = 49010
		resistance = 35010
		expgain = 12000
		spawntime = 60
		forsakenkills = 1
		Cor = 1100
		Corwas = 1100
		Skills = list("Cero")
		itemDrops = list(list(new/obj/equipment/unique/NnotitraSword,1))
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,2))

	Kratos
		name = "{NPC}Servant of Darkness"
		icon = 'kratos.dmi'
		icon_state = "blank"
		soulpower = 1500
		rundelay = 4
		enemy = 1
		health = 750000
		healthwas = 1000000
		strength = 150000
		defence = 150000
		mana= 150000
		resistance = 150000
		expgain = 170000
		boss2 = 2
		spawntime = 250
		Cor = 50000
		Corwas = 50000
		itemDrops = list(list(new/obj/equipment/legendary/LoyaltyArmor,2))
		itemDrops = list(list(new/obj/equipment/unique/staffice,3))

//floor 3

	Hougfail
		name = "{NPC}Undead Knight"
		icon = 'hougfailure.dmi'
		enemy = 1
		health = 500000
		healthwas = 500000
		reiryoku = 10000000
		strength = 300000
		defence = 300000
		reiatsu = 300000
		resistance = 300000
		expgain = 19000
		spawntime = 70
		Cor = 3500
		Corwas = 3500
		Skills = list("CCero")
		itemDrops = list(list(new/obj/equipment/legendary/Hougyokurobe,2))
		itemDrops = list(list(new/obj/equipment/legendary/NewCoat,2))

	larza
		name = "{NPC}Mummy"
		icon = 'soulking.dmi'
		icon_state = ""
		soulpower = 600
		enemy = 1
		rundelay = 1
		health = 1500000
		healthwas = 1500000
		reiryoku = 10000000
		strength = 600000
		defence = 600000
		reiatsu = 600000
		resistance = 600000
		expgain = 250000
		spawntime = 700
		boss3 = 1
		larzakills = 1
		Cor = 75000
		Corwas = 75000
		itemDrops = list(list(new/obj/equipment/legendary/magearmor1,3))
		itemDrops = list(list(new/obj/equipment/unique/staffice,1))

//floor 4




	Count
		name = "{NPC}Hades"
		icon = 'hellboss2.dmi'
		soulpower = 600
		enemy = 1
		rundelay = 1
		health = 3000000
		healthwas = 3000000
		reiryoku = 10000000
		strength = 900000
		defence = 1500000
		reiatsu = 1590100
		resistance = 1630100
		expgain = 280000
		boss4 = 1
		spawntime = 480
		Cor = 145000
		Corwas = 145000
		Skills = list("Cero","GranReyCero")
		itemDrops = list(list(new/obj/equipment/legendary/hellarmor,2))
		itemDrops = list(list(new/obj/equipment/unique/Hellsword,5))
	Boss
		name = "{NPC}Hades Guard"
		icon = 'Hellboss.dmi'
		soulpower = 100
		enemy = 1
		rundelay = 1
		health = 2000000
		healthwas = 2000000
		reiryoku = 10000000
		strength = 750000
		defence = 750000
		reiatsu = 559010
		resistance = 238010
		expgain = 28000
		hadesguardkill = 1
		spawntime = 80
		Cor = 12500
		Corwas = 12500
		Skills = list("Cero","GranReyCero")
		itemDrops = list(list(new/obj/equipment/legendary/hellarmor,2))



//
	Heathcliff
		name = "{NPC}Black Soul"
		icon = 'zanspirit4.dmi'
		soulpower = 35
		health = 500000000
		healthwas = 500000000
		reiryoku = 10000000
		strength = 25000000
		defence = 250000
		reiatsu = 25000
		resistance = 25000
		expgain = 1000000
		spawntime = 800
		Cor = 30000000
		Corwas = 30000000
		itemDrops = list(list(new/obj/equipment/unique/Elucidator,1))


// magic blade cave



	Mblade
		name = "{NPC}Zekki"
		icon = 'armydude.dmi'
		soulpower = 3500
		health = 100000000
		healthwas = 100000000
		reiryoku = 10000000
		strength = 20000000
		defence = 250000
		reiatsu = 2500000
		resistance = 25000
		expgain = 100000
		spawntime = 800
		Cor = 150000
		Corwas = 150000
		itemDrops = list(list(new/obj/equipment/unique/magicblade,0.001))





	Mbladeboss
		name = "{NPC}Mufasa the Indead"
		icon = 'zanspirit7.dmi'
		soulpower = 5000
		health = 500000000
		healthwas = 500000000
		reiryoku = 10000000
		strength = 50000000
		defence = 250000
		reiatsu = 2500000
		resistance = 25000
		expgain = 1000000
		boss13 = 1
		spawntime = 800
		Cor = 30000000
		Corwas = 30000000
		itemDrops = list(list(new/obj/equipment/unique/magicblade,2))




//floor 5

	Zanspirit2
		name = "{NPC}Netzu"
		icon = 'ZanSpirit2.dmi'
		icon_state = "hai"
		soulpower = 1000
		enemy = 1
		rundelay = 1
		health = 7000000
		healthwas = 10000000
		reiryoku = 10000000
		strength = 1000000
		defence = 1000000
		reiatsu = 1000000
		resistance = 1000000
		expgain = 31000
		spawntime = 80
		Skills = 1
		bankaikillsgain = 1
		Cor = 5000
		Corwas = 5000
		itemDrops = list(list(new/obj/equipment/legendary/Orbs,1))


	Yhwach
		name = "Yhwach"
		icon = 'yawcho.dmi'
		icon_state = ""
		soulpower = 20000
		enemy = 1
		rundelay = 1
		health = 60000000
		healthwas = 60000000
		reiryoku = 10000000
		strength = 5000000
		defence = 2000000
		reiatsu = 1200000
		resistance = 1550000
		expgain = 1000000
		boss5 = 1
		spawntime = 300
		Cor = 2000000
		Corwas = 2000000
		Skills = list("Getsuga")
		itemDrops = list(list(new/obj/equipment/unique/DarkRepulser,1))

//floor6


	ZanSpirit3
		name = "{NPC}Hitku"
		icon = 'zaspirit3.dmi'
		icon_state = "base"
		soulpower = 10000
		enemy = 1
		rundelay = 1
		health = 3000000
		healthwas = 3000000
		reiryoku = 10000000
		strength = 1500000
		defence = 1500000
		reiatsu = 1500000
		resistance = 150000
		expgain = 33000
		spawntime = 40
		Skills = 1
		bankaikillsgain = 1
		Cor = 6000
		Corwas = 6000
		Skills = list("Shakkahou")
		itemDrops = list(list(new/obj/equipment/legendary/Armor2,1))


	hom
		name = "{NPC}Homunculi"
		icon = 'hm3.dmi'
		soulpower = 10000
		icon_state = ""
		health = 20000000
		healthwas = 20000000
		strength = 5000000
		defence = 5000000
		reiatsu = 5000000
		resistance = 5000000
		expgain = 1000000
		boss6 = 1
		spawntime = 650
		Cor = 4000000
		Corwas = 4000000
		itemDrops = list(list(new/obj/equipment/legendary/CoatofMidnight,1))


//floor 7


	casper
		name = "{NPC}Casper"
		icon = 'casper.dmi'
		soulpower = 10000
		icon_state = ""
		health = 20000000
		healthwas = 20000000
		strength = 5000000
		defence = 5000000
		reiatsu = 5000000
		resistance = 5000000
		expgain = 42000
		spawntime = 50
		Cor = 8000
		Corwas = 8000
		itemDrops = list(list(new/obj/equipment/unique/stafflight,1))




	SK3
		name = "{NPC}Blue Demon"
		icon = 'firedemon.dmi'
		icon_state = ""
		soulpower = 100000
		enemy = 1
		rundelay = 1
		health = 50000000
		healthwas = 50000000
		reiryoku = 10000000
		strength = 10000000
		defence = 10000000
		reiatsu = 10000000
		resistance = 10000000
		expgain = 1500000
		boss7 = 1
		spawntime = 460
		Cor = 6000000
		Corwas = 6000000
		Skills = list("ShootDragon")
		itemDrops = list(list(new/obj/equipment/legendary/FrostOrbs,1))



//floor8
	darkph
		name = "{NPC}Dark Phoniex"
		icon = 'hollow111.dmi'
		icon_state = ""
		soulpower = 100
		enemy = 1
		rundelay = 1
		health = 50000000
		healthwas = 50000000
		reiryoku = 10000000
		strength = 10000000
		defence = 8330100
		reiatsu = 8320100
		resistance = 8330010
		expgain = 50000
		spawntime = 80
		Cor = 15000
		Corwas = 15000
		Skills = list("Mugetsu")
		itemDrops = list(list(new/obj/equipment/unique/UnityVox,1))


	vaizard97
		name = "{NPC}Bugsy"
		icon = 'Vaizard1.dmi'
		icon_state = "VaiNpc4"
		soulpower = 200
		enemy = 1
		rundelay = 1
		health = 250000000
		healthwas = 250000000
		reiryoku = 10000000
		strength = 20000000
		defence = 40000000
		reiatsu = 10000000
		resistance = 60000000
		expgain = 1750000
		boss8 = 1
		spawntime = 260
		Cor = 7000000
		Corwas = 7000000
		itemDrops = list(list(new/obj/equipment/unique/Excalibur,1))


// floor 9


	Wabisuke
		name = "{NPC}Wabi"
		icon = 'zanspirit8.dmi'
		icon_state = "base"
		soulpower = 100
		enemy = 1
		rundelay = 1
		health = 250000000
		healthwas = 250000000
		reiryoku = 10000000
		strength = 20000000
		defence = 40000000
		reiatsu = 20000000
		resistance = 60000000
		expgain = 70000
		spawntime = 90
		Cor = 25000
		Corwas = 25000
		Skills = list("Nake")
		itemDrops = list(list(new/obj/equipment/unique/UnityVox,1))


	HellG
		name = "{NPC} Tsuki Guard"
		icon = 'kush.dmi'
		soulpower = 600
		enemy = 1
		rundelay = 1
		health = 400000000
		healthwas = 400000000
		reiryoku = 10000000
		strength = 40000000
		defence = 60000000
		reiatsu = 50000000
		resistance = 60000000
		expgain = 120000
		boss9 = 1
		spawntime = 120
		Cor = 350000
		Corwas = 350000
		itemDrops = list(list(new/obj/equipment/legendary/magearmor2,1))

	reaper
		name = "{NPC}Champion of Tsuki"
		icon = 'reap.dmi'
		soulpower = 10
		icon_state = ""
		health = 300000000
		healthwas = 300000000
		strength = 50000000
		defence = 50000000
		reiatsu = 50000000
		resistance = 50000000
		expgain = 140000
		boss9 = 1
		spawntime = 80
		Cor = 500000
		Corwas = 500000
		itemDrops = list(list(new/obj/equipment/unique/UnityVox,1))

//floor10




	Lizzardman
		name = "{NPC}Lizzard Man"
		icon = 'saomob2.dmi'
		soulpower = 35
		health = 500000000
		healthwas = 500000000
		reiryoku = 10000000
		strength = 65000000
		defence = 65000000
		reiatsu = 65000000
		resistance = 65000000
		expgain = 150000
		spawntime = 160
		Cor = 250000
		Corwas = 250000
		itemDrops = list(list(new/obj/equipment/legendary/asunaarmor,1))



	Robot
		name = "{NPC}Mr.Robot"
		icon = 'saomob1.dmi'
		soulpower = 35
		health = 750000000
		healthwas = 750000000
		reiryoku = 10000000
		strength = 40000000
		defence = 75000000
		reiatsu = 20000000
		resistance = 20000000
		expgain = 160000
		spawntime = 100
		Cor = 250000
		Corwas = 250000
		itemDrops = list(list(new/obj/equipment/legendary/magearmor3,1))


	boss10
		name = "{NPC}Yakzui"
		icon = 'barra6.dmi'
		soulpower = 35
		health = 1750000000
		healthwas = 1750000000
		reiryoku = 10000000
		strength = 40000000
		defence = 75000000
		reiatsu = 20000000
		boss10 = 1
		resistance = 20000000
		expgain = 2500000
		spawntime = 300
		Cor = 4000000
		Corwas = 4000000
		itemDrops = list(list(new/obj/equipment/legendary/asunaarmor,1))





//floor 11

	freezer
		name = "{NPC}Freezer"
		icon = 'cha.dmi'
		soulpower = 35
		health = 1750000000
		healthwas = 1750000000
		reiryoku = 10000000
		strength = 90000000
		defence = 95000000
		reiatsu = 20000000
		resistance = 20000000
		expgain = 185000
		spawntime = 100
		Cor = 375000
		Corwas = 375000
		itemDrops = list(list(new/obj/equipment/unique/Demonic,1))


	wolfie
		name = "{NPC}Wolfzer"
		icon = 'n19.dmi'
		soulpower = 35
		health = 1750000000
		healthwas = 1750000000
		reiryoku = 10000000
		strength = 90000000
		defence = 75000000
		reiatsu = 20000000
		resistance = 20000000
		expgain = 195000
		spawntime = 100
		Cor = 375000
		Corwas = 375000
		itemDrops = list(list(new/obj/equipment/unique/Excalibur,1))



	boss11
		name = "{NPC}Kaiba"
		icon = 'prince.dmi'
		soulpower = 35
		health = 2750000000
		healthwas = 2750000000
		reiryoku = 10000000
		strength = 120000000
		defence = 175000000
		reiatsu = 20000000
		resistance = 200000000
		expgain = 3000000
		boss11 = 1
		spawntime = 300
		Cor = 8000000
		Corwas = 8000000
		itemDrops = list(list(new/obj/equipment/unique/stafftime,1))


//floor 12



	fireman
		name = "{NPC}Zuko"
		icon = 'bountofireman.dmi'
		soulpower = 35
		health = 2750000000
		healthwas = 2750000000
		reiryoku = 10000000
		strength = 120000000
		defence = 175000000
		reiatsu = 20000000
		resistance = 200000000
		expgain = 230000
		spawntime = 80
		Cor = 380000
		Corwas = 380000
		itemDrops = list(list(new/obj/equipment/legendary/FireOrbs,1))




	heartless
		name = "{NPC}Heartless"
		icon = 'heartless.dmi'
		soulpower = 35
		health = 2750000000
		healthwas = 2750000000
		reiryoku = 10000000
		strength = 220000000
		defence = 175000000
		reiatsu = 20000000
		resistance = 200000000
		expgain = 210000
		spawntime = 80
		Cor = 385000
		Corwas = 385000
		itemDrops = list(list(new/obj/equipment/legendary/neptune,1))

	boss12
		name = "{NPC}Lost Swordsman"
		icon = 'vaiichi.dmi'
		soulpower = 35
		health = 5750000000
		healthwas = 5750000000
		reiryoku = 10000000
		strength = 220000000
		defence = 375000000
		reiatsu = 40000000
		resistance = 400000000
		expgain = 4000000
		boss12 = 1
		spawntime = 300
		Cor = 15000000
		Corwas = 15000000
		itemDrops = list(list(new/obj/equipment/unique/Demonic,1))





//floor13


	Ogs
		name = "{NPC}Oggie"
		icon = 'mob7.dmi'
		soulpower = 35
		health = 5750000000
		healthwas = 5750000000
		reiryoku = 10000000
		strength = 320000000
		defence = 375000000
		reiatsu = 30000000
		resistance = 300000000
		expgain = 240000
		spawntime = 80
		Cor = 405000
		Corwas = 405000

	Zarz
		name = "{NPC}Zarz"
		icon = 'mob5.dmi'
		soulpower = 35
		health = 6750000000
		healthwas = 6750000000
		reiryoku = 10000000
		strength = 380000000
		defence = 675000000
		reiatsu = 30000000
		resistance = 600000000
		expgain = 45000000
		boss13 = 1
		spawntime = 400
		Cor = 17000000
		Corwas = 17000000
		itemDrops = list(list(new/obj/equipment/unique/magicblade,1))

//floor 14

	zachi
		name = "{NPC}Zachi"
		icon = 'enemys.dmi'
		soulpower = 35
		health = 10750000000.0
		healthwas = 10750000000.0
		reiryoku = 10000000
		strength = 820000000.0
		defence = 875000000.0
		reiatsu = 50000000
		resistance = 900000000.0
		expgain = 5000000
		spawntime = 480
		boss14 = 1
		Cor = 18500000
		Corwas = 18500000
		itemDrops = list(list(new/obj/equipment/unique/magicblade,1))

	fireza
		name = "{NPC}Fire Elemental"
		icon = 'mob3.dmi'
		soulpower = 35
		health = 7750000000.0
		healthwas = 7750000000.0
		reiryoku = 10000000
		strength = 620000000.0
		defence = 675000000.0
		reiatsu = 60000000.0
		resistance = 900000000.0
		expgain = 260000
		spawntime = 80
		Cor = 545000
		Corwas = 145000





//floor15


	scopi
		name = "{NPC}Scorpi"
		icon = 'mob2.dmi'
		soulpower = 35
		health = 14750000000.0
		healthwas = 14750000000.0
		reiryoku = 10000000
		strength = 1020000000.0
		defence = 1075000000.0
		reiatsu = 100000000.0
		resistance = 1000000000.0
		expgain = 300000
		spawntime = 80
		Cor = 165000
		Corwas = 165000
		itemDrops = list(list(new/obj/equipment/unique/magicblade2,1))

	weis
		name = "{NPC}Zachi"
		icon = 'mob6.dmi'
		soulpower = 35
		health = 20750000000.0
		healthwas = 20750000000.0
		reiryoku = 10000000
		strength = 1320000000.0
		defence = 1375000000.0
		reiatsu = 130000000.0
		resistance = 1300000000.0
		expgain = 6000000
		spawntime = 480
		boss14 = 1
		Cor = 20000000
		Corwas = 20000000
		itemDrops = list(list(new/obj/equipment/unique/magicblade2,1))