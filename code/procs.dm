//////////////////////////////////////
/*        Generic proc files        */
//////////////////////////////////////


world/proc/Event5()
	var/last_initiate = 0
	var/event_delay = 18000 //half an hour
	if(last_initiate + event_delay > world.time)
		return // the last use + the delay of one minute is a larger number than the current time, so cancel the event
	else
		// if it's a smaller number than world.time
		last_initiate = world.time //reset the last_initiate to the current time
		sleep(8000)
		//StartTournament(null, world.time, time before tournament starts, reward for winner in numbers, reward for runnerup in numbers)
		StartTournament(null, world.time, 1800, rand(50000000,100000000), rand(1000000,10000000))


world/proc/Event()
   var/last_initiate = 0
   var/event_delay = 1000 // one minute

   if(last_initiate + event_delay > world.time)
      return // the last use + the delay of one minute is a larger number than the current time, so cancel the event

   else
      // if it's a smaller number than world.time
      last_initiate = world.time //reset the last_initiate to the current time
      Start_Raid()


world/proc/pickevent()
	if(prob(20))
		Event()
	if(prob(20))
		Event6()
	if(prob(10))
		Event3()
	if(prob(10))
		Event2()
	if(prob(20))
		Event8()
	if(prob(20))
		Event5()


world/New() //when you startup the world
   spawn(1)
      while(1) //always true so it runs forever
         pickevent() //proc that checks the timer shit
         sleep(10000)




world/proc/Event2()
   var/last_initiate2 = 0
   var/event_delay2 = 2000 // one hour

   if(last_initiate2 + event_delay2 > world.time)
      return // the last use + the delay of one minute is a larger number than the current time, so cancel the event

   else
      // if it's a smaller number than world.time
      last_initiate2 = world.time //reset the last_initiate to the current time
      DoubleExp()

world/proc/Event6()
   var/last_initiate6 = 0
   var/event_delay6 = 15000 // one hour

   if(last_initiate6 + event_delay6 > world.time)
      return // the last use + the delay of one minute is a larger number than the current time, so cancel the event

   else
      // if it's a smaller number than world.time
      last_initiate6 = world.time //reset the last_initiate to the current time
      discord()



world/proc/Event3()
   var/last_initiate3 = 0
   var/event_delay3 = 800// one minute

   if(last_initiate3 + event_delay3 > world.time)
      return // the last use + the delay of one minute is a larger number than the current time, so cancel the event

   else
      // if it's a smaller number than world.time
      last_initiate3 = world.time //reset the last_initiate to the current time
      DoubleCor()



world/proc/Event8()
   var/last_initiate3 = 0
   var/event_delay3 = 800// one minute

   if(last_initiate3 + event_delay3 > world.time)
      return // the last use + the delay of one minute is a larger number than the current time, so cancel the event

   else
      // if it's a smaller number than world.time
      last_initiate3 = world.time //reset the last_initiate to the current time
      Doubledoublestatgain()














//All mobs inherit these procs
mob
	proc
		resetToDefault() //this proc is made to replace all the crap that was in Death()
			if(!src||!src.client) return //if there's not source or it isn't a player
			//set variables back to default
			src.armon = 0
			src.inhoug = 0
			src.inhom = 0
			src.overlays = null //clear out all overlays
			src.underlays = null //clear out all underlays
			src.inbankai = 0
			src.inshikai = 0
			src.tourny2=0
			src.inevent=0
			src.inevent = 0
			src.guildtourny = 0
			src.dead = 1
			src.inrelease = 0
			src.expmod = src.defaultexpmod
			src.bowon = 0
			if(src.inhom == 1)
				src.strmod -= 4
				src.defmod -= 4
				src.reimod -= 4
				src.resmod -= 4
			if(src.inhoug == 1)
				src.reimod -= 5
				src.resmod -= 5
			if(src.armon == 1)
				src.strmod -= 5
				src.defmod -= 5
			src.poison = 0
			maskon = 0
			src.chadref = 0
			src.seeleuse = 0
			src.verbs += /mob/verb/telefloor1
			src.rundelay = src.defaultrundelay //default rundelay
			src.health = src.mhealth
			src.reiryoku = src.mreiryoku
			src.strength = src.mstrength
			src.defence = src.mdefence
			src.reiatsu = src.mreiatsu
			src.resistance = src.mresistance
			src.icon = 'base.dmi' //set src's icon to base.dmi by default
			src.icon_state = ""
			src.overlays += src.hair
			src.underlays -= 'hitsufreeze.dmi'
			src.underlays -= 'hitsufreeze2.dmi'
			for(var/obj/O in src) //for every object in src's inventory
				if(istype(O,/obj/equipment/)) //if O is an object of the obj/equipment tree
					var/obj/equipment/E = O //set E equal to O
					if(E.name == "sword") //if E's name is equal to zanpakuto
						continue //skip it
					else //if it isn't equal to zanpakuto
						if(E.worn) //if it's worn
							src.overlays += E.icon //add E's icon to the src



///////////////
/*Death stuff*/
///////////////

		Death(mob/M)
			if(!src||!M) //if there isn't a source or M after it's called(by logging out for instance)
				return //cancel
			if(src.npc||src.ispedal||src.safe||src.zab||(src.enemy&&M.enemy)) //if src is a npc, a pedal, safe, zabimaruobject or the checked mob and killer are both mob/enemy
				src.health = src.mhealth //set their hp back to full
				return
			if(src.enemy) //if src is an enemy(mob/enemy)
				if(src.health<=0) //if src has less than or equal to 0 hp
					src.health = src.healthwas //set health to healthwas
					dropItems(src)
					M.exp += src.expgain
					M.boarkills += src.boarkills
					M.forsakenkills += src.forsakenkills
					M.larzakills += src.larzakills
					M.hadesguardkill += src.hadesguardkill
					M.boss1 += src.boss1
					M.boss2 += src.boss2
					M.boss3 += src.boss3
					M.boss4 += src.boss4
					M.boss5 += src.boss5
					M.boss6 += src.boss6
					M.boss7 += src.boss7
					M.boss8 += src.boss8
					M.boss9 += src.boss9
					M.boss10 += src.boss10
					M.boss11 += src.boss11
					M.boss12 += src.boss12
					M.boss13 += src.boss13
					M.boss14 += src.boss14
					M.gottitlereward += src.gottitlereward // adds enemies src to yours M
					M.levelup()
					M.skill()
					var/F
					var/G
					var/R
					var/T
					var/e
					var/o
					e = src.expgain * 0.50
					o = applycommas(e)
					G = src.expgain * 2
					F = applycommas(G)
					T = src.Cor * 2
					R = applycommas(T)
					if(M.doubleexp == 1)
						M.exp += src.expgain
						outputMessage(M,"<font color=green>You have defeated a <font color=white>[src]</font>! You gained <font color=white>[F]</font> experience!</font>","gametext")
					if(M.doubleexp == 0)
						outputMessage(M,"<font color=green>You have defeated a <font color=white>[src]</font>! You gained <font color=white>[src.expgain]</font> experience!</font>","gametext")

					for(var/mob/M2 in onlinePlayers)
						if(M2.in_guild&&M2.guild_name==M.guild_name)
							if(M2!=M)
								M2.exp += src.expgain * 0.50
								M2.levelup()
								M2.skill()
								M2 << output("<font color=green>[M] has defeated <font color=white>[src]</font>! You gain <font color=white>[o]</font> experience!</font>","gametext")
					for(var/mob/M3 in onlinePlayers)
						if(M3.in_Party&&M3.Party_name==M.Party_name)
							if(M3!=M)
								M3.exp += src.expgain * 0.50
								M3.levelup()
								M3.skill()
								M3 << output("<font color=green>[M] has defeated <font color=white>[src]</font>! You gain <font color=white>[o]</font> experience!</font>","gametext")
					if(M.doublecor == 0)
						M.Cor += src.Cor
						src.Cor = src.Corwas
						outputMessage(M,"<font color=green>You pick up <font color=white>[src.Cor]</font> Cor.</font>","gametext")
					if(M.doublecor == 1)
						M.Cor += src.Cor
						M.Cor += src.Cor
						src.Cor = src.Corwas
						outputMessage(M,"<font color=green>You pick up <font color=white>[R]</font> Cor.</font>","gametext")

					src.loc = locate(0,0,0)
					spawn(src.spawntime*10)
						src.loc = src.oldspot
					return
			if(src.health <= 0) //from here it's what happens if the src is a player
				src.resetToDefault()
				if(src == fighter1 && M == fighter2 || M == fighter1 && src == fighter2)
					TournyDeath(src, M)
					return
				if(alpha < 255) alpha = 255
				for(var/obj/O in src.petals)
					del(O)
				for(var/mob/zabimaru/A in world)
					if(A.owner == src)
						del(A)
				if(src.spawn1 == 1)
					src.loc = locate(97,24,1)
					src.safe = 1
					outputMessage(world,"<font color = red>[M] has killed [src]!","gametext")
				if(src.spawn2 == 1)
					src.loc = locate(138,17,3)
					src.safe = 1
					outputMessage(world,"<font color = red>[M] has killed [src]!","gametext")
				if(src.spawn3 == 1)
					src.loc = locate(112,35,4)
					src.safe = 1
					outputMessage(world,"<font color = red>[M] has killed [src]!","gametext")
				src.deaths += 1
				var/I = src.exp
				I += M.exp
				src.exp = 0
				outputMessage(M,"You have gained [I]","gametext")               //Regardless if M is an enemy and src is a Human with a soulpower less than 5
				M.kills += 1                    //This will happen anyway
				src.updateHud()
				src.client.updateOverlays()
				M.updateHud()

///////////////////
/*Damage handling*/
///////////////////
//All atoms(mobs,objects,turfs,etc.) inherit these procs
atom
	proc
		getDamage(var/A,mob/M) //argument 1 is what is doing the damage(notice not defined as mob) and argument 2 what receives it
			var/tmp/dmg = 0 //create tmp dmg var
			var/tmp/total = 0 //same with total
			if(isobj(A)) //if argument 1 that does the damage is an object
				var/obj/techniques/O = A //set O equal to A. Note that O is defined as an obj/techniques
				var/mob/S = O.owner //mob/S is equal to the owner of O
				switch(O.techtype) //check the techtype of O
					if("Physical")
						dmg = (S.strength*S.strmod)*O.dmgmult //dmgmult is a variable set inside an object
						total = round(max(1,(dmg - (M.defence*M.defmod)))) //total is equal to whatever dmg is, minus 50% of the receiver's (defence*defmod)
					if("Reiryoku")
						dmg = (S.reiatsu*S.reimod)*O.dmgmult
						total = round(max(1,(dmg - (M.resistance*M.resmod)))) //total is equal to whatever dmg is, minus 50% of the receiver's (resistance*resmod)
					if("Mixed")
						dmg = (((S.reiatsu/2)*S.reimod)+((S.strength/2)*S.strmod))*O.dmgmult
						total = round(max(1,(dmg - ((M.resistance*M.resmod)+((M.defence*M.defmod)*0.4))))) //total is equal to whatever dmg is, minus 40% of the receiver's (resistance*resmod)+(defence*defmod)
			if(ismob(A)) //if argument 1 that does damage is a mob
				var/mob/S = A //set mob/S equal to A
				switch(S.attstyle)
					if("Physical")
						dmg = S.strength*S.strmod
						total = round(max(1,(dmg - (M.defence*M.defmod)))) //total is equal to whatever dmg is, minus 50% of the receiver's (defence*defmod)
					if("Reiryoku")
						dmg = S.reiatsu*S.reimod
						total = round(max(1,(dmg - (M.resistance*M.resmod)))) //total is equal to whatever dmg is, minus 50% of the receiver's (resistance*resmod)
					if("Mixed")
						dmg = ((S.reiatsu/2)*S.reimod)+((S.strength/2)*S.strmod)
						total = round(max(1,(dmg - (M.resistance*M.resmod)+((M.defence*M.defmod))))) //total is equal to whatever dmg is, minus 40% of the receiver's (resistance*resmod)+(defence*defmod)
			return total //this proc returns the value of total

		takeDamage(atom/A,mob/S) //argument 1 is what does the damage, argument 2 receives it
			var/tmp/dmg = getDamage(A,S) //dmg is set equal to the outcome of getDamage where argument 1 is A and argument 2 is S
			var/T = applycommas(dmg)
			S.health -= max(1,dmg) //S's health takes the highest number between 1 and dmg. If it's lower than 1 it'll be set to 1.
			S.updateHud() //update S's hud after taking damage
			if(istype(A,/obj/techniques/)) //if argument 1 is equal to an obj under obj/techniques
				var/obj/O = A //obj/O is equal to A
				var/mob/B = O.owner //mob/B is equal to O's owner
				show_damage(S,T,"red")
				B.attstyle = "" //reset the style
				if(S.client)
					S.cancelRest()
					S.healthRegen()
				S.Death(B) //run the death proc with B as the killer(owner of the skill that hits S)
			else
				var/mob/B = A
				show_damage(S,T,"red")
				outputMessage(view(3),"[S] has been hit by [B] for [T].","gametext2")
				B.attstyle = "" //reset the style
				if(S.client)
					S.cancelRest()
					S.healthRegen()
				S.Death(B) //run the death proc with A as the killer

/////////////////
/*Rest handling*/
/////////////////


mob/proc/givetitles()//procs in this file and have a certain set up
	if(src.gottitlereward>=1)//checks if u have 1 or mroe kills
		if(src.gottitle == 1)//checks if u got it before this is a 1 or 0 1 stops 0 lets u get it nothing else
			return
		if(src.gottitle ==0)//if not
			src.status ="Barra Slayer"//you got it
			outputMessage(world,"[src] has become a Barra Slayer","gametext")//output to world chat
			src.gottitle = 1//gives 1 so cant claim again
/*	if(src.gottitlereward2 >=1)
		if(src.gottitle2 == 1)
			return
		*/




mob
	proc
		cancelRest()
			if(!src.resting)
				return
			if(src.health == mhealth)
				if(src.reiryoku == mreiryoku)
					src.frozen = 0
					src.resting = 0
					src.dead = 0
					src.icon_state = ""
			else
				src.frozen = 0
				src.resting = 0
				src.dead = 0
				src.icon_state = ""

//////////////////
/*Regen handling*/
//////////////////
mob
	proc
		fastheal()
			if(fastheal == 1)
				return
			else
				outputMessage(src,"<b>You begin to heal</b>")
				src.fastheal = 1
				spawn(10)
					usr.health += usr.mhealth*0.10
					if(usr.health>usr.mhealth)
						usr.health = usr.mhealth
						spawn(100)
							src.fastheal = 0
							return
					spawn(10)
						usr.health += usr.mhealth*0.10
						if(usr.health>usr.mhealth)
							usr.health = usr.mhealth
							spawn(100)
								outputMessage(src,"<b>You can heal again</b>")
								src.fastheal = 0
								return
						spawn(10)
							usr.health += usr.mhealth*0.10
							if(usr.health>usr.mhealth)
								usr.health = usr.mhealth
								spawn(100)
									outputMessage(src,"<b>You can heal again</b>")
									src.fastheal = 0
									return
							spawn(10)
							usr.health += usr.mhealth*0.10
							if(usr.health>usr.mhealth)
								usr.health = usr.mhealth
								spawn(100)
									outputMessage(src,"<b>You can heal again</b>")
									src.fastheal = 0
									return
							spawn(10)
								usr.health += usr.mhealth*0.10
								if(usr.health>usr.mhealth)
									usr.health = usr.mhealth
									spawn(100)
										outputMessage(src,"<b>You can heal again</b>")
										src.fastheal = 0
										return
								spawn(100)
									outputMessage(src,"<b>You can heal again</b>")
									src.fastheal = 0


mob
	proc
		healthRegen()
			set waitfor = 0
			if(src.healthregening)
				return
			src.healthregening = 1
			while(src.health < src.mhealth)
				if(src.resting)
					src.health = min(src.mhealth,src.health+(src.mhealth*0.05)) //gain 15% per loop
					src.updateHud()
				else
					if("HighSpeed" in src.traits)
						src.health = min(src.mhealth,src.health+(src.mhealth*0.08)) //gain 1% per loop
						src.updateHud()
						sleep(30) //wait two seconds
						src.healthregening = 0
						src.dead = 0
					src.health = min(src.mhealth,src.health+(src.mhealth*0.04)) //gain 1% per loop
					src.updateHud()
					sleep(30) //wait two seconds
			src.healthregening = 0
			src.dead = 0

		manaRegen()
			set waitfor = 0
			if(src.manaRegening||src.inran) //if already regening or using ransoutengai
				return
			src.manaRegening = 1
			while(src.mana < src.mmana)
				if(src.resting)
					src.mana = min(src.mmana,src.mana+(src.mmana*0.20)) //gain 15% per loop
				else
					if("HighSpeedMana" in src.traits)
						src.health = min(src.mhealth,src.health+(src.mhealth*0.08)) //gain 1% per loop
						src.updateHud()
						sleep(30) //wait two seconds
						src.healthregening = 0
						src.dead = 0
					else
						src.mana = min(src.mmana,src.mana+(src.mmana*0.04)) //gain 1% per loop
				src.updateHud()
				sleep(20) //wait two seconds
			src.manaRegening = 0


////////////////////

////////missions/////////////
///////////////////////
/////////////////
///////////////////////////








mob/proc/autoTrain(){
	set waitfor = 0

	while(isTraining && world.time < trainingTime){
		if(src.stattype == "Strength")
			if(!("Rebirth1" in src.traits))
				src.statgainst()
				src.exp += 200
			else
				src.statgainstrb()
		if(src.stattype == "Reiatsu")
			if(!("Rebirth1" in src.traits))
				src.statgainrei()
				src.exp += 200
			else
				src.statgainreirb()
		if(src.stattype == "Balenced")
			if(!("Rebirth1" in src.traits))
				src.balence()
				src.exp += 200
			else
				src.balencerb()
		if(src.stattype == "Defense")
			if(!("Rebirth1" in src.traits))
				src.defense()
				src.exp += 200
		if(src.stattype == "Resistance")
			if(!("Rebirth1" in src.traits))
				src.resistance()
				src.exp += 200
			else
				src.resistancerb()
		src.levelup()
		src.frozen = 1
		src.mana = 0
		if(src.doubleexp == 1)
			src.balence()
			src.exp += 750
		if(src.doublestatgain == 1)
			src.balence()
			src.balence()
			src.exp += 250
			src.statpoints += 15
		src.canattack = 0
		src.icon_state = "Train"
		// do stuff
		sleep(30)
	}

}




//////////////////
/*Trait handling*/
//////////////////

mob
	proc
		traitPicker()
			switch(src.race)
				if("Arrancar")
					if(prob(20))
						src.traits += "Hierro"
						src.mdefence += 50000
						src.defence += 50000
						src.spentpoints += 50000
						src << "<font color=gold><b>Your skin becomes hard as crystals.</b></font>"
						return
					if(prob(20))
						src.traits += "HighSpeed"
						src << "<font color=gold><b>Your wounds begin to heal at High Speeds.</b></font>"
						return



////////////////
/*Conditions*/
////////////////

mob
	proc
		reipressure()
			spawn(2)
				usr.attstyle = "Mixed"
				takeDamage(usr,src)


mob
	proc
		burn()
			spawn(1)
				usr.attstyle = "Reiryoku"
				takeDamage(usr,src)
				src.overlays += 'nprop.dmi'
				spawn(2)
					src.overlays -= 'nprop.dmi'


mob/proc/poison()
	spawn(2)
		usr.attstyle = "Mixed"
		takeDamage(src,usr)
		if(src.dead == 1)
			return
			spawn(4)
				usr.attstyle = "Mixed"
				takeDamage(src,usr)
				if(src.dead == 1)
					return
					spawn(4)
						usr.attstyle = "Mixed"
						takeDamage(src,usr)

mob
	proc
		healthpoison()
			spawn(10)
				src.health -= (usr.mreiatsu * 0.50)
				src.updateHud()
				spawn(10)
					src.health -= (usr.mreiatsu * 0.50)
					src.updateHud()
					spawn(10)
						src.health -= (usr.mreiatsu * 0.50)
						src.updateHud()
						spawn(10)
							src.health -= (usr.mreiatsu * 0.50)
							src.updateHud()
							spawn(10)
								src.health -= (usr.mreiatsu * 0.50)
								src.updateHud()
								spawn(10)
									src.health -= (usr.mreiatsu * 0.50)
									src.updateHud()
									spawn(10)
										src.health -= (usr.mreiatsu * 0.50)
										src.updateHud()
										spawn(10)
											src.health -= (usr.mreiatsu * 0.50)
												src.updateHud()




//////////////////
/*Level handling*/
//////////////////

mob
	proc
		levelup()
			if(src.rebirth3 == 0)
				if(!("LevelLimit" in src.traits))
					if(src.exp >= src.mexp) //if current exp is higher than or equal to maxexp
						if(src.soulpower>=300000000) //if soulpower is 001000
							src.mexp = src.exp //set exp equal to max exp
							src.exp = 1
							return //return
						while(src.exp>=src.mexp) //while current exp is higher than or equal to mexp
							src.exp = src.exp-src.mexp //current exp is equal to current exp - maxexp
							src.soulpower++ //add 1 to soulpower
							src.mexp = round((src.soulpower*50)+((src.soulpower*30)*0.50)) //mexp is equal to soulpower multiplied by 25 plus 20% of that
							src.mhealth += 600
							src.health = src.mhealth
							src.mana = src.mmana
							src.mmana += 75
							src.spentpoints += 75
							src.Cor += 20000
							switch(src.soulpower)
								if(1 to 50)
									src.statpoints += 300
								if(51 to 100)
									src.statpoints += 350
								if(101 to 250)
									src.statpoints += 400
								if(251 to 500)
									src.statpoints += 500
								if(501 to 1000)
									src.statpoints += 600
								if(1000 to 1500)
									src.statpoints += 700
								if(1500 to 1999)
									src.statpoints += 800
								if(2000 to 2998)
									src.statpoints += 900
								if(2999 to 4999)
									src.statpoints += 2500
								if(5000 to 10000)
									src.statpoints += 4500
								if(10001 to 20000)
									src.statpoints += 8000
								if(20001 to 5000000)
									src.statpoints += 30000
							if("Stubborn" in src.traits)
								src.statpoints += 250 //if you have the Stubborn trait add an additional statpoint
						outputMessage(src,"<span style='color: red ;font-size:2>You leveled up to level [soulpower]!</span>","gametext")
						show_levelup(src) //show the soulpower up message
						if(src.mstrength > src.strength)
							src.strength = src.mstrength
						if(src.mdefence > src.defence)
							src.defence = src.mdefence
						if(src.mreiatsu > src.reiatsu)
							src.reiatsu = src.mreiatsu
					src.skill() //run the skill proc
					src.healthRegen() //run health regen due to max health increasing
					src.manaRegen() //run reiryoku regen due to max reiryoku increasing
					src.updateHud() //update hud regardless if a levelup occured
					return
			else
				if(src.exp >= src.mexp) //if current exp is higher than or equal to maxexp
					if(!("LevelLimit" in src.traits))
						if(src.soulpower>=100000000) //if soulpower is 001000
							src.Cor += src.exp
							src.exp = 0
							src.mexp = 1
							return
					while(src.exp>=src.mexp) //while current exp is higher than or equal to mexp
						src.exp = src.exp-src.mexp //current exp is equal to current exp - maxexp
						src.soulpower++ //add 1 to soulpower
						if("Beta Tester" in src.traits) //if you have the Beta Tester trait
							src.mexp = round((src.soulpower*50)+((src.soulpower*50)*0.10)) //mexp is equal to soulpower multiplied by 25 plus 2% of that
						else
							src.mexp = round((src.soulpower*50)+((src.soulpower*45)*0.40)) //mexp is equal to soulpower multiplied by 25 plus 20% of that
						src.mhealth += 2000
						src.mmana += 10
						src.Cor += 50000
						src.spentpoints += 100
						switch(src.soulpower)
							if(1 to 50)
								src.statpoints += 600
							if(51 to 100)
								src.statpoints += 700
							if(101 to 250)
								src.statpoints += 800
							if(251 to 500)
								src.statpoints += 1000
							if(501 to 1000)
								src.statpoints += 2000
							if(1000 to 1500)
								src.statpoints += 4000
							if(1500 to 1999)
								src.statpoints += 6000
							if(2000 to 2998)
								src.statpoints += 7000
							if(2999 to 5000)
								src.statpoints += 8000
							if(5001 to 9999)
								src.statpoints += 9000
							if(9999 to 15000)
								src.statpoints += 10000
							if(15001 to 24999)
								src.statpoints += 11000
							if(25000 to 49999)
								src.statpoints += 14000
							if(50000 to 99999)
								src.statpoints += 15000
							if(100000 to 10000000)
								src.statpoints += 20000
								outputMessage("world","<font color = cyan><b>[src] has reached <font color=white>Max soulpower</font>!</b></font>","gametext")
						if("Stubborn" in src.traits)
							src.statpoints += 250 //if you have the Stubborn trait add an additional statpoint
					outputMessage(src,"<span style='color: red ;font-size:2;font-weight:bold'>You leveled up to level [soulpower]!</span>","gametext")
					show_levelup(src) //show the soulpower up message
					if(src.mstrength > src.strength)
						src.strength = src.mstrength
					if(src.mdefence > src.defence)
						src.defence = src.mdefence
					if(src.mreiatsu > src.reiatsu)
						src.reiatsu = src.mreiatsu
				src.skill() //run the skill proc
				src.healthRegen() //run health regen due to max health increasing
				src.manaRegen() //run reiryoku regen due to max reiryoku increasing
				src.updateHud() //update hud regardless if a levelup occured
				return


///mission shit




////////////////
/*Vaizard Crap*/
////////////////




mob
	proc
		skill()
			if(src.race == "Unchosen")
				if(src.soulpower >=9)
					if(!(/mob/techniques/verb/Waterwalk in src.verbs))
						src.verbs += /mob/techniques/verb/Waterwalk
						outputMessage(src,"<b>You learned Fly!","gametext")
				if(src.soulpower >=9)
					if(!(/mob/techniques/verb/Waterwalk_off in src.verbs))
						src.verbs += /mob/techniques/verb/Waterwalk_off
			src.updateHud()




world/proc
	AutoRepop()
		set background=1
		world.Repop()
		spawn(600)
			world.AutoRepop()




mob/proc/
	Removeoverlays()
		if(src.race == "Hollow")
			if(src.hollowtype=="Normal")
				src.icon = 'hollow.dmi'






mob
 var
  ssj1drain = 10


mob
	proc
		saveproc()
			if(src.cansave)
				var/savefile/save
				save = new ("playersaves/[src.key]")
				save["mob"] << src
				save["x"] << src.x
				save["y"] << src.y
				save["z"] << src.z
				save["equipment"] << src.client.equipment
				save["changedToSystem"] << src.client.changedToSystem
				save["wearing"] << src.client.wearing
				save["quests"] << src.client.questsList
				save["verbs"] << src.verbs

proc
	Quake_Effect(mob/M,duration,strength=1)
		if(!M.client)return
		spawn(1)
			var/oldeye=M.client.eye
			var/x
			for(x=0;x<duration,x++)
			 if(M)
				 M.client.eye = get_steps(M,pick(NORTH,SOUTH,EAST,WEST),strength)
				 sleep(1)
			M.client.eye=oldeye

proc/get_steps(atom/ref,dir,num)
    var/x
    var/turf/T=ref:loc
    if(isturf(ref))
        T=ref
    for(x=0;x<num;x++)
        ref=get_step(ref,dir)
        if(!ref)break
        T=ref
    return T

proc
	dir2text(dir)
		switch(dir)
			if(1)
				return "North"
			if(2)
				return "South"
			if(4)
				return "East"
			if(5)
				return "Northeast"
			if(6)
				return "Southeast"
			if(8)
				return "West"
			if(9)
				return "Northwest"
			if(10)
				return "Southwest"


	savehouses()
		set background = 1
		for(var/turf/telehouses/T in world) //for every turf under telehouses
			if(T.houseowner) //if houseowner has been set
				var/savefile/save = new ("housesaves/[T.house]/[T.houseowner]") //save
				save["houseowner"] << T.houseowner





