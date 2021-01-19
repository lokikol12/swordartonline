//mynameisconnor
mob
	proc
		changeBadge()
			var/f
			switch(src.race)
				if("Soul")
					f = fcopy_rsc(file("icons/badges/blank.dmi"))
				if("Human")
					f = fcopy_rsc(file("icons/badges/blank.dmi"))
				if("Quincy")
					f = fcopy_rsc(file("icons/badges/quincy.dmi"))
				if("Fullbringer")
					f = fcopy_rsc(file("icons/badges/blank.dmi"))
				if("Arrancar")
					switch(src.status)
						if("Zero")
							f = fcopy_rsc(file("icons/badges/Vaizardzero.dmi"))
						if("One")
							f = fcopy_rsc(file("icons/badges/Vaizardone.dmi"))
						if("Two")
							f = fcopy_rsc(file("icons/badges/Vaizardtwo.dmi"))
						if("Three")
							f = fcopy_rsc(file("icons/badges/Vaizardthree.dmi"))
						if("Four")
							f = fcopy_rsc(file("icons/badges/Vaizardfour.dmi"))
						if("Five")
							f = fcopy_rsc(file("icons/badges/Vaizardfive.dmi"))
						if("Six")
							f = fcopy_rsc(file("icons/badges/Vaizardsix.dmi"))
						if("Seven")
							f = fcopy_rsc(file("icons/badges/Vaizardseven.dmi"))
						if("Eight")
							f = fcopy_rsc(file("icons/badges/Vaizardeight.dmi"))
						if("Nine")
							f = fcopy_rsc(file("icons/badges/Vaizardnine.dmi"))
						else
							f = fcopy_rsc(file("icons/badges/badgehollow.dmi"))
				if("Shinigami")
					switch(src.squad)
						if("One")
							f = fcopy_rsc(file("icons/badges/squadone.dmi"))
						if("Two")
							f = fcopy_rsc(file("icons/badges/squadtwo.dmi"))
						if("Three")
							f = fcopy_rsc(file("icons/badges/squadthree.dmi"))
						if("Four")
							f = fcopy_rsc(file("icons/badges/squadfour.dmi"))
						if("Five")
							f = fcopy_rsc(file("icons/badges/squadfive.dmi"))
						if("Six")
							f = fcopy_rsc(file("icons/badges/squadsix.dmi"))
						if("Seven")
							f = fcopy_rsc(file("icons/badges/squadseven.dmi"))
						if("Eight")
							f = fcopy_rsc(file("icons/badges/squadeight.dmi"))
						if("Nine")
							f = fcopy_rsc(file("icons/badges/squadnine.dmi"))
						if("Ten")
							f = fcopy_rsc(file("icons/badges/squadten.dmi"))
						if("Eleven")
							f = fcopy_rsc(file("icons/badges/squadeleven.dmi"))
						if("Twelve")
							f = fcopy_rsc(file("icons/badges/squadtwelve.dmi"))
						if("Thirteen")
							f = fcopy_rsc(file("icons/badges/squadthirteen.dmi"))
				if("Vaizard")
					f = fcopy_rsc(file("icons/badges/vaizard.dmi"))
				if("Hollow")
					f = fcopy_rsc(file("icons/badges/badgehollow.dmi"))
			winset(src,"hud.badge", "image = [f]")

		updateCard()
			if(src.client)
				winset(src,"card.nameoutput", "text = [src.name]") //displays name
				winset(src,"card.raceoutput", "text = [src.race]") //displays race
				winset(src,"card.soulpoweroutput", "text = [src.soulpower]") //displays soul power/soulpower
				winset(src,"card.healthoutput", "text = [src.mhealth]") //displays max health
				winset(src,"card.manaoutput", "text = [src.mmana]") //displays max reiryoku
				winset(src,"card.strengthoutput", "text = [src.mstrength]") //displays max strength/strength
				winset(src,"card.defenceoutput", "text = [src.mdefence]") //displays max defence
				winset(src,"card.reiatsuoutput", "text = [src.mreiatsu]") //displays max reiatsu
				winset(src,"card.resistanceoutput", "text = [src.mresistance]") //displays max resistance
				winset(src,"card.statpointoutput", "text = [src.statpoints]") //displays current statpoints

		addHud()
			winshow(src,"hud",1) //makes the hud popup
			winset(src,"default.map1","focus=true") //sets the active window back to the map
			src.updateHud() //updates it after adding it

		updateHud()
			if(src.client)
				changeBadge()
				winset(src,"hud.healthbar", "value = [round((health/mhealth)*100)]") //updates the bar to show % of health based on mhealth
				winset(src,"hud.manabar", "value = [round((mana/mmana)*100)]") //same for reiryoku
				winset(src,"hud.expbar", "value = [round((exp/mexp)*100)]") //same for experience

//Browser window below

mob/verb/respec()
	set hidden = 1
	if(!usr.spentpoints)
		return
	if(Cor < 10000000000)
		outputMessage(usr,"This costs 10b  Cor")
		return
	usr.Cor -= 10000000000
	usr.mhealth = ((usr.soulpower-1)*10)+25 //sets the max health equal to health you would have with 0 points put into health at your current lvl
	if(usr.health > usr.mhealth)
		usr.health = usr.mhealth
	usr.mmana = usr.soulpower*10 //same for reiryoku
	if(usr.mana > usr.mmana)
		usr.mana = usr.mmana
	usr.mstrength = 1
	usr.strength = 1
	usr.mdefence = 1
	usr.defence = 1
	usr.mreiatsu = 1
	usr.reiatsu = 1
	usr.mresistance = 1
	usr.resistance = 1
	usr.statpoints += usr.spentpoints
	usr.spentpoints = 0
	usr.updateHud()
	usr.updateCard()


mob/proc/increaseStat(stat, a)
	if(!a || !statpoints)
		outputMessage(src,"<b>You don't have any statpoints","gametext")
		return
	if(a <= 0)
		outputMessage(src,"<b>y u do dis.","gametext")
		return
	//only invest as much as you have.
	if(a > statpoints) a = statpoints
	switch(stat)
		if("health")
			mhealth += (a * 5)
			healthRegen()
		if("mana")
			mmana += (a * 1)
		if("strength")
			mstrength += a
			if(strength < mstrength) strength = mstrength
		if("defence")
			mdefence += a
			if(defence < mdefence) defence = mdefence
		if("reiatsu")
			mreiatsu += a
			if(reiatsu < mreiatsu) reiatsu = mreiatsu
		if("resistance")
			mresistance += a
			if(resistance < mresistance) resistance = mresistance
	outputMessage(src,"<b>You spent [a] points on [stat].","gametext")

	statpoints -= a
	spentpoints += a
	updateCard()
	skill()





mob
	verb

/*
I've redone the html. Try to stick to that layout for easier reading and editing.
Best would be to use an online html editor when you edit stuff to see what it looks like.
One of the ones I use for quick stuff is: https://htmlcodeeditor.com/
Just delete the stuff that it generates when you load the page and copy paste whatever you have below this.

Notes:
<h#></h#> where # is a number going from large(1) to small(10) creates a title with some space between that and the text below.
<br /> is the same as <br>, but it's proper.
*/






		Hunts()
			set category = "Other"
			var/helptext = {"
			<html>
				<body style="background-color:black; color:white;">
					<h3><b>Hunts</b></h3>
				Wild Boar: [src.boarkills] <br />
				Forsaken: [src.forsakenkills] <br />
				Lord Larza Kills: [src.larzakills]<br />
				Hades Guard Kills: [src.hadesguardkill]<br />
				Hades Kills: [src.boss4] <br />
				Lord Barra Kills: [boss1]<br />
				Bugsy Kills: [src.boss8]<br />
				</body>
			</html>
			"}
			winshow(usr,"browser",1)
			usr << browse(helptext)

		Rules()
			set category = "Other"
			var/helptext = {"
			<html>
				<body style="background-color:black; color:white;">
					<h3><b>Rules</b></h3>
				1.Trolling is normal but taking it to far can result in having no occ ever again.</br>
				2.No abusing bugs report them and lets enjoy the game.</br>
				3.No Spam killing, Spam killing means more than 5 times within a hour.</br>
				</body>
			</html>
			"}
			winshow(usr,"browser",1)
			usr << browse(helptext)

		CloseBrowser()
			set hidden = 1
			winshow(usr,"browser",0)






//Character card below




		ShowCard()
			set category = "Training"
			set name = "Stats Card"
			updateCard()
			winshow(usr,"card",1)

		CloseCard()
			set hidden = 1
			winshow(usr,"card",0)


		spendStatPoints(stat as text)
			set hidden = 1
			var/n = input("How many points would you like to invest?", "Current statpoints: [statpoints]") as num
			if(!n) return
			increaseStat(stat, n)

		spendAllStatPoints(stat as text)
			set hidden = 1
			increaseStat(stat, statpoints)





//Show damage below

image/damage
	layer = FLOAT_LAYER
	maptext_height = 38 // or higher
	maptext_width = 100
	New()
		pixel_x += rand(-4, 4)
		pixel_y += rand(-4, 4)
		var/tmp/nY =  pixel_y + rand(8, 12)
		animate(src, pixel_y = nY, time=5)
		spawn(5)
			loc = null
			del(src)
proc
	show_damage(atom/atom,damage,colour)
		var/image/damage/dmg = new(loc=atom.loc,icon=null)

		dmg.maptext = "<text align=center valign=top><span style='-dm-text-outline:1px #FFFF00 OUTLINE_SHARP;color:blue;font-size:12pt;font-weight:bold'>[damage]<span>"
		world << dmg


//Show playername below

image/pname
	layer = MOB_LAYER+3
	maptext_y = -30

client
	MouseEntered(mob/M)
		..()
		if(!ismob(M)||!M.client)
			return
		show_pname(src,M)

	MouseExited(mob/M)
		..()
		if(!ismob(M)||!M.client)
			return
		for(var/image/pname/pn in src.images)
			del(pn)

proc
	show_pname(client/O,mob/M)
		var/image/pname/pn = new(loc=M,icon=null)
		pn.maptext = "<center align=top><font color=silver face=Arial size=1><b>[M.name]</b></font></center>"
		O.images += pn

image/levelup
	layer = MOB_LAYER+3
	maptext_height = 12

proc
	show_levelup(mob/M)
		var/image/levelup = new(loc=M,icon=null)
		levelup.maptext = "<center align=top><font color=blue face=Arial size=1><b>Level<br>Up!</b></font></center>"
		world << levelup
		spawn()
			for(var/i in 1 to 8)
				levelup.maptext_height += 2
				sleep(1)
			del(levelup)