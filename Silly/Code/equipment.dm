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
				if(usr.swordon8)
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
	unique
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
			statMods = list(1.2)
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
				if(usr.swordon10)
					return
				if(usr.swordon3 == 1)
					usr.swordon3 = 0
					usr.strmod = usr.defaultstrmod

				else usr.swordon3 = 1

				..()

		Excalibur
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Excalibur"
			icon = 'saosword3.dmi'
			statMods = list(4.5)
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
			statMods = list(4.5)
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
				if(usr.swordon8)
					return
				if(usr.swordon10)
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
			statMods = list(2)
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
			statMods = list(3.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
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
			statMods = list(3.5)
			Wear()
				if(usr.swordon2)
					return
				if(usr.swordon3)
					return
				if(usr.swordon)
					return
				if(usr.swordon6)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
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
				if(usr.swordon5)
					return
				if(usr.swordon)
					return
				if(usr.swordon7)
					return
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon6)
					usr.overlays -= /obj/tichibhell
					usr.strmod = usr.strmod - 1.9
					usr.swordon6 = 0
				else
					usr.swordon6 = 1
					overlays += /obj/tichibhell

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
				if(usr.swordon8)
					return
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon7)
					usr.swordon7 = 0
					usr.strmod = usr.defaultstrmod
				else usr.swordon7 = 1
				..()
// staff

		Excalibur
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Excalibur"
			icon = 'saosword3.dmi'
			statMods = list(4.5)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		magicblade
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Magic Blade of Death"
			icon = 'magicblade2.dmi'
			statMods = list(5,2,10,10)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		staffice
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Ice"
			icon = 'saostaff3.dmi'
			statMods = list(0,0,5,2)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		staff
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Truth"
			icon = 'saostaff.dmi'
			statMods = list(0,0,8,1)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		Demonic
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Demonic Gram"
			icon = 'Demonic.dmi'
			statMods = list(14.5)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		magicblade2
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Magic Blade of Witch Craft"
			icon = 'magicblade.dmi'
			statMods = list(5,2,14,14)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		stafftime
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of time"
			icon = 'saostaff2.dmi'
			statMods = list(0,0,10,10)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		stafflight
			layer = WEAPON_LAYER
			item_type = "sword"
			name = "Staff of Light"
			icon = 'saostaff.dmi'
			statMods = list(0,2,7,4)
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
				if(usr.swordon9)
					return
				if(usr.swordon10)
					return
				if(usr.swordon8)
					usr.swordon8 = 0
				else
					usr.swordon8 = 1

				..()
		Eshikai{	layer = WEAPON_LAYER;	name = "Eshikai";		icon = 'Eshikai.dmi'}
		IchigoSword{layer = WEAPON_LAYER;	name = "Tensa Zangetsu";icon = 'ichigobankai.dmi';statMods = list(1.5,0.5,0.5,0.5)}

		//subject to change depending on what people want.
		//this makes it so they can put stuff on top of race clothes.
		shinigamisuit{	layer = CLOTH_I_LAYER	;name = "Shinigami Suit";	icon = 'shinigamicloth.dmi'}
		quincy{			layer = CLOTH_I_LAYER	;name = "Quincy Suit";		icon = 'quincysuit.dmi'}
		arrancarsuit{	layer = CLOTH_I_LAYER	;name = "Arrancar Suit";	icon = 'arrancarsuit.dmi'}
		Armor2{			layer = CLOTH_I_LAYER	;name = "Wandenreich Armor";icon = 'armor2.dmi';statMods = list(0,2.5,0,2.5)}

		captain
			//captain clothes will always be on top of every other clothes.
			layer = CLOTH_III_LAYER
			name = "Captain Suit"
			icon = 'captainsuit.dmi'
			statMods = list(0,1.3,0,0,5000)
			Wear()
				if(usr.status!="Captain")
					outputMessage(usr,"You aren't a captain.","gametext")
					return
				..()

		captainlongsleeve
			layer = CLOTH_III_LAYER
			name = "Captain Suit{Long Sleeve}"
			icon = 'captainsuitlongsleeve.dmi'
			statMods = list(0,1.3,0,0,5000)
			Wear()
				if(usr.status!="Captain")
					outputMessage(usr,"You aren't a captain.","gametext")
					return
				..()
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
		hellarmor		{layer = CLOTH_III_LAYER;name = "Hell Armor";  		icon = 'hellarmor.dmi';statMods = list(1.7,1.7,1.7,1.7)}
		OrgArmor		{layer = CLOTH_III_LAYER;name = "Org Zero Armor";	icon = 'yh.dmi';statMods = list(2,0,2,0)}
		zero			{layer = CLOTH_III_LAYER;name = "Zero";				icon = 'zero.dmi';statMods = list(10,10,10,10,10)}
		Orbs			{layer = CLOTH_III_LAYER;name = "Truth Orbs";		icon = 'seekorbs.dmi';statMods = list(0,0.7,0.7,0)}
		Hougyokurobe	{layer = CLOTH_III_LAYER;name = "Hougyoku robe";	icon = 'houg3.dmi';statMods = list(0,1.5,0,1.5)}
		LoyaltyArmor	{layer = CLOTH_III_LAYER;name = "Loyalty Armor";	icon = 'resarmor.dmi';statMods = list(0,0.7,0,0.7)}
		CoatofMidnight	{layer = CLOTH_III_LAYER;name = "Coat of Midnight";	icon = 'midnightcoat.dmi';statMods = list(5,5,0,5)}
		FireOrbs	{layer = CLOTH_III_LAYER;name = "Fire Orbs";	icon = 'fireorb.dmi';statMods = list(3,3,3,3)}
		FrostOrbs	{layer = CLOTH_III_LAYER;name = "Frost Orbs";	icon = 'iceorb.dmi';statMods = list(2,2,2,2)}
		magearmor2	{layer = CLOTH_III_LAYER;name = "Mage Armor Enchanted";	icon = 'saomagearmor3.dmi';statMods = list(0,3,4,6)}
		magearmor3	{layer = CLOTH_III_LAYER;name = "Mage Armor of Darkness";	icon = 'saomagearmor4.dmi';statMods = list(0,5,4,9)}
		asunaarmor	{layer = CLOTH_III_LAYER;name = "Blood Oath Armor";	icon = 'saoasunaarmor.dmi';statMods = list(8,8,8,8)}
		magearmor1	{layer = CLOTH_III_LAYER;name = "Mage Armor";	icon = 'saomagearmor1.dmi';statMods = list(0,0,4,8)}
		neptune	{layer = CLOTH_III_LAYER;name = "Neptune's Chestplate";	icon = 'neptune.dmi';statMods = list(10,10,10,10)}
		Armor2	{layer = CLOTH_III_LAYER;name = "Kratom Armon";	icon = 'saomagearmor2.dmi';statMods = list(5,5,5,5)}


