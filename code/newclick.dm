




mob
	DblClick()
		if(usr.delay == 1)
			return
		if(usr.GM >= 0)
			if(src.client)
				var/i
				var/t
				var/r
				var/e
				var/w
				var/q
				var/a
				var/s
				var/j
				var/k
				k = applycommas(src.mexp)
				j = applycommas(src.exp)
				i = applycommas(src.health)
				t = applycommas(src.mhealth)
				r = applycommas(src.mana)
				e = applycommas(src.mmana)
				w = applycommas(src.strength)
				q = applycommas(src.defence)
				s = applycommas(src.reiatsu)
				a = applycommas(src.resistance)
				outputMessage(usr,"<font color=green>[src.name]/[src.race]/[src.guild_name]/[src.key]</br>Level :[src.soulpower]</br>Health:[i]/[t]</br>Mana:[r]/[e]</br>Strength:[w]/[strmod]</br>Defence:[q]/[src.defmod]</br>Reiatsu:[s]/[src.reimod]</br>Resistance:[a]/[src.resmod]</br>Exp:[j]/[k]","gametext")
				usr.delay = 1
				spawn(15)
					usr.delay = 0
			if(src.enemy)
				outputMessage(usr,"<font color = green>[src.name]</br>Health:[src.health]/[src.healthwas]</br>Strength:[src.strength]</br>Defence:[src.defence]</br>Reiatsu:[src.reiatsu]</br>Resistance:[src.resistance]</br>Exp Reward:[src.expgain]</br>Cor Drop:[src.Cor]","gametext")
				usr.delay = 1
				spawn(15)
					usr.delay = 0
























obj
	Click()
		for(var/obj/O in usr.petals)
			walk_towards(O,src,0)


mob
	Click()
		for(var/obj/O in usr.petals)
			walk_towards(O,src.loc,0)

turf
	Click()
		if(usr.inbankai&&usr.stype == "Renji") //if you are using Renji's bankai
			walk_towards(usr,src) //make the clicker walk towards the turf that is clicked
		if(usr.flashstep) //if the clicker has flashstep
			if(usr.rundelay > 2) //and their rundelay is higher than 2
				return //cancel
		if(usr.controlbug||usr.ikkakubankai) //if the clicker has controlbug or ikkakubankai true
			return //cancel
		if(!usr.firing&&usr.flashstep) //if the clicker isn't firing and has flashstep
			var/tmp/delay = 60 //make a temporary delay variable
			if(usr.race in list("Shinigami","Bount","Legendary Vaizard","SubShinigami"))
				if(usr.stype == "Ichigo"&&usr.inbankai)
					var/obj/A = new/obj()
					A.icon=usr.icon
					A.icon_state=usr.icon_state
					A.overlays=usr.overlays
					A.underlays = usr.underlays
					A.dir=usr.dir
					A.loc = usr.loc
					spawn(10)
						del(A)
					usr.firing = 1
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					delay -= 20
					if(usr.flashuse >= 100)
						step_towards(usr,src)
						usr.moving = 0
						new/obj/techniques/afterimage(usr.loc)
						delay -= 10
					if(usr.flashuse >= 200)
						step_towards(usr,src)
						usr.moving = 0
						delay -= 10
						new/obj/techniques/afterimage(usr.loc)
					if(usr.flashuse >= 300)
						step_towards(usr,src)
						usr.moving = 0
						delay -= 10
						step_towards(usr,src)
						usr.moving = 0
						new/obj/techniques/afterimage(usr.loc)
						delay -= 3
				else
					var/obj/base = new/obj/techniques/afterimage1(usr.loc)
					base.dir = usr.dir
					usr.firing = 1
					step_towards(usr,src)
					new/obj/techniques/afterimage(usr.loc)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					new/obj/techniques/afterimage(usr.loc)
					usr.moving = 0
					step_towards(usr,src)
					delay -= 20
					if(usr.flashuse >= 100)
						step_towards(usr,src)
						usr.moving = 0
						delay -= 10
					if(usr.flashuse >= 200)
						step_towards(usr,src)
						var/obj/ak =new/obj/techniques/afterimage(usr.loc)
						ak.dir = usr.dir
						usr.moving = 0
						delay -= 10
					if(usr.flashuse >= 300)
						step_towards(usr,src)
						usr.moving = 0
						delay -= 10
			if(usr.race == "Quincy"||usr.race == "Inoue"||"Weaponist")
				var/obj/base = new/obj/techniques/afterimage2(usr.loc)
				base.dir = usr.dir
				usr.firing = 1
				step_towards(usr,src)
				var/obj/k = new/obj/techniques/afterimage2(usr.loc)
				k.dir = usr.dir
				usr.moving = 0
				step_towards(usr,src)
				delay -= 20
				if(usr.flashuse >= 100)
					step_towards(usr,src)
					usr.moving = 0
					delay -= 10
				if(usr.flashuse >= 200)
					step_towards(usr,src)
					var/obj/ak =new/obj/techniques/afterimage2(usr.loc)
					ak.dir = usr.dir
					usr.moving = 0
					delay -= 10
				if(usr.flashuse >= 300)
					step_towards(usr,src)
					usr.moving = 0
					delay -= 10
			if(usr.race == "Arrancar"||(usr.race == "Fullbringer"&&usr.stype=="Sado"))
				new/obj/techniques/afterimage(usr.loc)
				for(var/mob/M in oview(2))
					step_away(M,usr,5)
				usr.firing = 1
				step_towards(usr,src)
				usr.moving = 0
				step_towards(usr,src)
				delay -= 20
				if(usr.flashuse >= 100)
					step_towards(usr,src)
					usr.moving = 0
					delay -= 10
				if(usr.flashuse >= 200)
					step_towards(usr,src)
					usr.moving = 0
					delay -= 10
				if(usr.flashuse >= 300)
					step_towards(usr,src)
					usr.moving = 0
					delay -= 10
			usr.flashuse ++
			usr.skill()
			sleep(delay)
			if(usr)
				usr.firing = 0
				return