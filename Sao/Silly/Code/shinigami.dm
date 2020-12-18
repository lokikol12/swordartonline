/obj/rukia
	plane=106
	bankaiClothes{icon='rukiabankaiclothes.dmi';layer=1}
	bankaiSword{icon='rukiabankai.dmi';layer=2}

mob/proc/getSquad()
	squad = pick(squadsList)
	client.addDialogue("Soul Society","You have joined squad [squad]!")

mob/proc/becomeShinigami(sub)
	if(!sub)
		outputMessage(world,"<b><font color = aqua>Race Info: [src] is now a Shinigami!","gametext")
		client.addDialogue("Soul Society","Congratulations! You are now a Shinigami!")
		race = "Shinigami"
		getSquad()
	else
		outputMessage(world,"<b><font color = aqua>Race Info: [src] is now a Substitute Shinigami!","gametext")
		client.addDialogue("Soul Society","Congratulations! You are now officially a substitute Shinigami!")
		race = "SubShinigami"

	var/obj/C = new/obj/equipment/unique/shinigamisuit
	client.addToInventory(C)
	var/obj/B = new/obj/equipment/unique/sword
	client.addToInventory(B)
	status = "Member"
	client.equipment["Zanpakuto"][1].Wear()
	client.equipment["Shinigami Suit"][1].Wear()
	skill()

mob/proc/getShikai(cheat)
	/*
	if(!client.equipment["Zanpakuto"])
		var/obj/B = new/obj/equipment/unique/sword
		client.addToInventory(B)
	*/
	if(cheat)
		stype = cheat
	else
		var/random = pick(zanList)
		stype = random
	switch(stype)
		if("Ichigo")
			if(client.wearing["Zanpakuto"])
				client.wearing["Zanpakuto"] = 0
				overlays -= client.equipment["Zanpakuto"][1]
				//world << "was wearing"
			client.removeFromInventory(client.equipment["Zanpakuto"][1])
			var/obj/ichiSword = new/obj/equipment/unique/sword
			ichiSword.icon = zanInformation["Ichigo"]["shikai"]["icon"]
			client.addToInventory(ichiSword)
			client.equipment["Zanpakuto"][1].Wear()


	skill()


var/list/squadsList = list("One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen")

var/list/zanList = list(
"Zaraki","Kaien","Ikkaku","Ichigo","Hitsugaya","Hinamori","Renji",
"Hitsugaya","Byakuya","Mayuri","Kira","Yumichika","Rukia","Yamamoto",
"Zaraki","Urahara","Isshin","Soifon","Kensei","Rukia")


var/list/zanInformation = list(
	"Ichigo" = list(
		"shikai"=list(
			"icon"='ichigoshikai.dmi'),
		"bankai"=list(
			"icon"='ichigobankai.dmi',
			"suit"='ichigobankaiclothes.dmi',
			"statMods"=list("str"=6.5,"rei"=6.5),
			"passives"=list("specialAttack","speed"=0))),


	"HellRelease" = list(
		"shikai"=list(
			"statMods"=list("str"=4.5,"def"=4.5,"rei"=4.5, "res"=4.5),
			"overlays"=/obj/tichibhell,
			"skills"=list(/mob/techniques/verb/GetsugaTenshou)),
		"bankai"=list(
			"statMods"=list("str"=9.5,"def"=9.5,"rei"=9.5, "res"=9.5),
			"overlays"=list(/obj/tichibhell, 'hell10.dmi', 'hell11.dmi'),
			"skills"=list(/mob/techniques/verb/GoldenGetsugaTenshou),
			"passives"=list("speed"=1))),

	"TrueIchigo" = list(
		"shikai"=list(
			"statMods"=list("str"=2.5,"def"=2.2,"rei"=2.2),
			"overlays"=/obj/tichi,
			"skills"=list(/mob/techniques/verb/Engetsu,/mob/techniques/verb/GetsugaTenshou)),
		"bankai"=list(
			"statMods"=list("str"=7.2,"def"=6.2,"rei"=5.2),
			"overlays"=/obj/tichib,
			"skills"=list(/mob/techniques/verb/BlackGetsugaTenshou),
			"passives"=list("speed"=0))),

	"Yamamoto" = list(
		"shikai"=list(
			"icon"='yamamotoshikai.dmi',
			"statMods"=list("str"=2.5,"rei"=5),
			"skills"=list(/mob/techniques/verb/SpiritSlash,/mob/yamamoto/verb/JokakuEnjo,/mob/yamamoto/verb/EnnetsuJigoku,/mob/yamamoto/verb/Taimatsu)),
		"bankai"=list(
			"icon"='yamamotobankai.dmi',
			"statMods"=list("str"=5,"rei"=8),
			"underlays"=/obj/YamaBankaiAura,
			"skills"=list(/mob/techniques/verb/SpiritSlash,/mob/yamamoto/verb/TenchiKaijin,/mob/techniques/verb/yamaaoe))),

	"Kira" = list(
		"shikai"=list(
			"icon"='kirashikaiun.dmi',
			"statMods"=list("str"=4.3,"def"=4.8,"res"=4.8)),
		"bankai"=list(
			"statMods"=list("str"=7,"res"=8,"def"=7))),

	"Kensei" = list(
		"shikai"=list(
			"icon"='kensei.dmi',
			"statMods"=list("str"=2.7),
			"skills"=list(/mob/techniques/verb/AirShot,/mob/techniques/verb/AirSlash)),
		"bankai"=list(
			"icon"='kenseibankai.dmi',
			"statMods"=list("str"=6.25))),

	"Ichimaru"= list(
		"shikai"=list(
			"statMods"=list("str"=4.5))),

	"Yumichika" = list(
		"shikai"=list(
			"icon"='yumichikashikai.dmi',
			"statMods"=list("str"=2,"rei"=1.5),
			"skills"=list(/mob/techniques/verb/SpiritSlash,/mob/techniques/verb/Cyclone_Slash)),
		"bankai"=list(
			"statMods"=list("rei"=5.7),
			"skills"=list(/mob/techniques/verb/SpiritSlash))),
	"Kaien" = list(
		"shikai"=list(
			"icon"='Kaien.dmi',
			"statMods"=list("rei"=3.5),
			"skills"=list(/mob/techniques/verb/Tidalwave,/mob/techniques/verb/Waterball)),
		"bankai"=list(
			"statMods"=list("rei"=7.7),
			"overlays"=(/obj/kaienbankai),
			"skills"=list(/mob/techniques/verb/SpiritSlash))),
	"Hinamori" = list(
		"shikai"=list(
			"icon"='hinamorishikai.dmi',
			"statMods"=list("rei"=4.6),
			"skills"=list(/mob/techniques/verb/Power_Burst)),
		"bankai"=list(
			"icon"='hinamorishikai.dmi',
			"statMods"=list("rei"=6.2,"def"=3),
			"skills"=list(/mob/techniques/verb/Blast,/mob/techniques/verb/SpiritSlash))),

	"Urahara" = list(
		"shikai"=list(
			"icon"='Urahara2shikai.dmi',
			"statMods"=list("def"=3,"rei"=2.5),
			"skills"=list(/mob/techniques/verb/Nake,/mob/techniques/verb/Nake2,/mob/techniques/verb/BloodMistShield)),
		"bankai"=list(
			"icon"='Uraharashikai.dmi',
			"statMods"=list("str"=4,"def"=4,"rei"=6),
			"skills"=list(/mob/techniques/verb/Shibari))),

	"Rukia" = list(
		"shikai"=list(
			"icon"='rukiashikai.dmi',
			"statMods"=list("rei"=3.5),
			"skills"=list(/mob/techniques/verb/Hakuren)),
		"bankai"=list(
		//"icon"='rukiabankai.dmi',
		"statMods"=list("str"=3.5,"rei"=6.5),
		"overlays"=list(/obj/rukia/bankaiClothes, (/obj/rukia/bankaiSword)),
		"skills"=list(/mob/techniques/verb/Hakuren,/mob/techniques/verb/SpiritSlash,/mob/techniques/verb/SubZero))),

	"Unohona" = list(
		"shikai"=list(
			"statMods"=list("def"=5.5,"res"=7),
			"skills"=list(/mob/techniques/verb/heal,/mob/techniques/verb/SpiritSlash),
		"bankai"=list(
			"statMods"=list("rei"=7,"def"=5.5,"res"=7)),
			"overlays"=/obj/una,
			"skills"=list(/mob/techniques/verb/SpiritSlash),
			"passives"=list("speed"=1))),




	"Byakuya"= list(
		"shikai"=list(
			"icon"='byakuyashikaisword.dmi',
			"obj"=list()),
		"bankai"=list(
			"icon"='byakuyashikaisword.dmi')),


	"Renji" = list(
		"shikai"=list(
			"icon"='renjishikai.dmi',
			"statMods"=list("str"=4.3,"def"=2.2,"res"=2.2),
			"passives"=list("specialAttack")),
		"bankai"=list(
			"icon"='renjishikai.dmi',
			"passives"=list("specialAttack"),
			"statMods"=list("str"=8.3,"def"=8,"res"=2))),


	"Ikkaku" = list(
		"shikai"=list(
			"icon"='ikkakushikai.dmi',
			"statMods"=list(4.5),
			"passives"=list("specialAttack")),
		"bankai"=list(
			"statMods"=list("str"=9.5,"def"=7),
			"overlays"=list(/obj/ikkaku1,/obj/ikkaku2,/obj/ikkaku3,/obj/ikkaku4,/obj/ikkaku5,/obj/ikkaku6,/obj/ikkaku7,/obj/ikkaku8,/obj/ikkaku9),
			"passives"=list("speed"=2))),

	"Soifon" = list(
		"shikai"=list(
			"icon"='soifon.dmi',
			"statMods"=list("str"=6),
			"skills"=list(/mob/techniques/verb/HellButterfly)),
		"bankai"=list(
			"icon"='soifon2.dmi',
			"statMods"=list("str"=8.5,"rei"=3),
			"skills"=list(/mob/techniques/verb/Jakuho))),

	"Zaraki" = list(
		"shikai"=list(
			"statMods"=list("str"=3.5,"def"=3.2,"rei"=3.5),
			"overlays"=/obj/zaksword2,
			"underlays"='zarakiaura2.dmi',
			"skills"=/mob/techniques/verb/CircleSlash,
			"passives"=list("speed"=1)),
		"bankai"=list(
			"statMods"=list("str"=10,"def"=6),
			"overlays"=/obj/zaksword,
			"underlays"=/obj/ZarakiBankaiAura,
			"skills"=/mob/techniques/verb/Ryodan,
			"passives"=list("speed"=1))),

	"Mayuri" = list(
		"shikai"=list(
			"icon"='mayurishikai.dmi',
			"statMods"=list("rei"=6.5)),
		"bankai"=list(
			"statMods"=list("def"=8.5,"rei"=8),
			"passives"=list("speed"=0),
			"overlays"=list(/obj/mayuri1,/obj/mayuri2,/obj/mayuri3,/obj/mayuri4,/obj/mayuri5,/obj/mayuri6))),

	"Hitsugaya" = list(
		"shikai"=list(
			"statMods"=list("rei"=3.4),
			"skills"=list(/mob/techniques/verb/ShootDragon,/mob/techniques/verb/CresentBlade)),
		"bankai"=list(
			"statMods"=list("str"=4,"rei"=6),
			"underlays"=list(/obj/hitsu1,/obj/hitsu2),
			"overlays"=list('hitsugayabankai.dmi'),
			"skills"=list(/mob/techniques/verb/ShootDragon,/mob/techniques/verb/CresentBlade,/mob/techniques/verb/IceBlast,/mob/techniques/verb/SubZero,/mob/techniques/verb/SpiritSlash))),

	"Isshin" = list(
		"shikai"=list(
			"icon"='isshin.dmi',
			"statMods"=list("str"=2.5,"def"=2,"rei"=2.5),
			"skills"=list(/mob/techniques/verb/Engetsu)),
		"bankai"=list(
			"icon"='isshin2.dmi',
			"statMods"=list("str"=5,"def"=5,"rei"=5),
			"skills"=list(/mob/techniques/verb/Kuroi_Engetsu),
			"passives"=list("specialAttack"))),

	"far" = list(
		"shikai"=list(
			"icon"='far.dmi',
			"statMods"=list("str"=3,"def"=3))),

	"Niami" = list(
		"shikai"=list(
			"statMods"=list("str"=8,"rei"=8),
			"overlays" = list(/obj/hwings11,/obj/hwings21,/obj/hwings31,/obj/hwings41,/obj/hwings51,/obj/hwings61,/obj/hwings71,/obj/hwings81,/obj/hwings91,/obj/hwings101,/obj/hwings111,/obj/hwings121,/obj/hwings131),"underlays"='Niami2.dmi')),)



mob/proc/handleZanIcon(type,n)

	if(!type ||!n || !client.equipment["Zanpakuto"])return
	overlays -= client.equipment["Zanpakuto"][1]
	switch(n)
		if(1)

			if(type == "bankai" && stype == "Ichigo")

				if(client.wearing["Shinigami Suit"])
					client.equipment["Shinigami Suit"][1].Wear()
				client.equipment["Shinigami Suit"][1].icon = zanInformation[stype][type]["suit"]
				client.equipment["Shinigami Suit"][1].Wear()
				client.equipment["Shinigami Suit"][1].canUnequip = 0
				client.updateItemAppearance(client.equipment["Shinigami Suit"][1])

			if("underlays" in zanInformation[stype][type]) underlays += zanInformation[stype][type]["underlays"]

			if("overlays" in zanInformation[stype][type])
				overlays += zanInformation[stype][type]["overlays"]
			else
				if(!("icon" in zanInformation[stype][type]))
					client.equipment["Zanpakuto"][1].icon = initial(client.equipment["Zanpakuto"][1].icon)
				else client.equipment["Zanpakuto"][1].icon = zanInformation[stype][type]["icon"]
				overlays += client.equipment["Zanpakuto"][1]

		if(-1)
			if(type == "bankai" && stype == "Ichigo")
				client.equipment["Shinigami Suit"][1].canUnequip = 1
				if(client.wearing["Shinigami Suit"])
					client.equipment["Shinigami Suit"][1].Wear()
					client.equipment["Shinigami Suit"][1].icon = initial(client.equipment["Shinigami Suit"][1].icon)
					client.equipment["Shinigami Suit"][1].Wear()
					client.updateItemAppearance(client.equipment["Shinigami Suit"][1])


			if("underlays" in zanInformation[stype][type]) underlays -= zanInformation[stype][type]["underlays"]

			if("overlays" in zanInformation[stype][type])
				overlays -= zanInformation[stype][type]["overlays"]
				overlays += client.equipment["Zanpakuto"][1]
			else
				if(stype == "Ichigo") client.equipment["Zanpakuto"][1].icon = zanInformation["Ichigo"]["shikai"]["icon"]
				else client.equipment["Zanpakuto"][1].icon = initial(client.equipment["Zanpakuto"][1].icon)
				overlays += client.equipment["Zanpakuto"][1]

	//if(!zanInformation[stype]["overlays"]) overlays += client.equipment["Zanpakuto"][1]
	client.updateItemAppearance(client.equipment["Zanpakuto"][1])




	//usr <<"after mod: str-[strmod] rei-[reimod]"

mob/proc/canRelease()
	if(safe)
		outputMessage(usr,"<b>You are in a safe zone!</b>","gametext")
		return 0
	if(frozen) return 0
	if(!swordon)
		swordon = 1
	if(reiryoku <= 0)
		outputMessage(usr,"<b>Your reiatsu is too low!","gametext")
		return 0
	return 1

mob/proc/releaseZan(type,t)
	if(!stype)
		client.addDialogue("Bug.","This is a bug. Report it. It has been logged, though.")
		world.log << "[src] doesn't have a shikai type."
		return
	if(!type)return
	if(type == "removeShikai")
		if(!( "icon" in zanInformation[stype]["bankai"]) && !("overlays" in zanInformation[stype]["bankai"]))
			return
		handleZanIcon("shikai",-1)
		return
	if(!zanInformation[stype][type])
		world.log << "No /list/zanInformation on type: [stype], release: [type]"
		return

	switch(t)
		if(1)
			if(("statMods" in zanInformation[stype][type])) handleStatMods(zanInformation[stype][type]["statMods"], 1)
			if("skills" in zanInformation[stype][type])
				if(type == "shikai" && "skills" in zanInformation[stype]["shikai"])
					verbs += zanInformation[stype]["shikai"]["skills"]
				if(type == "bankai")
					if("skills" in zanInformation[stype]["shikai"]) verbs += zanInformation[stype]["shikai"]["skills"]
					verbs += zanInformation[stype]["bankai"]["skills"]
		if(-1)
			if(("statMods" in zanInformation[stype][type]) && zanInformation[stype][type]["statMods"].len>=1) handleStatMods(zanInformation[stype][type]["statMods"], -1)
			if("skills" in zanInformation[stype][type])
				if(type == "shikai")
					verbs -= zanInformation[stype]["shikai"]["skills"]
					//handleReleasePassives("shikai",-1)
				if(type == "bankai")
					verbs -= zanInformation[stype]["shikai"]["skills"]
					handleReleasePassives("shikai",-1)
					verbs -= zanInformation[stype]["bankai"]["skills"]
	handleZanIcon(type,t)


mob/proc/unreleaseShikai()
	releaseZan("shikai",-1)
	handleReleasePassives("shikai",-1)
	strmod = src.defaultstrmod
	defmod = src.defaultdefmod
	reimod = src.defaultreimod
	resmod = src.defaultresmod
	shikai = 1
	inshikai = 0
	renjishikai = 0
	ikkakushikai = 0
	rundelay = 2
	for(var/obj/O in petals)
		del(O)
	controlbug = 0
	if(race =="Legendary Vaizard")
		icon = 'vastoichgo2.dmi'


mob/var/tmp/list/bankaiOverlays = list(/obj/bankai1,/obj/bankai2,/obj/bankai3,/obj/bankai4,/obj/bankai5,/obj/bankai6)
mob/var/tmp/list/FinalbankaiOverlays = list(/obj/fbaura)


mob/proc/handleReleasePassives(state,num)
	if(!num || !state)return
	if(!("passives" in zanInformation[stype][state]))return
	var/passive = zanInformation[stype][state]["passives"]
	switch(num)

		if(1)
			if("specialAttack" in passive)
				verbs += /mob/techniques/verb/SpecialAttack
				verbs -= /mob/verb/Attack
				winset(src, "Attack", "parent=macro;name=A;command=SpecialAttack")
			if("speed" in passive)
				rundelay = passive["speed"]

			if(state == "bankai" && "passives" in zanInformation[stype]["shikai"])
				if("specialAttack" in zanInformation[stype]["shikai"]["passives"])
					verbs += /mob/techniques/verb/SpecialAttack
					verbs -= /mob/verb/Attack
					winset(src, "Attack", "parent=macro;name=A;command=SpecialAttack")
				if("speed" in zanInformation[stype]["shikai"]["passives"])
					rundelay = zanInformation[stype]["shikai"]["passives"]["speed"]

		if(-1)
			if("specialAttack" in passive)
				verbs -= /mob/techniques/verb/SpecialAttack
				verbs += /mob/verb/Attack
				winset(src, "Attack", "parent=macro;name=A;command=Attack")
			if("speed" in passive)
				rundelay = initial(rundelay)
			if(state == "bankai" && "passives" in zanInformation[stype]["shikai"])
				if("specialAttack" in zanInformation[stype]["shikai"]["passives"])
					verbs -= /mob/techniques/verb/SpecialAttack
					verbs += /mob/verb/Attack
					winset(src, "Attack", "parent=macro;name=A;command=Attack")
				if("speed" in zanInformation[stype]["shikai"]["passives"])
					rundelay = initial(rundelay)

mob/release/verb
	Shikai()
		set category ="Combat"
		/*
		if(!zanInformation[stype])
			outputMessage(usr,"<b>This should never happen. Report it. Shikai bug.</b>","gametext")
			return
		*/
		if(inbankai2 == 1)
			client.addDialogue("Sketch","Why are you trying to use shikai? you're in bankai.")
			return
		if(inbankai == 1)
			client.addDialogue("Sketch","Why are you trying to use shikai? you're in bankai.")
			return
		if(!canRelease())return
		if(stype=="Ichigo")return
		if(!inshikai)
			if(!inbankai)
				inshikai = 1
				view(8) <<"<font color=[namecolor]><b>[usr]</b></font>: <font color=[textcolor]>[swordcall], [swordname]!</font>"
				releaseZan("shikai",1)
				handleReleasePassives("shikai",1)

				switch(stype)
					if("Kira") kirashi = 1
					if("Ichimaru") rundelay = 1
					if("Unohana")
						underlays += /obj/una
					if("Jiroubou")
						controlbug = 1
						reimod += -0.5
						strmod += -0.5
						if(!bankai)
							var/mob/shuriken/Q = new/mob/shuriken(locate(x+2,y,z))
							var/mob/shuriken/W = new/mob/shuriken(locate(x+2,y-2,z))
							var/mob/shuriken/E = new/mob/shuriken(locate(x-2,y,z))
							Q.owner = usr
							W.owner = usr
							E.owner = usr
						else
							var/mob/shuriken/Q = new/mob/shuriken(locate(x+2,y,z))
							var/mob/shuriken/E = new/mob/shuriken(locate(x+2,y+2,z))
							var/mob/shuriken/T = new/mob/shuriken(locate(x+2,y-2,z))
							var/mob/shuriken/S = new/mob/shuriken(locate(x-2,y+2,z))
							var/mob/shuriken/G = new/mob/shuriken(locate(x-2,y-2,z))
							var/mob/shuriken/H = new/mob/shuriken(locate(x-2,y,z))
							Q.owner = usr
							E.owner = usr
							T.owner = usr
							S.owner = usr
							G.owner = usr
							H.owner = usr


					if("Byakuya")

						frozen = 1
						inbankai = 0
						swordoff()
						new/obj/techniques/senbonscatter(loc)
						dir = SOUTH
						if(inshikai)
							reimod += -0.5
							frozen = 0
							controlbug = 1
							var/obj/Q = new/obj/techniques/petals(loc)
							petals += Q
							var/obj/Q1 = new/obj/techniques/petals(loc)
							petals += Q1
							var/obj/Q2 = new/obj/techniques/petals(loc)
							petals += Q2
							for(var/obj/O in petals)
								O.owner = usr

					if("Renji")renjishikai = 1
					if("Ikkaku")ikkakushikai = 1
					if("TrueIchigo") rundelay = 1
					if("Zaraki")
						for(var/mob/M in oview(4))
							step_away(M,usr,8)
					if("far")
						rundelay =1
						overlays -= src.hair


		else
			unreleaseShikai()



mob/proc/goBankai()
	if(inbankai)return

	inbankai = 1
	inshikai = 0
	releaseZan("removeShikai")
	releaseZan("bankai",1)
	overlays += bankaiOverlays
	view(8) <<"<font color=[namecolor]><b>[src]</b></font>: <font color=[textcolor]>Bankai! [swordchant] [swordname]!</font>"
	spawn(15)
		overlays -= bankaiOverlays

	handleReleasePassives("bankai",1)

mob/proc/unreleaseBankai()

	inbankai = 0
	swordon=1
	strmod = defaultstrmod
	defmod = defaultdefmod
	reimod = defaultreimod
	resmod = defaultresmod
	releaseZan("bankai",-1)
	handleReleasePassives("bankai",-1)
	for(var/obj/O in petals)
		del(O)
	for(var/mob/shuriken/Q in oview(10))
		del(Q)

mob/release/verb/Bankai()
	set category ="Combat"
	if(inbankai2 == 1)
		return
	if(!canRelease())return
	if(!inbankai)
		goBankai()
		switch(stype)
			if("Soifon") verbs -= zanInformation[stype]["shikai"]["skills"]

			if("Zaraki")
				for(var/mob/M in oview(6))
					step_away(M,usr,9)
					spawn(1)
					M.moving = 0
					step_away(M,usr,7)
					spawn(1)
					M.moving = 0
					step_away(M,usr,7)

			if("Byakuya")
				controlbug = 1
				verbs += /mob/techniques/verb/Senkei
				reimod += 0.5
				for(var/mob/zabimaru/M in world)
					if(M.owner == usr)
						del M
				for(var/obj/O in petals)
					del(O)
				var/obj/Q = new/obj/techniques/scatterbankai2(locate(x+2,y,z))
				Q.owner = usr
				var/obj/Q1 = new/obj/techniques/scatterbankai2(locate(x+2,y+1,z))
				Q1.owner = usr
				var/obj/Q2 = new/obj/techniques/scatterbankai2(locate(x+2,y+2,z))
				Q2.owner = usr
				var/obj/Q3 = new/obj/techniques/scatterbankai2(locate(x+2,y-1,z))
				Q3.owner = usr
				var/obj/Q4 = new/obj/techniques/scatterbankai(locate(x+2,y-2,z))
				Q4.owner = usr
				var/obj/Q5 = new/obj/techniques/scatterbankai2(locate(x-2,y+2,z))
				Q5.owner = usr
				var/obj/Q6 = new/obj/techniques/scatterbankai(locate(x-2,y+1,z))
				Q6.owner = usr
				var/obj/Q7 = new/obj/techniques/scatterbankai(locate(x,y-2,z))
				Q7.owner = usr
				var/obj/Q8 = new/obj/techniques/scatterbankai(locate(x-2,y-1,z))
				Q8.owner = usr
				var/obj/Q9 = new/obj/techniques/scatterbankai(locate(x-2,y-2,z))
				Q9.owner = usr
				var/obj/Q10 = new/obj/techniques/scatterbankai(locate(x-2,y,z))
				Q10.owner = usr
			if("Renji")
				renjishikai = 1
				canattack = 1
			if("Hitsugaya")
				hitsugayabankai = 1
	else
		unreleaseBankai()

/*
mob/proc/unreleaseBankai()

	inbankai = 0
	swordon=1
	releaseZan("bankai",-1)

	overlays -= 'ichigobankai.dmi'
	overlays += 'sword.dmi'
	overlays -= 'yamamotobankai.dmi'
	overlays -= 'Uraharashikai.dmi'
	verbs -= /mob/techniques/verb/Nake
	verbs -= /mob/techniques/verb/Nake2
	verbs -= /mob/techniques/verb/BloodMistShield
	overlays -= /obj/tichib
	verbs -= /mob/techniques/verb/IceBlast
	verbs -= /mob/techniques/verb/SubZero
	verbs -= /mob/techniques/verb/CresentBlade
	verbs -= /mob/techniques/verb/SpiritSlash
	verbs -= new /mob/techniques/verb/AirSlash()
	verbs -= new /mob/techniques/verb/Blast
	verbs -= /mob/yamamoto/verb/JokakuEnjo
	verbs -= /mob/yamamoto/verb/EnnetsuJigoku
	verbs -= /mob/techniques/verb/IceBlast
	verbs -= /mob/techniques/verb/Ryodan
	verbs -= /mob/yamamoto/verb/Taimatsu
	verbs -= /mob/yamamoto/verb/TenchiKaijin
	verbs -= /mob/techniques/verb/SpiritSlash
	overlays -= /obj/zaksword2
	verbs -= /mob/techniques/verb/Jakuho
	verbs -= /mob/techniques/verb/SubZero
	for(var/obj/O in petals)
		del(O)
	controlbug = 0
	firing = 0
	zabitimes = 0
	hitsugayabankai = 0
	ikkakubankai = 0
	strmod = defaultstrmod
	defmod = defaultdefmod
	reimod = defaultreimod
	resmod = defaultresmod
	overlays -= 'hitsugayabankai.dmi'
	overlays -= /obj/hwings1
	overlays -= /obj/hwings2
	overlays -= /obj/hwings3
	overlays -= /obj/hwings4
	overlays -= /obj/hwings5
	overlays -= /obj/hwings6
	overlays -= /obj/hwings7
	overlays -= /obj/hwings8
	overlays -= /obj/hwings9
	overlays -= /obj/hwings10
	overlays -= /obj/hwings11
	overlays -= /obj/hwings12
	overlays -= /obj/hwings13
	underlays -= 'hitsu2.dmi'
	overlays -= 'hinamorishikai.dmi'
	verbs -= /mob/techniques/verb/CresentBlade
	overlays -= /obj/kaienbankai
	verbs -= /mob/techniques/verb/Tidalwave
	verbs -= /mob/techniques/verb/Waterball
	overlays -= /obj/hitsu1
	overlays -= /obj/hitsu2
	verbs -= /mob/renji/verb/Higa_Zekkou
	strength = mstrength
	reiatsu = mreiatsu
	verbs -= /mob/techniques/verb/Waterball
	verbs -= /mob/techniques/verb/ShootDragon
	verbs -= /mob/techniques/verb/Tidalwave
	verbs -= new /mob/techniques/verb/AirShot()
	verbs -= /mob/techniques/verb/Hakuren
	verbs -= /mob/techniques/verb/Nake
	overlays -= 'kaien.dmi'
	verbs -= new /mob/techniques/verb/Power_Burst()
	overlays -= 'hinamorishikai.dmi'
	renjibankai = 0
	rundelay = 2
	overlays -= /obj/ikkaku1
	overlays -= /obj/una
	overlays -= /obj/ikkaku2
	for(var/obj/O in blades)
		del(O)
	senkei = 0
	overlays -= 'byakuyabankaisword.dmi'
	overlays -= 'byakuyashikaisword.dmi'
	verbs -= /mob/techniques/verb/Senkei
	overlays -= 'soifon2.dmi'
	defence = mdefence
	overlays -= /obj/zaura22
	overlays -= /obj/za
	overlays -= /obj/saura22
	overlays -= /obj/ikkaku3
	overlays -= /obj/ikkaku4
	overlays -= /obj/mayuri1
	overlays -= /obj/mayuri2
	overlays -= /obj/mayuri3
	overlays -= /obj/mayuri4
	overlays -= /obj/mayuri5
	verbs -= /mob/techniques/verb/SubZero
	underlays -= /obj/mayuri6
	overlays -= 'rukiashikai.dmi'
	overlays -= 'renjishikai.dmi'
	overlays -= /obj/zaksword2
	overlays -= 'renjishikai.dmi'
	overlays -= 'ikkakushikai.dmi'
	overlays -= 'ikkakushikai.dmi'
	overlays -= 'kenseibankai.dmi'
	overlays -= 'ikkakushikai.dmi'
	overlays -= 'renjishikai.dmi'
	overlays -= 'far.dmi'
	verbs -= /mob/techniques/verb/SpiritSlash
	verbs -= /mob/techniques/verb/Shibari
	overlays -= 'rukiabankai.dmi'
	overlays -= 'rukiabankaiclothes.dmi'
	overlays -= 'Uraharashikai.dmi'
	overlays -= /obj/ikkaku5
	overlays -= /obj/ikkaku6
	overlays -= /obj/ikkaku7
	walk(usr,0)
	overlays -= /obj/ikkaku8
	overlays -= /obj/ikkaku9
	overlays -= /obj/zaksword
	verbs -= /mob/techniques/verb/Kuroi_Engetsu
	overlays -= 'isshin2.dmi'
	verbs -= /mob/techniques/verb/Engetsu
	underlays = 0
	if(stype =="Ichigo")
		overlays -= 'sword.dmi'
		overlays -= 'ichigobankai.dmi'
		overlays -= 'ichigobankaiclothes.dmi'
		overlays += 'ichigoshikai.dmi'
		inshikai = 1
	for(var/mob/zabimaru/M in world)
		if(M.owner == usr)
			del M
*/



