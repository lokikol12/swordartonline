#define EQUIPMENT_LAYER 20
#define WEAPON_LAYER EQUIPMENT_LAYER-0.01
#define MASK_LAYER EQUIPMENT_LAYER-0.02
#define RACE_CLOTH_LAYER EQUIPMENT_LAYER-0.03
#define CLOTH_III_LAYER EQUIPMENT_LAYER-0.04
#define CLOTH_II_LAYER EQUIPMENT_LAYER-0.05
#define CLOTH_I_LAYER EQUIPMENT_LAYER-0.06

client/var/list/equipmentSlots = list()

obj/equipment
	var/dontKeep
	var/item_type //check things like weapons
	//plane = 150
	common
		rarity = 1
		cape{				layer = CLOTH_II_LAYER;	name = "Cape";				icon = 'clothcape.dmi'}
		mayurimask{			layer = MASK_LAYER;		name = "Mayuri Mask";		icon = 'mayurimask.dmi'}
		clothpant{			layer = CLOTH_I_LAYER;	name = "Pants";				icon = 'clothpant.dmi'}
		clothschooluniform{	layer = CLOTH_I_LAYER;	name = "School Uniform";	icon = 'clothschooluniform.dmi'}
		clothuraharahat{	layer = CLOTH_II_LAYER;	name = "Urahara's Hat";		icon = 'clothuraharahat.dmi'}
		clothshirt{			layer = CLOTH_I_LAYER;	name = "Shirt";				icon = 'clothshirt.dmi'}
		flowercloak{		layer = CLOTH_II_LAYER;	name = "Flower Cloak";		icon = 'clothflowercloak.dmi'}
		sunglasses{			layer = CLOTH_I_LAYER;	name = "Sunglasses";		icon = 'clothsunglass.dmi'}
		ninja{				layer = CLOTH_II_LAYER;	name = "Ninja Suit";		icon = 'clothninja.dmi'}
		glasses{			layer = CLOTH_I_LAYER;	name = "Glasses";			icon = 'clothglass.dmi'}
		uraharasuit{		layer = CLOTH_II_LAYER;	name = "Urahara's Suit";	icon = 'clothurahara.dmi'}
		leatherjacket{		layer = CLOTH_II_LAYER;	name = "Leather Jacket";	icon = 'clothkariya.dmi'}
		tousen{				layer = CLOTH_II_LAYER;	name = "Tousen Goggle";		icon = 'clothtousen.dmi'}
		Shoes{				layer = CLOTH_I_LAYER;	name = "Shoes";				icon = 'shoes.dmi'}
		SunGlasses{			layer = CLOTH_II_LAYER;	name = "SunGlasses";		icon = 'sunglasses2.dmi'}
		BlackSuit{			layer = CLOTH_II_LAYER;	name = "BlackSuit";			icon = 'blacksuit.dmi'}
	///unique items//class clothes
	unique

		Demonic
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Demonic Sword Gram"
			icon = 'Demonic.dmi'
			statMods = list(10)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon4)
					return
				if(usr.staffon1)
					return
				if(usr.staffon5)
					return
				if(usr.staffon3)
					return
				if(usr.staffon2)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.staffon4)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon11)
					usr.swordon11 = 0
				else
					usr.swordon11 = 1
				..()




		sword
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Sword"
			icon = 'sword.dmi'
			statMods = list(0.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.staffon3)
					return
				if(usr.staffon5)
					return
				if(usr.staffon4)
					return
				if(usr.staffon2)
					return
				if(usr.swordon8)
					return
				if(usr.staffon1)
					return
				if(usr.swordon11)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon)
					usr.swordon = 0
					usr.strmod = usr.defaultstrmod
				else usr.swordon = 1
				if(usr.inshikai||usr.inbankai||usr.inrelease)
					return
				..()

		rarity = 2
		sword
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Sword"
			icon = 'sword.dmi'
			statMods = list(0.5)
			Wear()
				if(usr.swordon)
					return
				if(usr.swordon3)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.staffon3)
					return
				if(usr.staffon5)
					return
				if(usr.staffon2)
					return
				if(usr.swordon11)
					return
				if(usr.staffon1)
					return
				if(usr.staffon4)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon2 == 1)
					usr.swordon2 = 0
					usr.strmod = usr.defaultstrmod
				else usr.swordon2 = 1
				..()
		NnotitraSword
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "NnotitraS"
			icon = 'nnoritra2.dmi'
			statMods = list(1.3)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.staffon3)
					return
				if(usr.staffon2)
					return
				if(usr.staffon5)
					return
				if(usr.staffon4)
					return
				if(usr.swordon8)
					return
				if(usr.staffon1)
					return
				if(usr.swordon11)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon3 == 1)
					usr.swordon3 = 0
					usr.strmod = usr.defaultstrmod

				else usr.swordon3 = 1

				..()

		darkExcalibur
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Dark Excalibur"
			icon = 'saosword5.dmi'
			statMods = list(15)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon4)
					return
				if(usr.swordon7)
					return
				if(usr.staffon4)
					return
				if(usr.staffon3)
					return
				if(usr.staffon2)
					return
				if(usr.staffon5)
					return
				if(usr.swordon11)
					return
				if(usr.staffon1)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1
					usr.verbs += /mob/techniques/verb/Inferno

				..()




		Excalibur
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Excalibur"
			icon = 'saosword3.dmi'
			statMods = list(7)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon4)
					return
				if(usr.swordon7)
					return
				if(usr.staffon4)
					return
				if(usr.staffon3)
					return
				if(usr.staffon2)
					return
				if(usr.staffon5)
					return
				if(usr.swordon11)
					return
				if(usr.staffon1)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()


		UnityVox
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Unity"
			icon = 'saosword4.dmi'
			statMods = list(6.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon4)
					return
				if(usr.staffon3)
					return
				if(usr.staffon4)
					return
				if(usr.swordon11)
					return
				if(usr.staffon5)
					return
				if(usr.staffon2)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.swordon9)
					usr.swordon9 = 0
				else
					usr.swordon9 = 1

				..()


		LordSword
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Lord Sword"
			icon = 'newsword5.dmi'
			statMods = list(1)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon4)
					return
				if(usr.staffon1)
					return
				if(usr.staffon3)
					return
				if(usr.staffon5)
					return
				if(usr.staffon4)
					return
				if(usr.staffon2)
					return
				if(usr.swordon7)
					return
				if(usr.swordon11)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					usr.swordon10 = 0
				else
					usr.swordon10 = 1

				..()
		DarkRepulser
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Dark Repulser"
			icon = 'saosword1.dmi'
			statMods = list(7.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.staffon5)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.staffon4)
					return
				if(usr.staffon3)
					return
				if(usr.staffon6)
					return
				if(usr.staffon2)
					return
				if(usr.staffon1)
					return
				if(usr.swordon9)
					return
				if(usr.swordon11)
					return
				if(usr.swordon10)
					return
				if(usr.swordon4)
					usr.swordon4 = 0
					usr.strmod = usr.defaultstrmod
				else
					usr.swordon4 = 1

				..()

		Elucidator
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Elucidator"
			icon = 'saosword2.dmi'
			statMods = list(7.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.staffon1)
					return
				if(usr.staffon5)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.staffon4)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.staffon3)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.swordon5)
					usr.swordon5 = 0
				else
					usr.swordon5 = 1

				..()


		Hellsword
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Hades Sword"
			statMods = list(2.9)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon4)
					return
				if(usr.staffon5)
					return
				if(usr.swordon5)
					return
				if(usr.staffon1)
					return
				if(usr.swordon)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.staffon4)
					return
				if(usr.swordon10)
					return
				if(usr.staffon3)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.swordon6)
					usr.overlays -= /obj/tichibhell
					usr.strmod = usr.strmod - 1.9
					usr.swordon6 = 0
				else
					usr.swordon6 = 1
					usr.overlays += /obj/tichibhell



				..()


		ZarakiSword
			layer = WEAPON_LAYER
			name = "ZakariS"
			icon = 'zarakishi.dmi'
			itemPos = list(-20,-12,-32,-32)


			statMods = list(1.3)

			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon)
					return
				if(usr.staffon4)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.staffon5)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.staffon3)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.swordon7)
					usr.swordon7 = 0
					usr.strmod = usr.defaultstrmod
				else usr.swordon7 = 1
				..()
//staff


		staff
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Fire"
			icon = 'saostaff.dmi'
			statMods = list(0,0,1.5,0)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.staffon5)
					return
				if(usr.staffon4)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon3)
					return
				if(usr.swordon10)
					return
				if(usr.staffon3)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.staffon1 == 1)
					usr.verbs -= /mob/techniques/verb/Fireballs
					usr.reimod = usr.defaultreimod
					usr.staffon1 = 0
				else
					usr.staffon1 = 1
					usr.verbs += /mob/techniques/verb/Fireballs
				..()

		staffice
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Ice"
			icon = 'saostaff3.dmi'
			statMods = list(0,0,2.5,0)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.staffon4)
					return
				if(usr.staffon5)
					return
				if(usr.swordon9)
					return
				if(usr.swordon11)
					return
				if(usr.swordon3)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.staffon3)
					return
				if(usr.staffon2 == 1)
					usr.verbs -= /mob/techniques/verb/Hakuren
					usr.reimod = usr.defaultreimod
					usr.staffon2 = 0
				else
					usr.staffon2 = 1
					usr.verbs += /mob/techniques/verb/Hakuren
				..()



		stafflight
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Light"
			icon = 'saostaff.dmi'
			statMods = list(0,0,6.5,0)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon3)
					return
				if(usr.staffon4)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.staffon5)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.staffon3 == 1)
					usr.verbs -= /mob/techniques/verb/Sai
					usr.reimod = usr.defaultreimod
					usr.staffon3 = 0
				else
					usr.staffon3 = 1
					usr.verbs += /mob/techniques/verb/Sai
				..()

		stafftime
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Time"
			icon = 'staffoftime.dmi'
			statMods = list(0,0,9.5,0)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon3)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.staffon5)
					return
				if(usr.staffon3)
					return
				if(usr.staffon4 == 1)
					usr.rundelay = usr.defaultrundelay
					usr.staffon4 = 0
				else
					usr.staffon4 = 1
					usr.rundelay = 0.5
				..()

		magicblade
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Blade of Witchcraft"
			icon = 'magicblade.dmi'
			statMods = list(4,0,8,0)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon)
					return
				if(usr.swordon4)
					return
				if(usr.swordon5)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon3)
					return
				if(usr.swordon10)
					return
				if(usr.staffon1)
					return
				if(usr.swordon11)
					return
				if(usr.staffon2)
					return
				if(usr.staffon3)
					return
				if(usr.staffon4)
					return
				if(usr.staffon5 == 1)
					usr.staffon5 = 0
				else
					usr.staffon5 = 1
				..()


		magicblade2
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Blade of Ultimate Magic"
			icon = 'magicblade2.dmi'
			statMods = list(6,0,11,0)
			Wear()
				if(usr.swordon4)
					return
				if(usr.staffon6 == 1)
					usr.staffon6 = 0
				else
					usr.staffon6 = 1
				..()


		Eshikai{	layer = WEAPON_LAYER;	name = "Eshikai";		icon = 'Eshikai.dmi'}
		IchigoSword{layer = WEAPON_LAYER;	name = "Tensa Zangetsu";icon = 'ichigobankai.dmi';statMods = list(1.5,0.5,0.5,0.5)}

		//subject to change depending on what people want.
		//this makes it so they can put stuff on top of race clothes.
		shinigamisuit{	layer = CLOTH_I_LAYER	;name = "Shinigami Suit";	icon = 'shinigamicloth.dmi'}
		quincy{			layer = CLOTH_I_LAYER	;name = "Quincy Suit";		icon = 'quincysuit.dmi'}
		arrancarsuit{	layer = CLOTH_I_LAYER	;name = "Arrancar Suit";	icon = 'arrancarsuit.dmi'}


	///rare items//
	rare
		rarity = 3

		bugsymask	{layer = MASK_LAYER; name = "Bugsy Mask"; 	icon = 'Vaizard6.dmi'}
		blackichigo	{layer = MASK_LAYER; name = "Ichigo v2"; 	icon = 'Vaizard7.dmi'}
		rahmask		{layer = MASK_LAYER; name = "Rah Mask"; 	icon = 'Vaizard4.dmi'}
		kensimask	{layer = MASK_LAYER; name = "Kensi Mask"; 	icon = 'Vaizard5.dmi'}
		lisamask	{layer = MASK_LAYER; name = "Lisa's Mask";	icon = 'lisa.dmi'}
		shinjimask	{layer = MASK_LAYER; name = "Shinji's Mask";icon = 'shinjimask.dmi'}
		ichigomask	{layer = MASK_LAYER; name = "Ichigo's Mask";icon = 'ichigomask2.dmi'}
		Uchiha2		{layer = CLOTH_III_LAYER;name = "Uchiha Robe(Purple)";icon = 'uchiha1.dmi';statMods = list(2,0,0,0)}
		Uchiha		{layer = CLOTH_III_LAYER;name = "Uchiha Robe";icon = 'uchiha2.dmi'}

	//the fun starts here//
	legendary
		rarity = 4
		vastomask		{layer = MASK_LAYER;	 name = "Vasto's Mask";		icon = 'Vastomask.dmi';statMods = list(0.5,0.5,0.5,0.5)}
		OrgArmor		{layer = CLOTH_III_LAYER;name = "Org Zero Armor";	icon = 'yh.dmi';statMods = list(2,0,2,0)}
		zero			{layer = CLOTH_III_LAYER;name = "Zero";				icon = 'zero.dmi';statMods = list(10,10,10,10,10)}


		Armor2
			layer = CLOTH_III_LAYER
			name = "Retako"
			icon = 'armor2.dmi'
			statMods = list(1,2.5,0,0)
			Wear()
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor1 == 1)
					usr.strmod = usr.defaultstrmod
					usr.defmod = usr.defaultresmod
					usr.armor1 = 0
				else
					usr.armor1 = 1
				..()



		CoatofMidnight
			layer = CLOTH_III_LAYER
			name = "Coat of Midnight"
			icon = 'midnightcoat.dmi'
			statMods = list(5,5,5,5)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor2 == 1)
					usr.resmod = usr.defaultresmod
					usr.defmod = usr.defaultresmod
					usr.strmod = usr.defaultstrmod
					usr.reimod = usr.defaultreimod
					usr.armor2 = 0
				else
					usr.armor2 = 1
				..()



		LoyaltyArmor
			layer = CLOTH_III_LAYER
			name = "Loyalty Armor"
			icon = 'resarmor.dmi'
			statMods = list(0.7,0.7,0,0)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					usr.strmod = usr.defaultstrmod
					usr.defmod = usr.defaultresmod
					usr.armor3 = 0
				else
					usr.armor3 = 1
				..()



		Hougyokurobe
			layer = CLOTH_III_LAYER
			name = "Zettu Armor"
			icon = 'houg3.dmi'
			statMods = list(0,1.5,1.5,0)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor4 == 1)
					usr.reimod = usr.defaultreimod
					usr.defmod = usr.defaultresmod
					usr.armor4 = 0
				else
					usr.armor4 = 1
				..()


		hellarmor
			layer = CLOTH_III_LAYER
			name = "Hades Armor"
			icon = 'hellarmor.dmi'
			statMods = list(1.5,2,0,0)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor5 == 1)
					usr.strmod = usr.defaultdefmod
					usr.defmod = usr.defaultresmod
					usr.armor5 = 0
				else
					usr.armor5 = 1
				..()





		magearmor1
			layer = CLOTH_III_LAYER
			name = "Magic Coat"
			icon = 'saomagearmor2.dmi'
			statMods = list(0,0,1.5,1.5)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor6 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.armor6 = 0
				else
					usr.armor6 = 1
				..()

		magearmor2
			layer = CLOTH_III_LAYER
			name = "Magic Coat (2)"
			icon = 'saomagearmor3.dmi'
			statMods = list(0,0,2.5,2.5)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor7 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.armor7 = 0
				else
					usr.armor7 = 1
				..()


		magearmor3
			layer = CLOTH_III_LAYER
			name = "Archmage Suit"
			icon = 'saomagearmor4.dmi'
			statMods = list(0,2,5,7)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor8 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.armor8 = 0
				else
					usr.armor8 = 1
				..()

		asunaarmor
			layer = CLOTH_III_LAYER
			name = "Blood Oath Armor"
			icon = 'saoasunaarmor.dmi'
			statMods = list(5,5,5,5)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor10 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor9 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.armor9 = 0
				else
					usr.armor9 = 1
				..()


		neptune
			layer = CLOTH_III_LAYER
			name = "Neptune Armor"
			icon = 'neptune.dmi'
			statMods = list(0,10,0,10)
			Wear()
				if(usr.armor1 == 1)
					return
				if(usr.armor2 == 1)
					return
				if(usr.armor3 == 1)
					return
				if(usr.armor4 == 1)
					return
				if(usr.armor5 == 1)
					return
				if(usr.armor6 == 1)
					return
				if(usr.armor7 == 1)
					return
				if(usr.armor8 == 1)
					return
				if(usr.armor9 == 1)
					return
				if(usr.armor10 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.armor10 = 0
				else
					usr.armor10 = 1
				..()






//orbs



		Orbs
			layer = CLOTH_III_LAYER
			name = "Truth Orbs"
			icon = 'seekorbs.dmi'
			statMods = list(0.5,0.5,0.5,0.5)
			Wear()
				if(usr.orbon2 == 1)
					return
				if(usr.orbon3 == 1)
					return
				if(usr.orbon1 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.orbon1 = 0
				else
					usr.orbon1 = 1
				..()



		FrostOrbs
			layer = CLOTH_III_LAYER
			name = "Frost Orbs"
			icon = 'iceorb.dmi'
			statMods = list(1,1,1,1)
			Wear()
				if(usr.orbon1 == 1)
					return
				if(usr.orbon3 == 1)
					return
				if(usr.orbon2 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.strmod = usr.defaultstrmod
					usr.defmod = usr.defaultdefmod
					usr.orbon2 = 0
				else
					usr.orbon2 = 1
				..()


		FireOrbs
			layer = CLOTH_III_LAYER
			name = "Fire Orbs"
			icon = 'fireorb.dmi'
			statMods = list(2,2,2,2)
			Wear()
				if(usr.orbon1 == 1)
					return
				if(usr.orbon2 == 1)
					return
				if(usr.orbon3 == 1)
					usr.resmod = usr.defaultresmod
					usr.reimod = usr.defaultreimod
					usr.strmod = usr.defaultstrmod
					usr.defmod = usr.defaultdefmod
					usr.orbon3 = 0
				else
					usr.orbon3 = 1
				..()


















		CosmeticTicket
			name = "Cosmetic Ticket"
			icon = 'ticket.dmi';icon_state="Ticket"
			Wear()
				if(worn) return
				dontKeep = 1
				usr.tickets += 1
				outputMessage(usr,"<font color=green><b>You got 1 Ticket!</b></font color>","gametext")


		GiftScroll
			name = "Gift Scroll"
			icon = 'ticket.dmi';icon_state="scroll"
			Wear()
				if(worn) return
				dontKeep = 1
				if(prob(30))
					usr.statpoints += 25000
					outputMessage(usr,"You got 25,000 stat points","gametext")
					return
				if(prob(30))
					usr.exp += 250000
					outputMessage(usr,"You have gained 250,000 Exp.","gametext")
					return
				if(prob(1))
					usr.Souls += 1
					outputMessage(usr,"You have gained 1 Soul","gametext")
				if(prob(1))
					usr.Cor += 20000000
					outputMessage(usr,"you have gained 20mil Exp","gametext")
					return
				if(prob(1))
					usr.verbs += /mob/techniques/verb/subTeleport
					outputMessage(usr,"You have learned to teleport to a new realm","gametext")
					return
				if(prob(10))
					usr.soulpower += 200
					outputMessage(usr,"You have gaind 200 levels","gametext")
					return
				if(prob(100))
					usr.exp += 20000
					usr.Cor += 500000
					usr.statpoints += 20000
					outputMessage(usr,"You have gained 20,000 exp, 500,000 Cor & 20,000 stat points","gametext")
					return




		SHP
			name = "Small Healing Potion"
			icon = 'saopotions.dmi';icon_state="Health"
			Wear()
				if(usr.potioncooldown == 1) return
				if(worn) return
				if(usr.health >= usr.mhealth -50000)
					return
				else
					dontKeep = 1
					usr.health += 49999
					usr.potioncooldown = 1
					spawn(200)
						outputMessage(usr,"You can use a Potin again.","gametext")
						usr.potioncooldown = 0



































