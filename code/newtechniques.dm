//////////////////////////////////////
/* New techniques codefile          */
/* No touchytouchy, only lookylooky */
//////////////////////////////////////

//Create vars used by techniques
mob
	var
		tmp/list/cooldowns = list() //holds the current cooldowns(this is emptied on relog, so players can basically skip long cooldowns by relogging)
		tmp/list/targets = list() //a list for possible targets that some skills might use

//Create the necessary procs to check if something is on cooldown
mob
	proc
		onCD(tech="",skip as num)
			if(tech in cooldowns) //If the technique passed in the proc is in the cooldowns list
				if(!skip)
					outputMessage(src,"<font color=white><b>[tech]</font><font color=purple> is on cooldown</b></font>.","gametext")
				return 1 //Return TRUE
			else //If it's not in the cooldowns list
				src.cancelRest()
				return 0 //Return FALSE

		removeCD(tech="",skip as num)
			if(tech in cooldowns) //If the technique passed in the proc is in the cooldowns list
				if(!skip)
					outputMessage(src,"You can use [tech] again","gametext")
				cooldowns -= tech //Remove it

		addCD(tech="")
			if(!cooldowns) //If there's no list called cooldowns
				cooldowns = new/list() //Create it
			if(!(tech in cooldowns)) //If the technique passed in the proc isn't in the cooldowns list
				cooldowns += tech //Add it

		shatterIce() //this proc is for Hitsugaya's and Rukia's skills that "shatter"
			src.overlays += /obj/techniques/icicle
			src.overlays += /obj/techniques/icicle2
			src.frozen = 1
			src.canattack = 0
			sleep(30)
			src.overlays -= /obj/techniques/icicle
			src.overlays -= /obj/techniques/icicle2
			var/obj/S1 = new/obj/techniques/iceshard(src.loc)
			var/obj/S2 = new/obj/techniques/iceshard(src.loc)
			var/obj/S3 = new/obj/techniques/iceshard(src.loc)
			var/obj/S4 = new/obj/techniques/iceshard(src.loc)
			var/obj/S5 = new/obj/techniques/iceshard(src.loc)
			var/obj/S6 = new/obj/techniques/iceshard(src.loc)
			var/obj/S7 = new/obj/techniques/iceshard(src.loc)
			var/obj/S8 = new/obj/techniques/iceshard(src.loc)
			walk(S1,EAST)
			walk(S2,SOUTHEAST)
			walk(S3,SOUTH)
			walk(S4,SOUTHWEST)
			walk(S5,WEST)
			walk(S6,NORTHWEST)
			walk(S7,NORTH)
			walk(S8,NORTHEAST)
			src.frozen = 0
			src.canattack = 1

//-----------Finished list-----------//

//--Kido--//
//All kido verbs and objects done

//--Movement skills--//
//All movement skills and objects done

//--Other skills--//
//Reiatsu Pressure
//Scene of Massacre
		//renamed to Senkei
//Cyclone Slash
//Garganta
//Power Burst
//Hinamori Blast(when using strength in shikai/bankai)
//Haizen
//Ransoutengai
//Gritz
//Sprenger
//Life Shaver
//Fire Ball
//Metal Ball
//Wind Licht Schneide
//Getsuga Tenshou(black)
//Shoot Dragon
//Hakuren
//Cero
//Gran Rey Cero(Cero2)

//------------To do list------------//

//--Other skills--//
//JokakuEnjo
//EnnetsuJigoku
//Taimatsu
//TenchiKaijin
//Santen Kessun
//Souten Kissun
//Koten Zanshun
//Vaizard mask
//Power Blast
//La Muerte
//El Directo

//////////////////////////////////////
/*All verbs for mob/techniques below*/
//////////////////////////////////////

mob/verb/SelfTrain(){
	set category = "Training"
	set name = "Self Train"
	if(onCD("SelfTrain"))
		outputMessage(src,"Dont spam.")
		return //cancel
	if(isTraining) {
		isTraining = FALSE
		src.frozen = 0
		outputMessage(src,"<font color = yellow>You stop training</font>","gametext")
		src.canattack = 1
		src.mana = src.mmana
		if(src.icon == 'base.dmi')
			src.icon_state = ""
		addCD("SelfTrain")
		trainingTime = world.time + 10
		spawn(40)
			removeCD("SelfTrain")
	}
	else {
		isTraining = TRUE
		src.frozen = 1
		trainingTime = world.time + 130000000
		src.canattack = 0
		outputMessage(src,"<font color = yellow>You start training</font>","gametext")
		autoTrain()
		addCD("SelfTrain")
		spawn(140)
			removeCD("SelfTrain")
	}
}



mob
	techniques
		verb
			Reiatsu_Pressure()
				set category = "Combat"
				set name = "Magic Push"
				if(onCD("Magic Push")) //If this skill is found in the cooldowns list
					return //cancel
				else //if reiatsu is more than or equal to 280
					addCD("Magic Push") //add the skill to the cooldowns list
					outputMessage(usr,"<b><font color = silver>[usr]: ...","gametext")
					for(var/mob/M in oview(2)) //for every mob within 8 tiles in any direction
						M.reipressure()
						if(!M.shaking) //if they aren't shaking(already under the influence of reiatsu pressure
							if(M.reiatsu * 3 < usr.reiatsu) //if double M's reiatsu is less than the usr's reiatsu
								Quake_Effect(M,duration=150,strength=2) //start the quak effect proc
								M.shaking = 1 //set their shaking variable to 1
								M.defaultrundelay = M.rundelay //set the defaultrundelay equal to their current rundelay
								M.rundelay += 5 //add rundelay to slow them down
								spawn(100) //wait ten seconds
									if(M) //if M still exists
										M.shaking = 0 //set their shaking to 0
										M.rundelay = M.defaultrundelay //set their rundelay equal to their defaultrundelay to revert the debuff
					spawn(550) //wait 2 minutes
						removeCD("Magic Push") //remove skill from the cooldowns list

// Waterwalk
			Waterwalk()
				set category = "Combat"
				set name = "Fly"
				if(usr.waterwalk == 0)
					if(usr.mana <= usr.mmana *0.50)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.50
					usr.waterwalk = 1
					usr.icon_state = "Waterwalk"
					usr.manaRegen()
					return
				else
					usr.waterwalk = 0

			Waterwalk_off()
				set category = "Combat"
				set name = "Land"
				usr.waterwalk = 0
// Piering shot

// ShootQuincy

			PiercingArrow()
				set category = "Combat"
				set name = "Piercing Arrow"
				if(onCD("PiercingArrow",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.03)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.03
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("PiercingArrow")
				var/obj/K = new/obj/techniques/piercingarrow(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("PiercingArrow",1)
				usr.updateHud()


			Devour()
				set category = "Combat"
				set name = "Devour"
				for(var/mob/M in get_step(src,src.dir)) //for every mob in src's direction between 0 and 1 tiles away(including the src)
					if(M==src) //which is why we have to check if M is equal to the src and we also check if that mob is a fellow enemy
						continue //if so keep skip
					if(M.health > usr.health/4)
						return
					else
						M.Death(usr)
						M.health = 0
						usr.devourgain+=1
						usr.statpoints += 25
						usr.balencerb()

			BankaiControl()
				set category = "Combat"
				set name = ("Teleport to Zanpakuto Realm")
				usr.bankai = 1
				outputMessage(usr,,"<font color=aqua>Zanpakuto Spirit: So you have finally came to try and learn, well shall we begin!</font>","gametext")
				usr.loc = locate(154,122,6)



			FireArrow()
				set category = "Combat"
				set name = "Magic Arrow"
				if(onCD("FireArrow",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.04)
						outputMessage(usr,"Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.04
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("FireArrow")
				var/obj/K = new/obj/techniques/firearrow(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(7)
					removeCD("FireArrow",1)
				usr.updateHud()


			FireArrow2()
				set category = "Combat"
				set name = "Shoot"
				if(onCD("FireArrow",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.02)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.02
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("FireArrow")
				var/obj/K = new/obj/techniques/firearrow2(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(7)
					removeCD("FireArrow",1)
				usr.updateHud()

//hitsu

			SubZero()
				set category = "Combat"
				set name = "SubZero"
				if(onCD("SubZero")) //If this skill is found in the cooldowns list
					return //cancel
				else
					if(usr.mana <= usr.mmana *0.50)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
						usr.mana -= usr.mmana *0.50
						usr.statgainreirb()
						usr.manaRegen()//if reiatsu is more than or equal to 280
					addCD("SubZero") //add the skill to the cooldowns list
					outputMessage(usr,"<b><font color = red>[usr]:Lets try taking things to Zero Degrees!!","gametext")
					for(var/mob/M in oview(9))//for every mob within 4 tiles in any direction
						M.underlays += 'hitsufreeze.dmi'
						M.underlays += 'hitsufreeze2.dmi'
						usr.attstyle = "mana"
						M.frozen = 1
						takeDamage(usr,M)
						spawn(40)
							M.underlays -= 'hitsufreeze.dmi'
							M.underlays -= 'hitsufreeze2.dmi'
							M.rundelay = M.defaultrundelay
							M.frozen = 0
					spawn(390) //30 secs
						removeCD("SubZero") //remove skill from the cooldowns list



			IceBlast()
				set category = "Combat"
				set name = "IceBlast"
				if(onCD("IceBlast",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("IceBlast")
				var/obj/G1 = new/obj/techniques/iceblast
				var/obj/G2 = new/obj/techniques/iceblast
				var/obj/G3 = new/obj/techniques/iceblast
				var/obj/G4 = new/obj/techniques/iceblast
				var/obj/G5 = new/obj/techniques/iceblast
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
						G4.loc = locate(usr.x-2, usr.y, usr.z)
						G5.loc = locate(usr.x+2, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
						G4.loc = locate(usr.x+2, usr.y, usr.z)
						G5.loc = locate(usr.x-2, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
						G4.loc = locate(usr.x, usr.y+2, usr.z)
						G5.loc = locate(usr.x, usr.y-2, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
						G4.loc = locate(usr.x, usr.y-2, usr.z)
						G5.loc = locate(usr.x, usr.y+2, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G4.owner = usr
				G5.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				G4.dir = usr.dir
				G5.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				walk(G4,usr.dir)
				walk(G5,usr.dir)
				spawn(80)
					removeCD("IceBlast")
				usr.updateHud()

			CresentBlade()
				set category = "Combat"
				set name = "Cresent Blade"
				if(onCD("CresentBlade",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("CresentBlade")
				var/obj/K = new/obj/techniques/cresentblade(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(10)
					removeCD("CresentBlade",1)
				usr.updateHud()


//ikka

			Extends()
				set category = "Combat"
				set name = "Extend"
				if(onCD("Extends",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 1)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 1
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Extends")
				var/obj/K = new/obj/techniques/extends(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(10)
					removeCD("Extends",1)
				usr.updateHud()

//starkguns


			FireCero()
				set category = "Combat"
				set name = "Fire Cero"
				if(onCD("FireCero",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.03)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.03
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("FireCero")
				var/obj/K = new/obj/techniques/firecero(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(10)
					removeCD("FireCero",1)
				usr.updateHud()




// lanza

			lanza()
				set category = "Combat"
				set name = "Lanza del Relampago"
				if(onCD("lanza")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.30)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.30
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("lanza")
				outputMessage(usr,"<b>[usr]: Lanza del Relampago!","gametext")
				var/obj/K = new/obj/techniques/lanza(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("lanza")
				usr.updateHud()

// Blast

			Blast()
				set category = "Combat"
				set name = "Blast"
				if(onCD("Blast",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Blast")
				var/obj/K = new/obj/techniques/blast(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(15)
					removeCD("Blast",1)
				usr.updateHud()



// shurkiens

			Shuriken()
				set category = "Combat"
				set name = "Shuriken"
				if(onCD("Shuriken")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Shuriken")
				outputMessage(usr,"<b>[usr]: Shuriken!","gametext")
				var/obj/K = new/obj/techniques/shuriken(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(25)
					removeCD("Shuriken")
				usr.updateHud()


// mustshuiken

			LightingStorm()
				set category = "Combat"
				set name = "Lightning Storm"
				if(onCD("TransmuteLighting")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("TransmuteLighting")
				usr.overlays += 'spark.dmi'
				spawn(5)
					usr.overlays -= 'spark.dmi'
				var/obj/G1 = new/obj/techniques/Tlight
				var/obj/G2 = new/obj/techniques/Tlight
				var/obj/G3 = new/obj/techniques/Tlight
				var/obj/G4 = new/obj/techniques/Tlight
				var/obj/G5 = new/obj/techniques/Tlight
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
						G4.loc = locate(usr.x-2, usr.y, usr.z)
						G5.loc = locate(usr.x+2, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
						G4.loc = locate(usr.x+2, usr.y, usr.z)
						G5.loc = locate(usr.x-2, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
						G4.loc = locate(usr.x, usr.y+2, usr.z)
						G5.loc = locate(usr.x, usr.y-2, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
						G4.loc = locate(usr.x, usr.y-2, usr.z)
						G5.loc = locate(usr.x, usr.y+2, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G4.owner = usr
				G5.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				G4.dir = usr.dir
				G5.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				walk(G4,usr.dir)
				walk(G5,usr.dir)
				spawn(80)
					removeCD("TransmuteLighting")
				usr.updateHud()



// mustshuiken

			Inferno()
				set category = "Combat"
				set name = "Inferno"
				if(onCD("Inferno")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Inferno")
				outputMessage(usr,, "<b>[usr]: Be consumed in my Inferno!","gametext")
				var/obj/G1 = new/obj/techniques/Flame3
				var/obj/G2 = new/obj/techniques/Flame3
				var/obj/G3 = new/obj/techniques/Flame3
				var/obj/G4 = new/obj/techniques/Flame3
				var/obj/G5 = new/obj/techniques/Flame3
				var/obj/G6 = new/obj/techniques/Flame3
				var/obj/G7 = new/obj/techniques/Flame3
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
						G4.loc = locate(usr.x-2, usr.y, usr.z)
						G5.loc = locate(usr.x+2, usr.y, usr.z)
						G6.loc = locate(usr.x+3, usr.y, usr.z)
						G7.loc = locate(usr.x-3, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
						G4.loc = locate(usr.x+2, usr.y, usr.z)
						G5.loc = locate(usr.x-2, usr.y, usr.z)
						G6.loc = locate(usr.x+3, usr.y, usr.z)
						G7.loc = locate(usr.x-3, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
						G4.loc = locate(usr.x, usr.y+2, usr.z)
						G5.loc = locate(usr.x, usr.y-2, usr.z)
						G6.loc = locate(usr.x, usr.y-3, usr.z)
						G7.loc = locate(usr.x, usr.y+3, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
						G4.loc = locate(usr.x, usr.y-2, usr.z)
						G5.loc = locate(usr.x, usr.y+2, usr.z)
						G6.loc = locate(usr.x, usr.y-3, usr.z)
						G7.loc = locate(usr.x, usr.y+3, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G4.owner = usr
				G5.owner = usr
				G6.owner = usr
				G7.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				G4.dir = usr.dir
				G5.dir = usr.dir
				G6.dir = usr.dir
				G7.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				walk(G4,usr.dir)
				walk(G5,usr.dir)
				walk(G6,usr.dir)
				walk(G7,usr.dir)
				spawn(800)
					removeCD("Inferno")
				usr.updateHud()




// mustshuiken

			MutiShuriken()
				set category = "Combat"
				set name = "Multiple Shuriken"
				if(onCD("MutiShuriken")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.40)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.40
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("MutiShuriken")
				outputMessage(usr,"<b>[usr]: Muti Shuriken!","gametext")
				var/obj/G1 = new/obj/techniques/shurikenmuti
				var/obj/G2 = new/obj/techniques/shurikenmuti
				var/obj/G3 = new/obj/techniques/shurikenmuti
				var/obj/G4 = new/obj/techniques/shurikenmuti
				var/obj/G5 = new/obj/techniques/shurikenmuti
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
						G4.loc = locate(usr.x-2, usr.y, usr.z)
						G5.loc = locate(usr.x+2, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
						G4.loc = locate(usr.x+2, usr.y, usr.z)
						G5.loc = locate(usr.x-2, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
						G4.loc = locate(usr.x, usr.y+2, usr.z)
						G5.loc = locate(usr.x, usr.y-2, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
						G4.loc = locate(usr.x, usr.y-2, usr.z)
						G5.loc = locate(usr.x, usr.y+2, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G4.owner = usr
				G5.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				G4.dir = usr.dir
				G5.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				walk(G4,usr.dir)
				walk(G5,usr.dir)
				spawn(80)
					removeCD("MutiShuriken")
				usr.updateHud()



// Ichigo Fb bankai

			Getsuga()
				set category = "Combat"
				set name = "Getsuga"
				if(onCD("Getsuga")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 2000)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 2000
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Getsuga")
				outputMessage(usr,"<b>[usr]: Getsuga Tenshou!","gametext")
				var/obj/G1 = new/obj/techniques/crossthrow
				var/obj/G2 = new/obj/techniques/crossthrow
				var/obj/G3 = new/obj/techniques/crossthrow
				var/obj/G4 = new/obj/techniques/crossthrow
				var/obj/G5 = new/obj/techniques/crossthrow
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
						G4.loc = locate(usr.x-2, usr.y, usr.z)
						G5.loc = locate(usr.x+2, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
						G4.loc = locate(usr.x+2, usr.y, usr.z)
						G5.loc = locate(usr.x-2, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
						G4.loc = locate(usr.x, usr.y+2, usr.z)
						G5.loc = locate(usr.x, usr.y-2, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
						G4.loc = locate(usr.x, usr.y-2, usr.z)
						G5.loc = locate(usr.x, usr.y+2, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G4.owner = usr
				G5.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				G4.dir = usr.dir
				G5.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				walk(G4,usr.dir)
				walk(G5,usr.dir)
				spawn(80)
					removeCD("Getsuga")
				usr.updateHud()

// bala

			firegun()
				set category = "Combat"
				set name = "Fire Gun"
				if(onCD("firegun",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.01)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.01
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("firegun")
				outputMessage(usr,"<b>[usr]: Pow!","gametext")
				var/obj/K = new/obj/techniques/firegun(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(5)
					removeCD("firegun",1)
				usr.updateHud()



// bullet


			Bullet()
				set category = "Combat"
				set name = "Shinkin"
				if(onCD("Bullet")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Bullet")
				var/obj/K = new/obj/techniques/bullet(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Bullet")
				usr.updateHud()


// bala

			Respiraball()
				set category = "Combat"
				set name = "Respiraball"
				if(onCD("Respiraball")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Respiraball")
				outputMessage(usr,"<b>[usr]: Respira Ball!","gametext")
				var/obj/K = new/obj/techniques/Respiraball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(200)
					removeCD("Respiraball")
				usr.updateHud()

// rockblast

			TransmuteBlast()
				set category = "Combat"
				set name = "Transmute Blast"
				if(onCD("TransmuteBlast")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("TransmuteBlast")
				outputMessage(usr,"<b>[usr]: Transmute!","gametext")
				usr.overlays += 'spark.dmi'
				spawn(5)
					usr.overlays -= 'spark.dmi'
				var/obj/K = new/obj/techniques/rockblast(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("TransmuteBlast")
				usr.updateHud()

// bala

			bala()
				set category = "Combat"
				set name = "Bala"
				if(onCD("bala")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("bala")
				var/obj/K = new/obj/techniques/bala(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("bala")
				usr.updateHud()



// kiblast
			kiblast()
				set category = "Combat"
				set name = "Ki Blast"
				if(onCD("kiblast",1)||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.1)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.1
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("kiblast")
				var/obj/K = new/obj/techniques/kiblast(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(5)
					removeCD("kiblast",1)
				usr.updateHud()
//Human below

			KannonBall()
				set category = "Combat"
				set name = ""
				if(onCD("Kannon Ball")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 20
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Kannon Ball")
				outputMessage(usr,"<b>[usr]: Kannon Ball!","gametext")
				var/obj/K = new/obj/techniques/kannonball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("Kannon Ball")
				usr.updateHud()

			GoldenKannonBall()
				set category = "Combat"
				set name = "Golden Kannon Ball"
				if(onCD("Golden Kannon Ball")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Golden Kannon Ball")
				outputMessage(usr,"<b>[usr]: Golden Kannon Ball!","gametext")
				var/obj/K = new/obj/techniques/goldenkannonball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Golden Kannon Ball")
				usr.updateHud()

//Kido below





			Sai(mob/M in oview(1)) //Nothing implemented for mob/enemies yet
				set category = "Combat"
				set name = "Binding Light"
				if(onCD("BindingLight"))
					return
				if(usr.mana <= usr.mmana*0.75)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				if(usr.safe)
					return
				usr.mana -= usr.mmana*0.75
				usr.manaRegen()
				usr.statgainreirb()
				addCD("BindingLight")
				M.frozen = 1
				spawn(20) //wait two seconds
					M.frozen = 0 //unbind M
				spawn(100) //this starts counting at the same time as the spawn above
					removeCD("BindingLight")
				usr.updateHud()

			Byakurai()
				set category = "Combat"
				if(onCD("Byakurai")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.15)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.15
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Byakurai")
				outputMessage(usr,"<b>[usr]: Destruction Spell No.4! Byakurai!","gametext")
				var/obj/K = new/obj/techniques/Byakurai(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Byakurai")
				usr.updateHud()

			Shakkahou()
				set category = "Combat"
				if(onCD("Shakkahou")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Shakkahou")
				outputMessage(usr,"<b>[usr]: Destruction Spell No.31! Shakkahou!","gametext")
				var/obj/K = new/obj/techniques/shakkahou(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Shakkahou")
				usr.updateHud()

			Soukatsui()
				set category = "Combat"
				if(onCD("Soukatsui")||usr.safe) //If Soukatsui has already been used and is on cooldown(message "on cooldown" is implemented in the proc)
					return //cancel
				if(usr.client) //If the src isn't an enemy(npc). This is so that the enemies can also use this skill by bypassing all normal checks
					if(usr.mana < usr.mmana*0.20) //If your reiatsu is less than 10(for testing.. not meant to be this low)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return //cancel
					usr.mana -= usr.mmana*0.20 //Remove the cost of mana
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Soukatsui") //Add Soukatsui to the cooldowns list
				outputMessage(usr,"<b>[usr]: Destruction Spell No.33! Soukatsui!","gametext") //Start your shounen moment
				var/obj/K = new/obj/techniques/soukatsui(usr.loc) //Create a new object inside a variable called K
				K.owner = usr //The owner of K is the usr
				K.dir = usr.dir //The direction of K is the usr's direction
				walk(K,usr.dir) //Make K walk(keeps going) in the direction the usr is facing
				spawn(50) //Has a 5 second cooldown. Can be changed to something with use of a mastery variable
					removeCD("Soukatsui") //After the cooldown remove Soukatsui from the cooldowns list
				usr.updateHud()






/// sao skills

			Rikujokoro(mob/M in oview(3))
				set category = "Combat"
				set name = "Stun"
				if(onCD("Stun")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.50)
						outputMessage(usr,"<b>Your Mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.50
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Stun")
				M.overlays += 'rikujokoro.dmi'
				M.defaultrundelay = M.rundelay
				M.frozen = 1
				M.canattack = 0
				spawn(50)
					M.overlays -= 'rikujokoro.dmi'
					M.frozen = 0
					M.canattack = 1
				spawn(100)
					removeCD("Stun")
				usr.updateHud()

			KuyoShiba(mob/M in oview(3))
				set category = "Combat"
				if(onCD("KuyoShiba")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("KuyoShiba")
				usr.overlays += 'spark.dmi'
				usr.frozen = 1
				spawn(50)
					usr.underlays -= 'spark.dmi'
					usr.frozen = 0
				M.overlays += 'bind1.dmi'
				M.frozen = 1
				spawn(70)
					M.overlays -= 'bind1.dmi'
					M.frozen = 0
				spawn(200)
					removeCD("KuyoShiba")
				usr.updateHud()



			KuyoShiban(mob/M in oview(3))
				set category = "Combat"
				if(onCD("KuyoShiban")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 15000)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 15000
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("KuyoShiban")
				M.underlays += 'bind2.dmi'
				M.frozen = 1
				spawn(30)
					M.underlays -= 'bind2.dmi'
					M.frozen = 0
				spawn(200)
					removeCD("KuyoShiban")
				usr.updateHud()





			Raikoho()
				set category = "Combat"
				if(onCD("Raikoho")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Raikoho")
				outputMessage(usr,"<b>[usr]: Destruction Spell No.63! Raikoho!","gametext")
				var/obj/K = new/obj/techniques/raikoho(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Raikoho")
				usr.updateHud()

			Kurohitsugi(mob/M in oview(5))
				set category = "Combat"
				if(onCD("Kurohitsugi")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.75)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.75
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				usr.attstyle = "mana" //set the style to determine damage
				var/tmp/boost = usr.reimod * 3
				usr.reimod += boost //adds triple your current mana mod to your mana mod
				addCD("Kurohitsugi")
				outputMessage(usr,"<b>[usr]: Destruction spell No.91! Kurohitsugi!","gametext")
				M.overlays += 'kurohitsugi.dmi'
				M.frozen = 1
				takeDamage(src,M)
				usr.reimod -= boost //takes it away
				spawn(20) //48 ticks is the time it takes for the icon to finish
					M.frozen = 0
					M.overlays -= 'kurohitsugi.dmi'
				spawn(500)
					removeCD("Kurohitsugi")
				usr.updateHud()

			trutheye(mob/M in oview(5))
				set category = "Combat"
				set name = "Eye of Truth"
				if(onCD("EyeofTruth")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.75)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.75
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				usr.attstyle = "mana" //set the style to determine damage
				var/tmp/boost = usr.reimod * 7
				usr.reimod += boost //adds triple your current mana mod to your mana mod
				addCD("EyeofTruth")
				outputMessage(usr,"<b>[usr]:Come,Show them the TRUTH!","gametext")
				M.overlays += /obj/eyetruth
				M.frozen = 1
				if(M.race == "Alchemist")
					M.defmod += 9
					M.strmod += 9
					M.resmod += 9
					M.verbs += /mob/techniques/verb/trutheye
					M.reimod += 9 //takes it away
				spawn(10) //48 ticks is the time it takes for the icon to finish
					M.frozen = 0
					M.overlays -= /obj/eyetruth
					takeDamage(src,M)
					usr.reimod -= boost
				spawn(500)
					removeCD("EyeofTruth")
				usr.updateHud()


			Full_Power_Kurohitsugi(mob/M in oview(12))
				set category = "Combat"
				if(onCD("Kurohitsugi")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.40)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.40
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				usr.attstyle = "mana" //set the style to determine damage
				var/tmp/boost = usr.reimod * 7
				usr.reimod += boost //adds triple your current mana mod to your mana mod
				addCD("Kurohitsugi")
				outputMessage(usr,"<b>[usr]: Destruction spell No.91! Kurohitsugi!","gametext")
				M.overlays += /obj/kuro
				M.frozen = 1
				takeDamage(src,M)
				usr.reimod -= boost //takes it away
				spawn(20) //48 ticks is the time it takes for the icon to finish
					M.frozen = 0
					M.overlays -= /obj/kuro
				spawn(500)
					removeCD("Kurohitsugi")
				usr.updateHud()








			Senkaimon()
				set name = "Senkaimon"
				set category = "Combat"
				if(usr.health < usr.mhealth)
					outputMessage(usr,"<b>You must have full health!","gametext")
					return
				if(onCD("Senkaimon"))
					return
				var/obj/K = new/obj/techniques/senkaimon
				K.owner = usr
				K.loc = locate(usr.x-1,usr.y+1,usr.z)
				addCD("Senkaimon")
				spawn(100) //once per minute
					removeCD("Senkaimon")
				usr.updateHud()

			AdminTeleport()
				set name = "Owner Crib"
				set category = "Combat"
				var/obj/K = new/obj/techniques/senkaimon2
				K.owner = usr
				K.loc = locate(usr.x,usr.y+1,usr.z)
				usr.updateHud()

			subTeleport()
				set name = "Rift Teleport"
				set category = "Sub"
				var/obj/K = new/obj/techniques/senkaimon3
				K.owner = usr
				K.loc = locate(usr.x,usr.y+1,usr.z)
				usr.updateHud()

			Fireballs()
				set category = "Combat"
				set name = "FireBall"
				if(onCD("Fireballs")) //If this skill is found in the cooldowns list
					return //cancel
				if(usr.mana < 280) //if reiatsu is less then 280
					outputMessage(usr,"<b>Your mana power is too low!","gametext")
					return
				else //if reiatsu is more than or equal to 280
					usr.statgainrei()
					addCD("Fireballs") //add the skill to the cooldowns list
					outputMessage(usr,"<b><font color = silver>[usr]: Fireball !","gametext")
					for(var/mob/M in oview(2)) //for every mob within 8 tiles in any direction
						var/obj/K = new/obj/techniques/Nake(usr.loc)
						K.owner = usr
						K.dir = usr.dir
						walk(K,usr.dir)
					spawn(120) //wait 2 minutes
						removeCD("Fireballs") //remove skill from the cooldowns list
//Chaos

			DeathDragon()
				set category = "Combat"
				if(onCD("DeathDragon")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("DeathDragon")
				outputMessage(usr,"<b>[usr]: Engulf them in pain!","gametext")
				var/obj/K = new/obj/techniques/blackdrag(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("DeathDragon")
				usr.updateHud()


// Bloodmistshield


// Blue

			Tsaku()
				set category = "Combat"
				if(onCD("Tsaku")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < 100)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 100
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Tsaku")
				outputMessage(usr,"<b>[usr]: Tsaku!!","gametext")
				var/obj/K = new/obj/techniques/Blue(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Tsaku")
				usr.updateHud()



//Byakuya below

			Senkei()
				set category = "Combat"
				if(!usr.senkei)
					if(onCD("Senkei"))
						return
					for(var/obj/O in usr.petals)
						del(O)
					usr.senkei = 1
					usr.controlbug = 0
					usr.verbs += /mob/techniques/verb/SpiritSlash
					usr.overlays -= "sword.dmi"
					usr.overlays -= 'byakuyashikaisword.dmi'
					usr.overlays += 'byakuyabankaisword.dmi'
					outputMessage(usr,"<b>[usr]: Senkei...[usr.swordname] Kageyoshi!","gametext")
					var/obj/A = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-3,usr.z))
					usr.blades += A
					var/obj/A1 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-2,usr.z))
					usr.blades += A1
					var/obj/A2 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-1,usr.z))
					usr.blades += A2
					var/obj/A3 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y,usr.z))
					usr.blades += A3
					var/obj/A4 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+1,usr.z))
					usr.blades += A4
					var/obj/A5 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+2,usr.z))
					usr.blades += A5
					var/obj/A6 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+3,usr.z))
					usr.blades += A6
					var/obj/A7 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-3,usr.z))
					usr.blades += A7
					var/obj/A8 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-2,usr.z))
					usr.blades += A8
					var/obj/A9 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-1,usr.z))
					usr.blades += A9
					var/obj/B = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y,usr.z))
					usr.blades += B
					var/obj/B1 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+1,usr.z))
					usr.blades += B1
					var/obj/B2 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+2,usr.z))
					usr.blades += B2
					var/obj/B3 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+3,usr.z))
					usr.blades += B3
					var/obj/B4 = new/obj/techniques/senkeiblade(locate(usr.x-3,usr.y+7,usr.z))
					usr.blades += B4
					var/obj/B5 = new/obj/techniques/senkeiblade(locate(usr.x-2,usr.y+7,usr.z))
					usr.blades += B5
					var/obj/B6 = new/obj/techniques/senkeiblade(locate(usr.x-1,usr.y+7,usr.z))
					usr.blades += B6
					var/obj/B7 = new/obj/techniques/senkeiblade(locate(usr.x,usr.y+7,usr.z))
					usr.blades += B7
					var/obj/B8 = new/obj/techniques/senkeiblade(locate(usr.x+1,usr.y+7,usr.z))
					usr.blades += B8
					var/obj/B9 = new/obj/techniques/senkeiblade(locate(usr.x+2,usr.y+7,usr.z))
					usr.blades += B9
					var/obj/C = new/obj/techniques/senkeiblade(locate(usr.x+3,usr.y+7,usr.z))
					usr.blades += C
					var/obj/C1 = new/obj/techniques/senkeiblade(locate(usr.x-3,usr.y-7,usr.z))
					usr.blades += C1
					var/obj/C2 = new/obj/techniques/senkeiblade(locate(usr.x-2,usr.y-7,usr.z))
					usr.blades += C2
					var/obj/C3 = new/obj/techniques/senkeiblade(locate(usr.x-1,usr.y-7,usr.z))
					usr.blades += C3
					var/obj/C4 = new/obj/techniques/senkeiblade(locate(usr.x,usr.y-7,usr.z))
					usr.blades += C4
					var/obj/C5 = new/obj/techniques/senkeiblade(locate(usr.x+1,usr.y-7,usr.z))
					usr.blades += C5
					var/obj/C6 = new/obj/techniques/senkeiblade(locate(usr.x+2,usr.y-7,usr.z))
					usr.blades += C6
					var/obj/C7 = new/obj/techniques/senkeiblade(locate(usr.x+3,usr.y-7,usr.z))
					usr.blades += C7
					var/obj/C8 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-4,usr.z))
					usr.blades += C8
					var/obj/C9 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-5,usr.z))
					usr.blades += C9
					var/obj/D1 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-6,usr.z))
					usr.blades += D1
					var/obj/D2 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+6,usr.z))
					usr.blades += D2
					var/obj/D3 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+5,usr.z))
					usr.blades += D3
					var/obj/D4 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+4,usr.z))
					usr.blades += D4
					var/obj/D5 = new/obj/techniques/senkeiblade(locate(usr.x+6,usr.y+7,usr.z))
					usr.blades += D5
					var/obj/D6 = new/obj/techniques/senkeiblade(locate(usr.x+5,usr.y+7,usr.z))
					usr.blades += D6
					var/obj/D7 = new/obj/techniques/senkeiblade(locate(usr.x+4,usr.y+7,usr.z))
					usr.blades += D7
					var/obj/D8 = new/obj/techniques/senkeiblade(locate(usr.x-4,usr.y-7,usr.z))
					usr.blades += D8
					var/obj/D9 = new/obj/techniques/senkeiblade(locate(usr.x-5,usr.y-7,usr.z))
					usr.blades += D9
					var/obj/D = new/obj/techniques/senkeiblade(locate(usr.x-6,usr.y-7,usr.z))
					usr.blades += D
					var/obj/E1 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+4,usr.z))
					usr.blades += E1
					var/obj/E2 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+5,usr.z))
					usr.blades += E2
					var/obj/E3 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+6,usr.z))
					usr.blades += E3
					var/obj/E4 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-6,usr.z))
					usr.blades += E4
					var/obj/E5 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-5,usr.z))
					usr.blades += E5
					var/obj/E6 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-4,usr.z))
					usr.blades += E6
					var/obj/E7 = new/obj/techniques/senkeiblade(locate(usr.x-6,usr.y+7,usr.z))
					usr.blades += E7
					var/obj/E8 = new/obj/techniques/senkeiblade(locate(usr.x-5,usr.y+7,usr.z))
					usr.blades += E8
					var/obj/E9 = new/obj/techniques/senkeiblade(locate(usr.x-4,usr.y+7,usr.z))
					usr.blades += E9
					var/obj/E = new/obj/techniques/senkeiblade(locate(usr.x+4,usr.y-7,usr.z))
					usr.blades += E
					var/obj/F = new/obj/techniques/senkeiblade(locate(usr.x+5,usr.y-7,usr.z))
					usr.blades += F
					var/obj/F1 = new/obj/techniques/senkeiblade(locate(usr.x+6,usr.y-7,usr.z))
					usr.blades += F1
					var/obj/F2 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y+7,usr.z))
					usr.blades += F2
					var/obj/F3 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y-7,usr.z))
					usr.blades += F3
					var/obj/F4 = new/obj/techniques/senkeiblade(locate(usr.x-7,usr.y-7,usr.z))
					usr.blades += F4
					var/obj/F5 = new/obj/techniques/senkeiblade(locate(usr.x+7,usr.y+7,usr.z))
					usr.blades += F5
					for(var/obj/O in usr.blades)
						O.owner = usr
					addCD("Senkei")
					spawn(100) //wait 30 seconds
						removeCD("Senkei")
				else
					usr.controlbug = 1
					usr.verbs -= /mob/techniques/verb/SpiritSlash
					usr.senkei = 0
					var/obj/P = new/obj/techniques/petals(locate(usr.x+2,usr.y,usr.z))
					usr.petals += P
					var/obj/P1 = new/obj/techniques/petals(locate(usr.x+2,usr.y+1,usr.z))
					usr.petals += P1
					var/obj/P2 = new/obj/techniques/petals(locate(usr.x+2,usr.y+2,usr.z))
					usr.petals += P2
					var/obj/P3 = new/obj/techniques/petals(locate(usr.x+2,usr.y-1,usr.z))
					usr.petals += P3
					var/obj/P4 = new/obj/techniques/petals(locate(usr.x+2,usr.y-2,usr.z))
					usr.petals += P4
					var/obj/P5 = new/obj/techniques/petals(locate(usr.x-2,usr.y+2,usr.z))
					usr.petals += P5
					var/obj/P6 = new/obj/techniques/petals(locate(usr.x-2,usr.y+1,usr.z))
					usr.petals += P6
					var/obj/P7 = new/obj/techniques/petals(locate(usr.x-2,usr.y-1,usr.z))
					usr.petals += P7
					var/obj/P8 = new/obj/techniques/petals(locate(usr.x-2,usr.y-2,usr.z))
					usr.petals += P8
					var/obj/P9 = new/obj/techniques/petals(locate(usr.x-2,usr.y,usr.z))
					usr.petals += P9
					var/obj/Q = new/obj/techniques/petals(locate(usr.x+2,usr.y-2,usr.z))
					usr.petals += Q
					var/obj/Q1 = new/obj/techniques/petals(locate(usr.x-2,usr.y+2,usr.z))
					usr.petals += Q1
					var/obj/Q2 = new/obj/techniques/petals(locate(usr.x-2,usr.y+1,usr.z))
					usr.petals += Q2
					var/obj/Q3 = new/obj/techniques/petals(locate(usr.x-2,usr.y-1,usr.z))
					usr.petals += Q3
					var/obj/Q4 = new/obj/techniques/petals(locate(usr.x-2,usr.y-2,usr.z))
					usr.petals += Q4
					var/obj/Q5 = new/obj/techniques/petals(locate(usr.x-2,usr.y,usr.z))
					usr.petals += Q5
					for(var/obj/O in usr.petals)
						O.owner = usr
					usr.overlays -= 'byakuyabankaisword.dmi'
					usr.overlays += 'byakuyashikaisword.dmi'
					for(var/obj/O in usr.blades)
						del(O)


//Yumichika below

			Cyclone_Slash()
				set category = "Combat"
				if(usr.safe == 1)
					return
				if(onCD("Cyclone Slash"))
					return
				if(usr.mana <= usr.mmana*0.30)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				var/tmp/leech = 0
				new/obj/techniques/hurricane(locate(usr.x-1,usr.y,usr.z))
				new/obj/techniques/hurricane(locate(usr.x+1,usr.y,usr.z))
				new/obj/techniques/hurricane(locate(usr.x+1,usr.y-1,usr.z))
				new/obj/techniques/hurricane(locate(usr.x-1,usr.y-1,usr.z))
				new/obj/techniques/hurricane(locate(usr.x,usr.y-1,usr.z))
				new/obj/techniques/hurricane(locate(usr.x+1,usr.y+1,usr.z))
				new/obj/techniques/hurricane(locate(usr.x-1,usr.y+1,usr.z))
				new/obj/techniques/hurricane(locate(usr.x,usr.y+1,usr.z))
				addCD("Cyclone Slash")
				for(var/mob/M in oview(1))
					usr.attstyle = "Physical"
					takeDamage(usr,M)
					leech = getDamage(usr,M)
					usr.statgainrei()
					usr.health += leech
					if(usr.health >= usr.mhealth)
						usr.health = usr.mhealth
				spawn(50)
					removeCD("Cyclone Slash")

// posion
			Respira()
				set category = "Combat"
				if(onCD("Respira"))
					return
				usr.statgainreirb()
				var/tmp/leech = 0
				new/obj/techniques/poi(locate(usr.x-1,usr.y,usr.z))
				new/obj/techniques/poi(locate(usr.x+1,usr.y,usr.z))
				new/obj/techniques/poi(locate(usr.x+1,usr.y-1,usr.z))
				new/obj/techniques/poi(locate(usr.x-1,usr.y-1,usr.z))
				new/obj/techniques/poi(locate(usr.x,usr.y-1,usr.z))
				new/obj/techniques/poi(locate(usr.x+1,usr.y+1,usr.z))
				new/obj/techniques/poi(locate(usr.x-1,usr.y+1,usr.z))
				new/obj/techniques/poi(locate(usr.x,usr.y+1,usr.z))
				new/obj/techniques/poi(locate(usr.x-2,usr.y,usr.z))
				new/obj/techniques/poi(locate(usr.x+2,usr.y,usr.z))
				new/obj/techniques/poi(locate(usr.x+2,usr.y-2,usr.z))
				new/obj/techniques/poi(locate(usr.x-2,usr.y-2,usr.z))
				new/obj/techniques/poi(locate(usr.x,usr.y-2,usr.z))
				new/obj/techniques/poi(locate(usr.x+2,usr.y+2,usr.z))
				new/obj/techniques/poi(locate(usr.x-2,usr.y+2,usr.z))
				new/obj/techniques/poi(locate(usr.x,usr.y+2,usr.z))
				addCD("Respira")
				for(var/mob/M in oview(2))
					usr.attstyle = "mana"
					takeDamage(usr,M)
					leech = getDamage(usr,M)
					usr.health += leech
					if(usr.health >= usr.mhealth)
						usr.health = usr.mhealth
				spawn(50)
					removeCD("Respira")



//Kensei

			AirShot()
				set category = "Combat"
				if(onCD("AirShot")||usr.safe)
					return
				if(usr.mana <= usr.mmana*0.20)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("AirShot")
				usr.mana -= usr.mmana*0.20
				usr.manaRegen()
				var/obj/K = new/obj/techniques/airbullets(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(130)
					removeCD("AirShot")


			AirSlash()
				set category = "Combat"
				set name = "Air Slash"
				if(onCD("AirSlash")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("AirSlash")
				var/obj/K = new/obj/techniques/airslash(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(40)
					removeCD("AirSlash")
				usr.updateHud()

// Ichigo Fullbring

			CrossThrow()
				set category = "Combat"
				if(onCD("CrossThrow")||usr.safe)
					return
				if(usr.mana <= usr.mmana*0.10)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("CrossThrow")
				usr.mana -=usr.mmana*0.10
				usr.manaRegen()
				usr.statgainreirb()
				var/obj/K = new/obj/techniques/crossthrow(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("CrossThrow")

			Incinerate(mob/M in oview(5))
				set category = "Combat"
				if(onCD("ReiBomb")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.40)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.40
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				usr.attstyle = "mana" //set the style to determine damage
				var/tmp/boost = usr.reimod * 2
				usr.reimod += boost //adds triple your current mana mod to your mana mod
				addCD("ReiBomb")
				outputMessage(usr,"<b>[usr]: Burn!","gametext")
				M.overlays += 'ichigobomb.dmi'
				M.frozen = 1
				takeDamage(src,M)
				usr.reimod -= boost //takes it away
				spawn(48) //48 ticks is the time it takes for the icon to finish
					M.frozen = 0
					M.overlays -= 'ichigobomb.dmi'
				spawn(30)
					removeCD("ReiBomb")
				usr.updateHud()

//Hinamori below

			Power_Burst()
				set category = "Combat"
				if(onCD("Power Burst")||usr.safe)
					return
				addCD("Power Burst")
				outputMessage(usr,"<b>[usr]: [usr.swordname]! Snap!","gametext")
				var/obj/K = new/obj/techniques/pinkbyaku(usr.loc)
				usr.statgainreirb()
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Power Burst")

// isshin

			Kuroi_Engetsu()
				set name = "Kuro"
				set category = "Combat"
				if(onCD("Kuro")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.statgainreirb()
					usr.manaRegen()
				addCD("Kuro")
				var/obj/G1 = new/obj/techniques/repem
				var/obj/G2 = new/obj/techniques/rper
				var/obj/G3 = new/obj/techniques/rpel
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Kuro")

			Engetsu()
				set name = "Engetsu"
				set category = "Combat"
				if(onCD("Engetsu")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Engetsu")
				var/obj/G1 = new/obj/techniques/getsugablackmiddle
				var/obj/G2 = new/obj/techniques/getsugablackleft
				var/obj/G3 = new/obj/techniques/getsugablackright
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Engetsu")


//nnoslash


			Slash()
				set name = "Wide Slash"
				set category = "Combat"
				if(onCD("Slash",1)||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= 100)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 100
					usr.manaRegen()
				addCD("Slash",1)
				var/obj/G1 = new/obj/techniques/notmiddle
				var/obj/G2 = new/obj/techniques/notright
				var/obj/G3 = new/obj/techniques/notleft
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(5)
					removeCD("Slash",1)
//Quincy triple arrow


			TripleArrow()
				set name = "Triple-Arrow"
				set category = "Combat"
				if(onCD("Triple-Arrow")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.15)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.15
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Triple-Arrow")
				var/obj/G1 = new/obj/techniques/arrowmiddle
				var/obj/G2 = new/obj/techniques/arrowleft
				var/obj/G3 = new/obj/techniques/arrowright
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(30)
					removeCD("Triple-Arrow")


//slash
			WideSlash()
				set name = "WideSlash"
				set category = "Combat"
				if(onCD("Slash",1)||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= 10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 10
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Slash",1)
				var/obj/G1 = new/obj/techniques/slash
				var/obj/G2 = new/obj/techniques/slash
				var/obj/G3 = new/obj/techniques/slash
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(10)
					removeCD("Slash",1)

// alchemist swords



			TransmuteEarth()
				set name = "Transmute Earth"
				set category = "Combat"
				if(onCD("TransmuteTSword")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				addCD("TransmuteTSword")
				outputMessage(usr,"<b>[usr]: Transmute! Earth","gametext")
				usr.overlays += 'spark.dmi'
				spawn(20)
					usr.overlays -= 'spark.dmi'
				var/obj/G1 = new/obj/techniques/tsword
				var/obj/G2 = new/obj/techniques/tsword
				var/obj/G3 = new/obj/techniques/tsword
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("TransmuteTSword")


//  Nake

			Nake2()
				set name = "Nake"
				set category = "Combat"
				if(onCD("Nake")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Nake")
				outputMessage(usr,"<b>[usr]: Nake!","gametext")
				var/obj/G1 = new/obj/techniques/nakemiddle
				var/obj/G2 = new/obj/techniques/nakeleft
				var/obj/G3 = new/obj/techniques/nakeright
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Nake")


//



			BlackGetsugaTenshou()
				set name = "Black Getsuga"
				set category = "Combat"
				if(onCD("Black Getsuga")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.25
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Black Getsuga")
				outputMessage(usr,"<b>[usr]: Getsuga Tenshou!!","gametext")
				var/obj/G1 = new/obj/techniques/getsugablack2middle
				var/obj/G2 = new/obj/techniques/getsugablack2left
				var/obj/G3 = new/obj/techniques/getsugablack2right
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(30)
					removeCD("Black Getsuga")


			RapidKiBlast()
				set name = "Rapid Ki Blast"
				set category = "Combat"
				if(onCD("Rapid Ki Blast")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Rapid Ki Blast")
				outputMessage(usr,"<b>[usr]: Rapid Ki Blast!","gametext")
				var/obj/G1 = new/obj/techniques/kiblast
				var/obj/G2 = new/obj/techniques/kiblast
				var/obj/G3 = new/obj/techniques/kiblast
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(30)
					removeCD("Rapid Ki Blast")




			GoldenGetsugaTenshou()
				set name = "Golden Getsuga Tenshou"
				set category = "Combat"
				if(onCD("Golden Getsuga Tenshou")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana *0.50)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.50
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Golden Getsuga Tenshou")
				outputMessage(usr,"<b>[usr]:Golden Getsuga Tenshou!","gametext")
				var/obj/G1 = new/obj/techniques/goldenmiddle
				var/obj/G2 = new/obj/techniques/goldenleft
				var/obj/G3 = new/obj/techniques/goldenright
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(160)
					removeCD("Golden Getsuga Tenshou")



//Ichigo below


			GetsugaTenshou()
				set name = "Getsuga Tenshou"
				set category = "Combat"
				if(onCD("Getsuga Tenshou")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Getsuga Tenshou")
				outputMessage(usr,"<b>[usr]: Getsuga Tenshou!","gametext")
				var/obj/G1 = new/obj/techniques/getsugablackmiddle
				var/obj/G2 = new/obj/techniques/getsugablackleft
				var/obj/G3 = new/obj/techniques/getsugablackright
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Getsuga Tenshou")

// Kaien

			Tidalwave()
				set name = "Tidal Wave"
				set category = "Combat"
				if(onCD("Tidalwave")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Tidalwave")
				var/obj/G1 = new/obj/techniques/tidalwave
				var/obj/G2 = new/obj/techniques/tidalwave
				var/obj/G3 = new/obj/techniques/tidalwave
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Tidalwave")

// Kaien waterball

			Waterball()
				set category = "Combat"
				set name = "Water Ball"
				if(onCD("Waterball")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.10)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.10
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Waterball")
				outputMessage(usr,"<b>[usr]: Water Ball!","gametext")
				var/obj/K = new/obj/techniques/waterball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("Waterball")

//Hitsugaya below

			ShootDragon()
				set name = "Shoot Dragon"
				set category = "Combat"
				if(onCD("Shoot Dragon")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.35)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.35
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Shoot Dragon")
				var/obj/K = new/obj/techniques/ice(usr.loc)
				K.dir = usr.dir
				K.owner = usr
				walk(K,usr.dir)
				spawn(50)
					removeCD("Shoot Dragon")

// Nake

			Nake()
				set category = "Combat"
				set name = "Hiasobi Benihime Juzutsanagi"
				if(onCD("Hiasobi Benihime Juzutsanagi")||usr.safe)
					return
				if(usr.client)
					if(usr.mana < usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				//All player only code ends here. Below is also used by enemies that use this verb
				addCD("Hiasobi Benihime Juzutsanagi")
				outputMessage(usr,"<b>[usr]: Hiasobi Benihime Juzutsanagi!","gametext")
				var/obj/K = new/obj/techniques/Nake(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(20)
					removeCD("Hiasobi Benihime Juzutsanagi")
				usr.updateHud()

//Rukia below

			Hakuren()
				set name = "Hakuren"
				set category = "Combat"
				if(onCD("Hakuren")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Hakuren")
				var/obj/K = new/obj/techniques/hakuren(usr.loc)
				K.owner = usr
				walk(K,usr.dir)
				spawn(50)
					removeCD("Hakuren")








//Quincy below



			Haizen()
				set category = "Combat"
				if(onCD("Haizen")||usr.safe)
					return
				if(usr.mana < 500)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("Haizen")
				outputMessage(usr,"<b>[usr]: Feel the wrath of battle and accept this sacred chalice - Sacred Bite!","gametext")
				usr.mana -= 500
				usr.manaRegen()
				usr.statgainreirb()
				var/i //declare the variable
				for(i=0,i<=3,i++) //start the loop with i set at 0, while it's less than or equal 3 run the loop and increment i by 1 each loop
					var/obj/K = new/obj/techniques/haizen(usr.loc)
					K.owner = usr
					K.dir = usr.dir
					walk(K,usr.dir)
					sleep(4)
				spawn(60)
					removeCD("Haizen")

			Ransoutengai()
				set category = "Combat"
				if(onCD("Ransoutengai")||usr.safe)
					return
				if(usr.mana < usr.mmana / 1.5)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				if(usr.seeleuse)
					return
				addCD("Ransoutengai")
				usr.defaultrundelay = usr.rundelay //set this variable equal to the current rundelay
				usr.inran = 1  //inran is used to check if it's active to boost arrow damage if true
				usr.underlays += 'quincyfinalmove.dmi'
				usr.rundelay = 1
				usr.reimod += 4
				outputMessage(usr,"<b>[usr]: Ransoutengai!","gametext")
				spawn(1000)
					usr.rundelay = 5 //make them very slow as a drawback
					usr.underlays -= 'quincyfinalmove.dmi'
					usr.reimod = usr.defaultreimod
					usr.mana = 0 //completely deplete mana
					usr.inran = 0 //turn it off
					spawn(600)
						usr.rundelay = usr.defaultrundelay //make their rundelay equal to the default set earlier
						removeCD("Ransoutengai")

			Gritz(mob/M in oview(6))
				set category = "Combat"
				if(onCD("Gritz")||usr.safe)
					return
				if(usr.mana < usr.mmana*0.40)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				if(M.enemy)
					return
				if(usr.seeleuse)
					return
				addCD("Gritz")
				outputMessage(usr,"<b>[usr]: A silver rod strikes the five-fingered stone bed - Quintuple Restraining Frames!","gametext")
				usr.mana -= usr.mmana*0.40
				usr.manaRegen()
				usr.statgainreirb()
				M.overlays += 'silvergritz.dmi'
				M.frozen = 1
				spawn(30 - M.soulpower + usr.soulpower)
					if(M)
						M.overlays -= 'silvergritz.dmi'
						M.frozen = 0
				spawn(550)
					removeCD("Gritz")


			Sprenger()
				set category = "Combat"
				if(onCD("Sprenger")||usr.safe)
					return
				if(usr.mana < usr.mmana / 1.5)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				if(!(usr.bowon))
					outputMessage(usr,"<b>Please put on your bow.","gametext")
					return
				addCD("Sprenger")
				usr.seeleuse = 1
				outputMessage(usr,"<b>[usr]: Seele Schneider! Activate, Sprenger!","gametext")
				usr.reimod += 2.5
				usr.overlays +=/obj/techniques/seele1
				usr.overlays +=/obj/techniques/seele2
				usr.overlays +=/obj/techniques/seele3
				usr.overlays +=/obj/techniques/seele4
				usr.overlays +=/obj/techniques/seele5
				usr.seele = 5
				spawn(150) //if after 30 seconds they still haven't fired their seele shots delete them
					removeCD("Sprenger")
					usr.seeleuse = 0
					usr.seele = 0
					usr.reimod -= 2.5
					usr.overlays -=/obj/techniques/seele1
					usr.overlays -=/obj/techniques/seele2
					usr.overlays -=/obj/techniques/seele3
					usr.overlays -=/obj/techniques/seele4
					usr.overlays -=/obj/techniques/seele5

//Bount below
//Yoshi below

			Life_Shaver()
				set category = "Combat"
				if(onCD("Life Shaver")||usr.safe)
					return
				if(usr.mana <= usr.mmana * 0.25)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("Life Shaver")
				usr.mana -= usr.mmana * 0.25
				usr.manaRegen()
				usr.statgainst()
				var/i
				for(i=0,i<5,i++)
					var/obj/K = new/obj/techniques/yoshisword(usr.loc)
					K.owner = usr
					K.dir = usr.dir
					walk(K,usr.dir)
					sleep(2)
				spawn(90)
					removeCD("Life Shaver")

//Fire below

			Fire_Ball()
				set category = "Combat"
				if(onCD("Fire Ball")||usr.safe)
					return
				if(usr.mana <= 500)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("Fire Ball")
				usr.mana -= 500
				usr.manaRegen()
				usr.statgainreirb()
				var/obj/K = new/obj/techniques/fireball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(30)
					removeCD("Fire Ball")

//Wind below

			WindLichtSchneide()
				set name = "Wind Licht Schneide"
				set category = "Combat"
				if(onCD("Wind Licht Schneide")||usr.safe)
					return
				if(usr.mana <= 500)
					outputMessage(usr,"<b>Your mana is too low!","gametext")
					return
				addCD("Wind Licht Schneide")
				usr.mana -= 500
				usr.manaRegen()
				usr.statgainreirb()
				var/obj/W1 = new/obj/techniques/wlsmiddle
				var/obj/W2 = new/obj/techniques/wlsleft
				var/obj/W3 = new/obj/techniques/wlsright
				switch(usr.dir)
					if(SOUTH)
						W1.loc = usr.loc
						W2.loc = locate(usr.x+1, usr.y, usr.z)
						W3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						W1.loc = usr.loc
						W2.loc = locate(usr.x-1, usr.y, usr.z)
						W3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						W1.loc = usr.loc
						W2.loc = locate(usr.x, usr.y-1, usr.z)
						W3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						W1.loc = usr.loc
						W2.loc = locate(usr.x, usr.y+1, usr.z)
						W3.loc = locate(usr.x, usr.y-1, usr.z)
				W1.owner = usr
				W2.owner = usr
				W3.owner = usr
				W1.dir = usr.dir
				W2.dir = usr.dir
				W3.dir = usr.dir
				walk(W1,usr.dir)
				walk(W2,usr.dir)
				walk(W3,usr.dir)
				spawn(60)
					removeCD("Wind Licht Schneide")

//Metal below

			Metal_Ball()
				set category = "Combat"
				if(onCD("Metal Ball")||usr.safe)
					return
				addCD("Metal Ball")
				usr.statgainreirb()
				outputMessage(usr,"<b>[usr.swordname] is charging up a Metal Ball!","gametext")
				sleep(10)
				var/obj/K = new/obj/techniques/metalball(usr.loc)
				K.owner = usr
				K.dir = usr.dir
				walk(K,usr.dir)
				spawn(50)
					removeCD("Metal Ball")

//Mug
			Mugetsu()
				set name = "Arc Blast"
				set category = "Combat"
				if(onCD("Arc Blast")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana * 0.35)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mana * 0.35
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Arc Blast")
				var/obj/K = new/obj/techniques/Mugetsu(usr.loc)
				K.owner = usr
				walk(K,usr.dir)
				spawn(300)
					removeCD("Arc Blast")

//Hollow below

			Garganta()
				set name = "Garganta"
				set category = "Combat"
				if(usr.health < usr.mhealth)
					outputMessage(usr,"<b>You must have full health!","gametext")
					return
				if(onCD("Garganta"))
					return
				var/obj/K = new/obj/techniques/garganta
				K.owner = usr
				K.loc = locate(usr.x,usr.y+1,usr.z)
				addCD("Garganta")
				spawn(100) //once per minute
					removeCD("Garganta")
				usr.updateHud()

			Metraletta()
				set name = "Metraletta"
				set category = "Combat"
				if(onCD("Metraletta")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.30)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.30
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Metraletta")
				var/obj/A = new /obj/techniques/Metralettaceromiddle/
				var/obj/B = new /obj/techniques/metralettaceroleft/
				var/obj/C = new /obj/techniques/metralettaceroright/
				if(usr.dir==NORTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x-1, usr.y, usr.z)
					C.loc = locate(usr.x+1, usr.y, usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x+1, usr.y, usr.z)
					C.loc = locate(usr.x-1, usr.y, usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y-1, usr.z)
					C.loc = locate(usr.x, usr.y+1, usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y+1, usr.z)
					C.loc = locate(usr.x, usr.y-1, usr.z)
				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				A.owner = usr
				B.owner = usr
				C.owner = usr
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(100)
					removeCD("Metraletta")

			kame()
				set name = "Kamehameha"
				set category = "Combat"
				if(onCD("Kamehameha")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Kamehameha")
				usr.overlays += 'kamee2.dmi'
				usr.frozen = 1
				spawn(20)
					usr.overlays -= 'kamee2.dmi'
					usr.frozen = 0
					var/obj/K = new/obj/techniques/kamefront(usr.loc)
					K.owner = usr
					K.dir = usr.dir
					walk(K,usr.dir)
					spawn(100)
						removeCD("Kamehameha")

			CCero()
				set name = "Divine Cero"
				set category = "Combat"
				if(onCD("CCero")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("CCero")
				var/obj/K1 = new/obj/techniques/bluecero
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(100)
					removeCD("CCero")


//sonfois



			Jakuho()
				set name = "Jakuho"
				set category = "Combat"
				if(onCD("Jakuho")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Jakuho")
				var/obj/K1 = new/obj/techniques/sonfois
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(300)
					removeCD("Jakuho")
			Spear()
				set name = "Throw lance"
				set category = "Combat"
				if(onCD("Spear")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.20
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Spear")
				var/obj/K1 = new/obj/techniques/spear
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(100)
					removeCD("Spear")

//ken skill

			Ryodan()
				set name = "Ryodan"
				set category = "Combat"
				if(onCD("Ryodan")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.20)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.20
					usr.manaRegen()
					usr.statgainst()
				addCD("Ryodan")
				var/obj/K1 = new/obj/techniques/ryodan
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(50)
					removeCD("Ryodan")










			UlqCero()
				set name = "Cero-Oscuras"
				set category = "Combat"
				if(onCD("UlqCero")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.50)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.50
					usr.manaRegen()
					usr.statgainreirb()
				addCD("UlqCero")
				var/obj/K1 = new/obj/techniques/ulqcero
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(200)
					removeCD("UlqCero")
			Cero()
				set name = "Cero"
				set category = "Combat"
				if(onCD("Cero")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana *0.25)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana *0.25
					usr.statgainreirb()
					usr.manaRegen()
				addCD("Cero")
				var/obj/K1 = new/obj/techniques/cero
				if(usr.dir==NORTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==SOUTH)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==WEST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				if(usr.dir==EAST)
					K1.loc = locate(usr.x, usr.y, usr.z)
				K1.owner = usr
				K1.dir = usr.dir
				walk(K1,usr.dir)
				spawn(100)
					removeCD("Cero")
//des2
			Desgarron()
				set name = "Desgarron"
				set category = "Combat"
				if(onCD("Desgarron")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.40)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.40
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Desgarron")
				var/obj/A = new /obj/techniques/desmiddle/
				var/obj/B = new /obj/techniques/desleft/
				var/obj/C = new /obj/techniques/desright/
				if(usr.dir==NORTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x-1, usr.y, usr.z)
					C.loc = locate(usr.x+1, usr.y, usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x+1, usr.y, usr.z)
					C.loc = locate(usr.x-1, usr.y, usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y-1, usr.z)
					C.loc = locate(usr.x, usr.y+1, usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y+1, usr.z)
					C.loc = locate(usr.x, usr.y-1, usr.z)
				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				A.owner = usr
				B.owner = usr
				C.owner = usr
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(100)
					removeCD("Desgarron")



			GranReyCero()
				set name = "Gran Rey Cero"
				set category = "Combat"
				if(onCD("Gran Rey Cero")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= usr.mmana*0.30)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.30
					usr.statgainreirb()
					usr.manaRegen()
				addCD("Gran Rey Cero")
				var/obj/A = new /obj/techniques/granreyceromiddle/
				var/obj/B = new /obj/techniques/granreyceroleft/
				var/obj/C = new /obj/techniques/granreyceroright/
				if(usr.dir==NORTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x-1, usr.y, usr.z)
					C.loc = locate(usr.x+1, usr.y, usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x+1, usr.y, usr.z)
					C.loc = locate(usr.x-1, usr.y, usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y-1, usr.z)
					C.loc = locate(usr.x, usr.y+1, usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y+1, usr.z)
					C.loc = locate(usr.x, usr.y-1, usr.z)
				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				A.owner = usr
				B.owner = usr
				C.owner = usr
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(300)
					removeCD("Gran Rey Cero")
//Shibari


			Shibari()
				set name = "Shibari"
				set category = "Combat"
				if(onCD("Shibari")||usr.safe)
					return
				if(usr.client)
					if(usr.mana <= 40000)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= 40000
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Shibari")
				var/obj/A = new /obj/techniques/shibarimiddle/
				var/obj/B = new /obj/techniques/shibarileft/
				var/obj/C = new /obj/techniques/shibariright/
				if(usr.dir==NORTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x-1, usr.y, usr.z)
					C.loc = locate(usr.x+1, usr.y, usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x+1, usr.y, usr.z)
					C.loc = locate(usr.x-1, usr.y, usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y-1, usr.z)
					C.loc = locate(usr.x, usr.y+1, usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x, usr.y, usr.z)
					B.loc = locate(usr.x, usr.y+1, usr.z)
					C.loc = locate(usr.x, usr.y-1, usr.z)
				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				A.owner = usr
				B.owner = usr
				C.owner = usr
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(100)
					removeCD("Shibari")




// grimm not used
			Desgarron1()
				set name = "Desgarron"
				set category = "Combat"
				if(onCD("Desgarron")||usr.safe)
					return
				if(!usr.enemy||!usr.vailast)
					if(usr.mana <= usr.mmana*0.30)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					usr.mana -= usr.mmana*0.30
					usr.manaRegen()
					usr.statgainreirb()
				addCD("Desgarron")
				var/obj/G1 = new/obj/techniques/Des
				var/obj/G2 = new/obj/techniques/DesL
				var/obj/G3 = new/obj/techniques/DesR
				switch(usr.dir)
					if(SOUTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x+1, usr.y, usr.z)
						G3.loc = locate(usr.x-1, usr.y, usr.z)
					if(NORTH)
						G1.loc = usr.loc
						G2.loc = locate(usr.x-1, usr.y, usr.z)
						G3.loc = locate(usr.x+1, usr.y, usr.z)
					if(WEST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y-1, usr.z)
						G3.loc = locate(usr.x, usr.y+1, usr.z)
					if(EAST)
						G1.loc = usr.loc
						G2.loc = locate(usr.x, usr.y+1, usr.z)
						G3.loc = locate(usr.x, usr.y-1, usr.z)
				G1.owner = usr
				G2.owner = usr
				G3.owner = usr
				G1.dir = usr.dir
				G2.dir = usr.dir
				G3.dir = usr.dir
				walk(G1,usr.dir)
				walk(G2,usr.dir)
				walk(G3,usr.dir)
				spawn(60)
					removeCD("Desgarron")

//Flashstep below

			FlashStep()
				set category = "Combat"
				if(usr.flashstep)
					usr.flashstep = 0
					outputMessage(usr,"<b>You are not using Flash Step anymore.","gametext")
				else
					usr.flashstep = 1
					outputMessage(usr,"<b>You start using Flash Step!","gametext")

			Hirenhyaku()
				set category = "Combat"
				if(usr.flashstep)
					usr.flashstep = 0
					outputMessage(usr,"<b>You are not using Hirenhyaku anymore.","gametext")
				else
					usr.flashstep = 1
					outputMessage(usr,"<b>You start using Hirenhyaku!","gametext")

			Sonido()
				set category = "Combat"
				if(usr.flashstep)
					usr.flashstep = 0
					outputMessage(usr,"<b>You are not using Sonido anymore.","gametext")
				else
					usr.flashstep = 1
					outputMessage(usr,"<b>You start using Sonido!","gametext")



////////////////////////////////////////
/*All objects for obj/techniques below*/
////////////////////////////////////////

obj
	techniques
		var //all objects inherit these variables and their set defaults, unless overridden
			techtype //to determine which stat of the owner to use to calculate damage
			dmgmult = 1 //dmgmult is intended to determine the final damage the technique will do
			lifetime = 10 //Default is 10, which is 10 ticks/1 second. When an object is created it'll be deleted after it's lifetime
			list/trails = list() //create a list that holds all the trails a skill has

		New() //All obj/techniques inherit this New proc
			spawn(lifetime)
				del(src)

		Del() //if there are any trails in the skill's trails list it deletes them when the skill is deleted
			for(var/obj/K in src.trails)
				del(K)
			..()

		Bump(A) //All obj/techniques inherit this Bump proc
			if(ismob(A)) //If the dense atom being hit is a mob
				var/mob/O = src.owner
				var/mob/M = A
				if(M == O||(M.enemy&&O.enemy))
					del(src)
					return
				takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
				del(src)
			if(istype(A,/turf/)) //If the atom being hit is a turf. Only dense objects can be hit, so no need to check if the turf is dense
				del(src)
			if(istype(A,/obj/)) //If the atom being hit is an object
				del(src)

//Human below

		kannonball
			name = "Kannon Ball"
			techtype = "Reiryoku"
			icon = 'kannonball.dmi'
			density = 1
			dmgmult = 0.5
			lifetime = 40

		goldenkannonball
			name = "Golden Kannon Ball"
			techtype = "Reiryoku"
			icon = 'goldenkannonball.dmi'
			density = 1
			dmgmult = 0.8
			lifetime = 40

//Shinigami below
//Kido below

		soukatsui
			name = "Soukatsui" //this is the name that is displayed when it hits something
			icon = 'soukatsui.dmi' //set icon
			techtype = "mana"
			density = 1 //objects are dense by default, but set it anyway
			dmgmult = 1.2 //set the default damage for the object when it bumps into something
			lifetime = 20 //set the default lifetime for the in ticks. Object is deleted the ticks have expired

		Byakurai
			icon = 'byakurai.dmi'
			icon_state = "byakurai"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "mana"
			Move()
				var/obj/K = new/obj/techniques/byaktrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		byaktrail
			icon = 'byakurai.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20


		shakkahou
			name = "Shakkahou"
			techtype = "mana"
			icon = 'shakkahou.dmi'
			density = 1
			dmgmult = 1.15
			lifetime = 20



		raikoho
			name = "Raikoho"
			techtype = "mana"
			icon = 'raikoho.dmi'
			density = 1
			dmgmult = 1.3
			lifetime = 40
			Move()
				var/obj/K = new/obj/techniques/raikohotrail
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		raikohotrail
			icon = 'raikoho.dmi'
			icon_state = "trail"
			lifetime = 5

		senkaimon
			icon = 'senkaimon.dmi'
			lifetime = 80
			density = 0
			New()
				..()
				flick("open",src)
				spawn(11)
					density = 1
			Del()
				density = 0
				flick("shut",src)
				spawn(6)
					..()
			Bumped(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						switch(M.z)
							if(2)
								M.loc = locate(rand(1,100),rand(1,100),4) //to SS
							if(4)
								M.loc = locate(rand(22,78),rand(115,108),2) //to earth
							else
								M.loc = locate(rand(1,100),rand(1,100),4) //to SS
						del(src)
					else
						return
// gin


//Byakuya below

		scatterbankai
			icon = 'byakuyashikai.dmi'
			icon_state = "bankai"
			New()
				flick("bankai",src)
				spawn(9)
					var/mob/O = src.owner
					var/obj/Q = new/obj/techniques/petals(src.loc)
					O.petals += Q
					Q.owner = O
					del(src)

		scatterbankai2
			icon = 'byakuyashikai.dmi'
			icon_state = "bankai"
			New()
				flick("bankai",src)
				spawn(9)
					var/mob/O = src.owner
					var/obj/Q = new/obj/techniques/petals(src.loc)
					O.petals += Q
					Q.owner = O
					var/obj/Q1 = new/obj/techniques/petals(src.loc)
					O.petals += Q1
					Q1.owner = O
					del(src)

		senbonscatter
			icon = 'senbonscatter.dmi'
			layer = MOB_LAYER+4
			lifetime = 25

		petals
			name = "Petals"
			techtype = "mana"
			icon = 'byakuyashikai.dmi'
			layer = MOB_LAYER+5
			lifetime = 1000
			dmgmult = 0.5
			density = 1
			var/tmp/rundelay
			New()
				..()
				switch(rand(1,3))
					if(1)
						icon_state = ""
					if(2)
						icon_state = "1"
					if(3)
						icon_state = "2"

			Bump(A)
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O)
						src.loc = M.loc
						return
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
				if(istype(A,/turf/)) //If the atom being hit is a turf. Only dense objects can be hit, so no need to check if the turf is dense
					return
				if(istype(A,/obj/)) //If the atom being hit is an object
					return

		senkeiblade
			icon = 'byakuyabankai.dmi'
			layer = MOB_LAYER+0
			density = 1
			dmgmult = 1.5
			techtype = "mana"
			lifetime = 1000
			New()
				spawn(lifetime)
					if(src)
						density = 0
						icon_state = "deactivate"
						del(src)



//Yumichika below

		hurricane
			name = "Hurricane"
			icon = 'yumichikamove.dmi'
			lifetime = 20



		poi
			name = "poi"
			icon = 'poison.dmi'
			lifetime = 30
// Piercing Shot

		piercingarrow
			icon = 'quincyarrow.dmi'
			icon_state = "arrow"
			density = 1
			lifetime = 40
			dmgmult = 2.5
			techtype = "mana"



//Hinamori below

		pinkbyaku
			name = "Pink Byakurai"
			icon = 'pinkbyaku.dmi'
			icon_state = ""
			density = 1
			lifetime = 30
			techtype = "mana"
			dmgmult = 1.4
			Move()
				var/obj/K = new/obj/techniques/pinkbyakutrail
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		pinkbyakutrail
			name = "Pink Byakurai trail"
			icon = 'pinkbyaku.dmi'
			icon_state = "trail"
			lifetime = 20

		hina
			icon = 'hinamoriblast.dmi'
			icon_state = ""
			density = 1
			lifetime = 30
			techtype = "mana"
			dmgmult = 1.2

		hina2
			icon = 'hinamoriblast2.dmi'
			icon_state = ""
			density = 1
			lifetime = 30
			techtype = "mana"
			dmgmult = 1.3
//Isshin



		repem
			icon = 'isshin3.dmi'
			icon_state = "rpem"
			density = 1
			lifetime = 30
			dmgmult = 3.5
			techtype = "Mixed"

		rper
			icon = 'isshin3.dmi'
			icon_state = "rper"
			density = 1
			lifetime = 30
			dmgmult = 2.5
			techtype = "Mixed"

		rpel
			icon = 'isshin3.dmi'
			icon_state = "rpel"
			density = 1
			lifetime = 30
			dmgmult = 2.5
			techtype = "Mixed"
//nno

		notmiddle
			icon = 'nntislash.dmi'
			icon_state = "2"
			density = 1
			lifetime = 1
			dmgmult = 1.2
			techtype = "Physical"

		notright
			icon = 'nntislash.dmi'
			icon_state = "1"
			density = 1
			lifetime = 1
			dmgmult = 1.2
			techtype = "Physical"

		notleft
			icon = 'nntislash.dmi'
			icon_state = "3"
			density = 1
			lifetime = 1
			dmgmult = 1.2
			techtype = "Physical"


		goldenmiddle
			icon = 'golden.dmi'
			icon_state = "middle"
			density = 1
			lifetime = 30
			dmgmult = 2.5
			techtype = "Mixed"

		goldenright
			icon = 'golden.dmi'
			icon_state = "right"
			density = 1
			lifetime = 30
			dmgmult = 2.5
			techtype = "Mixed"

		goldenleft
			icon = 'golden.dmi'
			icon_state = "left"
			density = 1
			lifetime = 30
			dmgmult = 2.5
			techtype = "Mixed"




//Ichigo below

		getsugablackmiddle
			icon = 'getsugablack.dmi'
			icon_state = "middle"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Mixed"

		getsugablackright
			icon = 'getsugablack.dmi'
			icon_state = "right"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Mixed"

		getsugablackleft
			icon = 'getsugablack.dmi'
			icon_state = "left"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Mixed"


//


		getsugablack2middle
			icon = 'blackgetsuga.dmi'
			icon_state = "middle"
			density = 1
			lifetime = 30
			dmgmult = 1.8
			techtype = "Mixed"

		getsugablack2right
			icon = 'blackgetsuga.dmi'
			icon_state = "left"
			density = 1
			lifetime = 30
			dmgmult = 1.8
			techtype = "Mixed"

		getsugablack2left
			icon = 'blackgetsuga.dmi'
			icon_state = "right"
			density = 1
			lifetime = 30
			dmgmult = 1.8
			techtype = "Mixed"
//Hitsugaya below

		ice
			icon = 'hitsugayashikai.dmi'
			density = 1
			lifetime = 20
			techtype = "mana"
			dmgmult = 1.5
			Move()
				var/obj/K = new/obj/techniques/icetrail
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						M.shatterIce()
				if(istype(A,/turf/)) //If the atom being hit is a turf. Only dense objects can be hit, so no need to check if the turf is dense
					del(src)
				if(istype(A,/obj/)) //If the atom being hit is an object
					del(src)


		icetrail
			icon = 'hitsugayashikai.dmi'
			icon_state = "trail"
			lifetime = 20
			density = 0

		iceshard
			icon = 'icicle.dmi'
			icon_state = "3"
			density = 1
			lifetime = 20
			layer = MOB_LAYER+1
			Bump() //override Bump() to delete the shard regardless of what it hits
				del(src)



		icicle
			icon = 'icicle.dmi'
			icon_state = "1"
			layer = MOB_LAYER+1



		icicle2
			icon = 'icicle.dmi'
			icon_state = "2"
			pixel_y = 32
			layer = MOB_LAYER+1


		icicletrail
			icon = 'icicle.dmi'
			icon_state = "1"
			layer = MOB_LAYER+1
			lifetime = 20
			New()
				var/obj/K = new/obj/techniques/icicle2
				src.trails += K
		bankaiice
			icon = 'hitsugayabankaimove.dmi'
			icon_state = "1"
			density = 1
			lifetime = 20
			techtype = "mana"
			dmgmult = 1.8
			Move()
				var/obj/K = new/obj/techniques/bankaiicetrail
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						M.shatterIce()
				if(istype(A,/turf/)) //If the atom being hit is a turf. Only dense objects can be hit, so no need to check if the turf is dense
					del(src)
				if(istype(A,/obj/)) //If the atom being hit is an object
					del(src)

		bankaiicetrail
			icon = 'hitsugayabankaimove.dmi'
			icon_state = "2"
			lifetime = 20
			layer = MOB_LAYER+1
			density = 0




		cresentblade
			icon = 'hitsu3.dmi'
			icon_state = "cb"
			density = 1
			lifetime = 3
			dmgmult = 1.9
			techtype = "Physical"
			Move()
				var/obj/K = new/obj/techniques/itrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		itrail
			icon = 'hitsu3.dmi'
			icon_state = "cbt"
			density = 0
			lifetime = 5
//Mug
		Mugetsu
			icon = 'mug5.dmi'
			icon_state = "trailold"
			density = 1
			lifetime = 30
			techtype = "Physical"
			dmgmult = 3.3
			Move()
				var/obj/K = new/obj/techniques/trail3
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)

		trail3
			icon = 'mug5.dmi'
			icon_state = "trailold"
			density = 0
			dmgmult = 0
			lifetime = 30






//blue


		Blue
			icon = 'bluemove.dmi'
			icon_state = "head"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "mana"
			Move()
				var/obj/K = new/obj/techniques/bluetrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		bluetrail
			icon = 'bluemove.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20



//Chaos


		blackdrag
			icon = 'blackdrag.dmi'
			icon_state = "blackdrag"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "mana"
			Move()
				var/obj/K = new/obj/techniques/dragtrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		dragtrail
			icon = 'blackdrag.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20

//Rukia below

		hakuren
			name = "Hakuren"
			density = 1
			lifetime = 30
			techtype = "mana"
			dmgmult = 1.7

			Move()
				var/obj/K = new/obj/techniques/icicletrail
				var/obj/L = new/obj/techniques/icicle2
				src.trails += L
				src.trails += K
				K.loc = src.loc
				L.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						M.shatterIce()
				if(istype(A,/turf/)) //If the atom being hit is a turf. Only dense objects can be hit, so no need to check if the turf is dense
					del(src)
				if(istype(A,/obj/)) //If the atom being hit is an object
					del(src)


//Quincy below

		haizen
			icon = 'silverslash.dmi'
			icon_state = ""
			density = 1
			lifetime = 20
			dmgmult = 2.15
			techtype = "mana"
			Move()
				var/obj/K = new/obj/techniques/haizentrail
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		haizentrail
			icon = 'silverslash.dmi'
			icon_state = "trail"
			lifetime = 10

		seele1
			icon = 'silverseele.dmi'
			pixel_y = 32

		seele2
			icon = 'silverseele.dmi'
			pixel_x =32
			pixel_y = 10

		seele3
			icon = 'silverseele.dmi'
			pixel_x =-32
			pixel_y = 10

		seele4
			icon = 'silverseele.dmi'
			pixel_y =-32
			pixel_x =-16

		seele5
			icon = 'silverseele.dmi'
			pixel_y =-32
			pixel_x =16

		seele
			icon = 'silverseeleshoot.dmi'
			icon_state = ""
			density = 1
			lifetime = 20
			techtype = "Reiryoku"
			dmgmult = 1.2
			Move()
			 var/obj/K = new/obj/techniques/seeletrail(src.loc)
			 src.trails += K
			 K.loc = src.loc
			 K.dir = src.dir
			 ..()

		seeletrail
			icon = 'silverseeleshoot.dmi'
			icon_state = "trail"
			lifetime = 15

//Bount below
//Yoshi below

		yoshisword
			icon = 'bountoyoshisword.dmi'
			icon_state = ""
			density = 1
			lifetime = 20
			dmgmult = 1
			techtype = "Physical"
//Qincy triple arrow

		arrowmiddle
			icon = 'newarrow.dmi'
			icon_state = "newarrow"
			techtype = "Reiryoku"
			dmgmult = 1.2
			density = 1
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/qtrailmiddle(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		arrowleft
			icon = 'newarrow.dmi'
			icon_state = "newarrow"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.4
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/qtrailleft(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		arrowright
			icon = 'newarrow.dmi'
			icon_state = "newarrow"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.2
			lifetime = 40
			Move()
				var/obj/K = new/obj/techniques/qtrailright(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		qtrailmiddle
			icon = 'newarrow.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20

		qtrailleft
			icon = 'newarrow.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20

		qtrailright
			icon = 'newarrow.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20
//Fire below

		bountofiretrail
			icon = 'bountofireman.dmi'
			icon_state = "Trail"
			lifetime = 8

		fireball
			icon = 'bountofireball.dmi'
			icon_state = ""
			density = 1
			lifetime = 20
			dmgmult = 1.9
			techtype = "Reiryoku"


//Kensei


		airslash
			icon = 'kensei2.dmi'
			icon_state = "d"
			density = 1
			lifetime = 30
			dmgmult = 1.6
			techtype = "Physical"


		airbullets
			icon = 'kenseiskills.dmi'
			icon_state = "blast"
			density = 1
			lifetime = 60
			dmgmult = 1.4
			techtype = "Physical"
			Move()
				var/obj/K = new/obj/techniques/kenseitrail(src.loc)
				K.dir = src.dir
				..()

		kenseitrail
			icon = 'kenseiskills.dmi'
			icon_state = "blastback"
			density = 0
			lifetime = 1

	// Kaien skill
		waterball
			icon = 'kaienskills.dmi'
			icon_state = "Water Ball"
			density = 1
			lifetime = 30
			dmgmult = 1.6
			techtype = "Reiryoku"
// ken skill

		ryodan
			icon = 'kenskill.dmi'
			icon_state = "mugetsu"
			density = 1
			techtype = "Physical"
			dmgmult = 1.5
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/ztrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		ztrail
			icon = 'kenskill.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20




//Nake
		Nake
			icon = 'uraskill.dmi'
			icon_state = "hbj"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

//firecero


		firecero
			icon = 'starkcero.dmi'
			icon_state = "3"
			density = 1
			lifetime = 10
			dmgmult = 1.3
			techtype = "Reiryoku"
			Move()
				var/obj/K = new/obj/techniques/starktrail(src.loc)
				K.dir = src.dir
				..()

		starktrail
			icon = 'starkcero.dmi'
			icon_state = "middle"
			density = 0
			lifetime = 5


//ikkaku

		extends
			icon = 'ikka.dmi'
			icon_state = "1"
			density = 1
			lifetime = 4
			dmgmult = 1.3
			techtype = "Physical"
			Move()
				var/obj/K = new/obj/techniques/ikkatrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		ikkatrail
			icon = 'ikka.dmi'
			icon_state = "2"
			density = 0
			lifetime = 2


///Nake2
		nakemiddle
			icon = 'uraskill.dmi'
			icon_state = "two"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Reiryoku"

		nakeright
			icon = 'uraskill.dmi'
			icon_state = "three"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Reiryoku"

		nakeleft
			icon = 'uraskill.dmi'
			icon_state = "one"
			density = 1
			lifetime = 30
			dmgmult = 1.5
			techtype = "Reiryoku"


// Shoot Q
		firearrow2
			icon = 'redarrow2.dmi'
			icon_state = "arrow"
			density = 1
			lifetime = 20
			dmgmult = 1.6
			techtype = "Reiryoku"
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return



		firearrow
			icon = 'quincyarrow2.dmi'
			icon_state = "arrow"
			density = 1
			lifetime = 20
			dmgmult = 1.4
			techtype = "Reiryoku"

//hitsu


		iceblast
			icon = 'hitsu3.dmi'
			icon_state = "blast"
			density = 1
			lifetime = 6
			dmgmult = 1.6
			techtype = "Reiryoku"


// ShurikenThrow


		crossthrow
			icon = 'cross2.dmi'
			icon_state = "one"
			density = 1
			lifetime = 50
			dmgmult = 1
			techtype = "Mixed"
// uql lanza

		lanza
			icon = 'lanza.dmi'
			icon_state = "lanza"
			density = 1
			lifetime = 50
			dmgmult = 2.2
			techtype = "Reiryoku"
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return

// momo blast
		blast
			icon = 'firee.dmi'
			icon_state = "fire"
			density = 1
			lifetime = 30
			dmgmult = 1.2
			techtype = "Reiryoku"
// shuriken
		shuriken
			icon = 'shuik.dmi'
			icon_state = "sur"
			density = 1
			lifetime = 10
			dmgmult = 1.6
			techtype = "Physical"
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return



//Transmutel

		Tlight
			icon = 'lightin.dmi'
			icon_state = "head"
			density = 1
			lifetime = 18
			dmgmult = 2.5
			techtype = "Mixed"
			Move()
				var/obj/K = new/obj/techniques/tlight(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return

		tlight
			icon = 'lightin.dmi'
			icon_state = "tail"
			density = 0
			lifetime = 15



//Flame3
		Flame3
			icon = 'flame3.dmi'
			icon_state = "head"
			density = 1
			lifetime = 30
			dmgmult = 3.5
			techtype = "Reiryoku"
			Move()
				var/obj/K = new/obj/techniques/flame3(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return

		flame3
			icon = 'flame3.dmi'
			icon_state = "tail"
			density = 0
			lifetime = 40





// mshurkien
		shurikenmuti
			icon = 'shuik.dmi'
			icon_state = "msur"
			density = 1
			lifetime = 8
			dmgmult = 1.8
			techtype = "Mixed"
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
// bala
		bala
			icon = 'bala.dmi'
			icon_state = "bala"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

		gcero
			icon = 'gcero.dmi'
			icon_state = "one"
			density = 1
			lifetime = 50
			dmgmult = 2.3
			techtype = "Reiryoku"
			pixel_x = -1


// ki blast
		kiblast
			icon = 'kiblast.dmi'
			icon_state = "one"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

// bala
		rockblast
			icon = 'rockblast.dmi'
			icon_state = "one"
			density = 1
			lifetime = 30
			dmgmult = 1.4
			techtype = "Physical"

// repira ball

		Respiraball
			icon = 'barrask.dmi'
			icon_state = "barrask"
			density = 1
			lifetime = 30
			dmgmult = 1.7
			techtype = "Reiryoku"
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
//  bullets
		bullet
			icon = 'vk.dmi'
			icon_state = "bullet"
			density = 1
			lifetime = 5
			dmgmult = 1.9
			techtype = "Reiryoku"



// Firegun
		firegun
			icon = 'bullet.dmi'
			icon_state = "bullets"
			density = 1
			lifetime = 4
			dmgmult = 0.7
			techtype = "Mixed"
//Wind below

		wlsmiddle
			icon = 'getsuga.dmi'
			icon_state = "middle"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

		wlsright
			icon = 'getsuga.dmi'
			icon_state = "right"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

		wlsleft
			icon = 'getsuga.dmi'
			icon_state = "left"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

//Metal below

		metalball
			icon = 'bountometalball.dmi'
			icon_state = ""
			density = 1
			lifetime = 20
			dmgmult = 1.1
			techtype = "Physical"

// grimm
		Des
			icon = 'grrimmskill.dmi'
			icon_state = "Desgarron"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

		DesR
			icon = 'grrimmskill.dmi'
			icon_state = "Desgarron(right)"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

		DesL
			icon = 'grrimmskill.dmi'
			icon_state = "Desgarron(left)"
			density = 1
			lifetime = 30
			dmgmult = 1.3
			techtype = "Reiryoku"

//Hollow below

		garganta
			icon = 'garganta2.dmi'
			lifetime = 80
			density = 0
			pixel_x = -32
			New()
				..()
				flick("open",src)
				spawn(7)
					density = 1
			Del()
				density = 0
				flick("shut",src)
				spawn(6)
					..()
			Bumped(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						switch(M.z)
							if(2)
								M.loc = locate(rand(181,81),rand(100,180),3) //to HM
							if(3)
								M.loc = locate(rand(1,100),rand(1,100),2) //to earth
							else
								M.loc = locate(rand(181,81),rand(100,180),3) //to HM
						del(src)
					else
						return

// Kaien

		tidalwave
			icon = 'nkaien.dmi'
			icon_state = "Wave"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.3
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/tidalwavetrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
				sleep(1)
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return


		tidalwavetrail
			icon = 'nkaien.dmi'
			icon_state = "Wave trail"
			density = 0
			lifetime = 20

		cero
			icon = 'cero.dmi'
			icon_state = ""
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.5
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/cerotrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		cerotrail
			icon = 'cero.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20

//sonfoi
		sonfois
			icon = 'sfs.dmi'
			icon_state = "leads"
			density = 1
			techtype = "Physical"
			dmgmult = 3.5
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/ftrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		ftrail
			icon = 'sfs.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20
// uq cero

		ulqcero
			icon = 'uqlcero.dmi'
			icon_state = "cero"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.5
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/qcerotrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		qcerotrail
			icon = 'uqlcero.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20



		spear
			icon = 'res7.dmi'
			icon_state = "fr"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.8
			lifetime = 25
			Move()
				var/obj/K = new/obj/techniques/speartrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		speartrail
			icon = 'res7.dmi'
			icon_state = "mid"
			density = 0
			lifetime = 15
			Move()
				var/obj/L = new/obj/techniques/spear2trail(src.loc)
				src.trails += L
				L.loc = src.loc
				L.dir = src.dir
				..()
		spear2trail
			icon = 'res7.dmi'
			icon_state = "bk"
			density = 0
			lifetime = 5

		bluecero
			icon = 'coolcero.dmi'
			icon_state = "cero"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 1.4
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/bcerotrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		bcerotrail
			icon = 'coolcero.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20

		cerocharge
			icon = 'ceroc1.dmi'
			density = 0
			lifetime = 10

		granreyceromiddle
			icon = 'cero2.dmi'
			icon_state = "middle"
			techtype = "Reiryoku"
			dmgmult = 2
			density = 1
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/granreycerotrailmiddle(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		granreyceroleft
			icon = 'cero2.dmi'
			icon_state = "left"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/granreycerotrailleft(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		granreyceroright
			icon = 'cero2.dmi'
			icon_state = "right"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/granreycerotrailright(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		granreycerotrailmiddle
			icon = 'cero2.dmi'
			icon_state = "middletrail"
			density = 0
			lifetime = 50

		granreycerotrailleft
			icon = 'cero2.dmi'
			icon_state = "lefttrail"
			density = 0
			lifetime = 50

		granreycerotrailright
			icon = 'cero2.dmi'
			icon_state = "righttrail"
			density = 0
			lifetime = 50

		granreycerocollect
			icon = 'ceroc.dmi'
			density = 0
			lifetime = 4
// Stark Cero

		Metralettaceromiddle
			icon = 'starkcero.dmi'
			icon_state = "ceromet"
			techtype = "Reiryoku"
			dmgmult = 2
			density = 1
			lifetime = 60


		metralettaceroleft
			icon = 'starkcero.dmi'
			icon_state = "ceromet"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2
			lifetime = 60


		metralettaceroright
			icon = 'starkcero.dmi'
			icon_state = "ceromet"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2
			lifetime = 60



		slash
			techtype = "Physical"
			icon = 'nslash.dmi'
			dmgmult = 1.25
			lifetime = 1
			density = 1


//Flashstep below

		afterimage
			icon = 'flashstep2.dmi'
			density = 0
			lifetime = 5
			layer = MOB_LAYER + 5

		afterimage1
			icon = 'flashstep.dmi'
			density = 0
			lifetime = 5
			layer = MOB_LAYER + 5

		afterimage2
			icon = 'flashstep3.dmi'
			density = 0
			lifetime = 5
			layer = MOB_LAYER + 5





// desgarreon 2


		desmiddle
			icon = 'desss.dmi'
			icon_state = "m"
			techtype = "Mixed"
			dmgmult = 2
			density = 1
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/destrailmiddle(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		desleft
			icon = 'desss.dmi'
			icon_state = "1"
			density = 1
			techtype = "Mixed"
			dmgmult = 2
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/destrailleft(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		desright
			icon = 'desss.dmi'
			icon_state = "2"
			density = 1
			techtype = "Mixed"
			dmgmult = 2
			lifetime = 60
			Move()
				var/obj/K = new/obj/techniques/destrailright(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		destrailmiddle
			icon = 'desss.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 50

		destrailleft
			icon = 'desss.dmi'
			icon_state = "1trail"
			density = 0
			lifetime = 50

		destrailright
			icon = 'desss.dmi'
			icon_state = "2trail"
			density = 0
			lifetime = 50

//shibari
		shibarimiddle
			icon = 'uraskill.dmi'
			icon_state = "m"
			techtype = "Reiryoku"
			dmgmult = 3
			density = 1
			lifetime = 130
			Move()
				var/obj/K = new/obj/techniques/shibarimiddletrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		shibarileft
			icon = 'uraskill.dmi'
			icon_state = "l"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2.5
			lifetime = 130
			Move()
				var/obj/K = new/obj/techniques/shibarilefttrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		shibariright
			icon = 'uraskill.dmi'
			icon_state = "r"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2.5
			lifetime = 130
			Move()
				var/obj/K = new/obj/techniques/shibaririghttrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()
			Bump(A) //Override the entire Bump() proc for this
				if(ismob(A)) //If the dense atom being hit is a mob
					var/mob/O = src.owner
					var/mob/M = A
					if(M == O||(M.enemy&&O.enemy))
						del(src)
						return
					src.loc = M.loc
					takeDamage(src,M) //run takeDamage where src is the object doing damage and M is the mob taking damage
					if(M)
						return
		shibarimiddletrail
			icon = 'uraskill.dmi'
			icon_state = "m"
			density = 0
			lifetime = 130

		shibarilefttrail
			icon = 'uraskill.dmi'
			icon_state = "l"
			density = 0
			lifetime = 130

		shibaririghttrail
			icon = 'uraskill.dmi'
			icon_state = "r"
			density = 0
			lifetime = 130



		tsword
			icon = 'tsword.dmi'
			icon_state = "one"
			density = 1
			techtype = "Mixed"
			dmgmult = 2.5
			lifetime = 30
			Move()
				var/obj/K = new/obj/techniques/tsword1(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		tsword1
			icon = 'tsword.dmi'
			icon_state = "one"
			density = 0
			lifetime = 20

		senkaimon2
			icon = 'matrix.dmi'
			lifetime = 80
			density = 0
			New()
				..()
				flick("open",src)
				spawn(11)
					density = 1
			Del()
				density = 0
				flick("shut",src)
				spawn(6)
					..()
			Bumped(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						switch(M.z)
							if(2)
								M.loc = locate(36,6,1) //to SS
							else
								M.loc = locate(36,6,1) //to SS
						del(src)
					else
						return

		senkaimon3
			icon = 'matrix.dmi'
			lifetime = 80
			density = 0
			New()
				..()
				flick("open",src)
				spawn(11)
					density = 1
			Del()
				density = 0
				flick("shut",src)
				spawn(6)
					..()
			Bumped(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						switch(M.z)
							if(2)
								M.loc = locate(188,51,11) //to SS
							else
								M.loc = locate(188,51,11) //to SS
						del(src)
					else
						return

		kamefront
			icon = 'kamee.dmi'
			icon_state = "Shot"
			density = 1
			techtype = "Reiryoku"
			dmgmult = 2.5
			lifetime = 20
			Move()
				var/obj/K = new/obj/techniques/kametrail(src.loc)
				src.trails += K
				K.loc = src.loc
				K.dir = src.dir
				..()

		kametrail
			icon = 'kamee.dmi'
			icon_state = "trail"
			density = 0
			lifetime = 20