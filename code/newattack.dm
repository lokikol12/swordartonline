/*
Plan to make several procs, so it's easier to edit for everyone
*/




mob/verb/Attack()
	set category = "Combat"
	if(src.safe) //if in a safezone or resting
		return //cancel
	if(src.resting)
		src.cancelRest()
	if(src.canattack) //if the src can strength
		src.canattack = 0
		//normal strength
		for(var/mob/M in get_step(src,src.dir)) //for every mob in src's direction between 0 and 1 tiles away(including the src)
			if(M==src||(M.enemy&&src.enemy)) //which is why we have to check if M is equal to the src and we also check if that mob is a fellow enemy
				continue //if so keep skip
			src.attstyle = "Physical" //this is reset inside the takeDamage proc
			flick("attack",src)
			if(M.client)
				M.defense()
			if(src.client)
				if(M.GM == 7)
					outputMessage(view(4),"Immortal Object","gametext")
					spawn(10)
						if(M.health < M.mhealth)
							M.health = M.mhealth
						src.canattack = 1
						return
			src.levelup()
			src.givetitles()//checks on attack if they have enough for a title and claims it
			if(src.client)
				src.statgainst()
			if(src.swordon == 1)
				M.overlays += 'nslash.dmi'
			if(src.swordon == 0)
				M.overlays += 'attack.dmi'
			takeDamage(src,M) //src does the damage and M takes the damages
			if(prob(20))
				step(M,src.dir)
			spawn(10)
				M.overlays -= 'attack.dmi'
				M.overlays -= 'nslash.dmi'
		spawn(10)
			src.canattack = 1


	else
		return




mob/techniques/verb/SpiritSlash()
	set category = "Combat"
	if(src.safe) //if in a safezone or resting
		return //cancel
	if(src.resting)
		src.cancelRest()
	if(src.canattack) //if the src can strength
		src.canattack = 0
		//normal strength
		for(var/mob/M in get_step(src,src.dir)) //for every mob in src's direction between 0 and 1 tiles away(including the src)
			if(M==src||(M.enemy&&src.enemy)) //which is why we have to check if M is equal to the src and we also check if that mob is a fellow enemy
				continue //if so keep skip
			src.attstyle = "Reiryoku" //this is reset inside the takeDamage proc
			flick("attack",src)
			takeDamage(src,M) //src does the damage and M takes the damages
		spawn(10)
			src.canattack = 1
			if(prob(10))
				src.statgainrei()
				src.updateHud() //update hud regardless if a levelup occured
	else
		return



mob/techniques/verb/CircleSlash()
	set category = "Combat"
	set name = "Circle Chop"
	if(src.safe) //if in a safezone or resting
		return //cancel
	if(src.resting)
		src.cancelRest()
	if(src.canattack) //if the src can strength
		src.canattack = 0
		//normal strength
		for(var/mob/M in get_step(src,src.dir)) //for every mob in src's direction between 0 and 1 tiles away(including the src)
			if(M==src||(M.enemy&&src.enemy)) //which is why we have to check if M is equal to the src and we also check if that mob is a fellow enemy
				continue //if so keep skip
			src.attstyle = "Physical" //this is reset inside the takeDamage proc
			for(var/mob/E in oview(1)) //for every mob within 4 tiles in any direction
				E.reipressure()
			takeDamage(src,M) //src does the damage and M takes the damages
			flick("attack",src)
			takeDamage(src,M) //src does the damage and M takes the damages
		spawn(50)
			src.canattack = 1
			if(prob(10))
				src.statgainst()
				src.updateHud() //update hud regardless if a levelup occured
	else







mob/techniques
	verb
		SpecialAttack()
			set category = "Combat"
			if(usr.safe) //if usr is safe, cancel strength
				outputMessage(usr,"<b>You are in safe zone!","gametext")
				return
			if(usr.inbankai&&!usr.senkei&&usr.stype == "Byakuya"||usr.inshikai&&usr.stype=="Byakuya") //checks if a Byakuya shikai/bankai is in flowerygayness mode
				return //if it is then cancel the strength
			if(usr.resting) //kinda speaks for itself. If usr is resting, cancel strength
				outputMessage(usr,"<b>You can't do this while resting.","gametext")
				return
			if(usr.canattack) //if usr can strength
				usr.canattack = 0 //set can strength to 0, so if they hit Attack() again it won't work
				if(usr.inshikai)                                                //if the user is using shikai
					var/damage = round(usr.strength/1.5)
					damage+=rand(damage/2,damage/1.5)
					damage+=usr.swordD
					if(usr.stype == "Wind"&&usr.inshikai&&usr.bankai)
						if(usr.reiryoku <= 450)
							outputMessage(usr,"<b>Your mana is too low!","gametext")
							return
						else
							flick("attack",usr)
							usr.reiryoku -= 450
							new/obj/elec(locate(usr.x+1,usr.y,usr.z))
							new/obj/elec(locate(usr.x+1,usr.y-1,usr.z))
							new/obj/elec(locate(usr.x+1,usr.y+1,usr.z))
							new/obj/elec(locate(usr.x-1,usr.y-1,usr.z))
							new/obj/elec(locate(usr.x-1,usr.y,usr.z))
							new/obj/elec(locate(usr.x-1,usr.y+1,usr.z))
							new/obj/elec(locate(usr.x,usr.y-1,usr.z))
							new/obj/elec(locate(usr.x,usr.y+1,usr.z))
							new/obj/elec(locate(usr.x,usr.y,usr.z))
							for(var/mob/G in oview(1))
								damage = round(usr.strength/2.25)
								damage+=rand(damage/2,damage/1.5)
								damage+=usr.swordD
								if(damage <= 1)
									damage = 1
								damage -= G.defence / 2
								G.health -= damage
								view(usr,8) << output("<b><font color = red>[usr] attacked [G] for [damage] damage!","gametext")
								G.Death(usr)
							sleep(12)
							usr.canattack = 1
							return
					if(usr.stype == "Kira")
						flick("attack",usr)
						for(var/mob/J in oview(1))
							damage = round(usr.strength/1.5)
							damage+=rand(damage/2,damage/1.5)
							damage+=usr.swordD
							if(damage <= 1)
								damage = 1
							damage -= J.defence / 2
							J.health -= damage
							if(usr.kirashi == 1)
								usr.random = rand(1,2)
								if(usr.random == 1)
									J.rundelay += 1
									spawn(70)
										if(J)
											J.rundelay -= 1
											if(J.rundelay <= 0)
												J.rundelay = 0
							if(usr.kirashi == 2)
								usr.random = rand(1,3)
								if(usr.random == 1)
									J.rundelay += 2
									spawn(130)
										if(J)
											J.rundelay -= 2
											if(J.rundelay <= 0)
												J.rundelay = 0
								if(usr.random == 2)
									J.rundelay += 1
									spawn(130)
										if(J)
											J.rundelay -= 1
											if(J.rundelay <= 0)
												J.rundelay = 0
							view(usr,8) << output("<b><font color = red>[usr] attacked [J] for [damage] damage!","gametext")
							J.Death(usr)
						sleep(12)
						usr.canattack = 1
						return
					if(usr.stype == "Ichimaru")
						usr.icon_state = "attack2"
						src.attstyle = "Physical"
						usr.frozen = 1
						var/obj/K = new/obj/(usr.loc)
						K.dir = usr.dir
						K.Gowner = usr
						walk(K,usr.dir)
						if(usr.bankai)
							var/obj/afterImage = new /obj()
							afterImage.layer = MOB_LAYER + 5
							afterImage.icon=usr.icon
							afterImage.icon_state=usr.icon_state
							afterImage.overlays=usr.overlays
							afterImage.underlays = usr.underlays
							afterImage.dir=usr.dir
							afterImage.loc = usr.loc
							afterImage.owner = K
							spawn(7)
								del(afterImage)
						usr.frozen = 0
						return
				if(usr.stype == "Mayuri"&&usr.inbankai)
					if(usr.reiryoku <= 180)
						outputMessage(usr,"<b>Your mana is too low!","gametext")
						return
					else
						var/damage = round(usr.strength/1.5)
						damage+=rand(damage/2,damage/1.5)
						damage+=usr.swordD
						usr.reiryoku -= 180
						spawn(1)
							var/obj/mayuripoison/K = new/obj/mayuripoison(usr.loc)
							step(K,usr.dir)
							for(var/mob/M in K.loc)
								if(damage <= 1)
									damage = 1
								damage -= M.defence / 2
								M.health -= damage
								view(usr,8) << output("<b><font color = red>[usr] attacked [M] for [damage] damage!</font></b>","gametext")
								M.Death(usr)
								usr.random = rand(1,100)
								if(usr.random <= 20)
									view(usr,8) << output("<b><font color = purple>[M] has been paralyzed by the poison!</font></b>", "gametext")
									M.frozen = 1
									spawn(35)
										M.frozen = 0
								if(usr.random > 65)
									view(usr,8) << output("<b><font color = purple>[M] has been slowed by the poison!</font></b>", "gametext")
									M.rundelay += 5
									spawn(35)
										M.rundelay -= 5
							spawn(1)
								del K
								var/obj/mayuripoison/A = new/obj/mayuripoison(usr.loc)
								step(A,usr.dir)
								for(var/mob/M in A.loc)
									damage -= M.defence / 2
									if(damage < 1)
										damage = 1
									M.health -= damage
									view(usr,8) << output("<b><font color = red>[usr] attacked [M] for [damage] damage!","gametext")
									M.Death(usr)
									usr.random = rand(1,100)
									if(usr.random <= 20)
										view(usr,8) << output("<b><font color = purple>[M] has been paralyzed by the poison!</font></b>", "gametext")
										M.frozen = 1
										spawn(35)
											M.frozen = 0
									if(usr.random > 65)
										view(usr,8) << output("<b><font color = purple>[M] has been slowed by the poison!</font></b>", "gametext")
										M.rundelay += 5
										spawn(35)
											M.rundelay -= 5
								spawn(1)
									var/obj/mayuripoison/As = new/obj/mayuripoison(usr.loc)
									step(As,usr.dir)
									step(As,usr.dir)
									var/obj/mayuripoison/W = new/obj/mayuripoison(usr.loc)
									step(W,usr.dir)
									step(W,usr.dir)
									step(W,usr.dir)
									for(var/mob/M in W.loc)
										damage -= M.defence / 2
										damage -= M.defence / 2
										if(damage < 1)
											damage = 1
										M.health -= damage
										view(usr,8) << output("<b><font color = red>[usr] attacked [M] for [damage] damage!","gametext")
										M.Death(usr)
										usr.random = rand(1,100)
										if(usr.random <= 20)
											view(usr,8) << output("<b><font color = purple>[M] has been paralyzed by the poison!</font></b>", "gametext")
											M.frozen = 1
											spawn(35)
												M.frozen = 0
										if(usr.random > 65)
											view(usr,8) << output("<b><font color = purple>[M] has been slowed by the poison!</font></b>", "gametext")
											M.rundelay += 5
											spawn(35)
												M.rundelay -= 5
									spawn(1)
										del A
										del As
										del W
						sleep(6)
						usr.canattack = 1
						return
				if(usr.ikkakushikai)
					usr.icon_state = "attack2"
					usr.frozen = 1
					src.attstyle = "Physical"
					spawn(1)
						var/obj/ikkakus1/K = new/obj/ikkakus1(usr.loc)
						step(K,usr.dir)
						for(var/mob/M in K.loc)
							var/far = M.dir
							step(M,K.dir)
							M.dir = far
							takeDamage(src,M)
						spawn(1)
							del K
							var/obj/ikkakus2/B = new/obj/ikkakus2(usr.loc)
							step(B,usr.dir)
							var/obj/ikkakus1/A = new/obj/ikkakus1(usr.loc)
							step(A,usr.dir)
							step(A,usr.dir)
							for(var/mob/M in A.loc)
								src.attstyle = "Physical"
								takeDamage(src,M)
							usr.frozen = 0
							spawn(1)
								del A
								del B
							usr.icon_state = ""
					sleep(12)
					usr.canattack = 1
					return
				if(!usr.renjishikai&&!usr.ikkakushikai)
					flick("attack",usr)
					for(var/mob/M in get_step(usr,usr.dir))
						var/damage = round(usr.strength/1.5)
						damage+=rand(damage/2,damage/1.5)
						damage+=usr.swordD
						if(usr.inbankai&&usr.stype == "Byakuya"&&usr.senkei)
							src.attstyle = "Reiryoku"
							takeDamage(src,M)
						if(usr.stype == "Yumichika")
							if(usr.inshikai)
								if(usr.bankai)
									src.attstyle = "Mixed"
									takeDamage(src,M)
									if(usr.health >= usr.mhealth)
										usr.health = usr.mhealth
								else
									src.attstyle = "Mixed"
									takeDamage(src,M)
									if(usr.health >= usr.mhealth)
										usr.health = usr.mhealth
						if(usr.stype == "Mayuri")
							if(usr.inshikai)
								usr.random = rand(1,100)
								if(usr.random <= 75&&usr.random > 50)
									M.frozen = 1
									spawn(35)
										M.frozen = 0
								if(usr.random <= 100&&usr.random > 75)
									M.rundelay += 5
									spawn(35)
										M.rundelay -= 5
									takeDamage(src,M)
						if(usr.inbankai)
							if(usr.stype == "Ichigo"||usr.stype == "Isshin")
								src.attstyle = "Physical"
								takeDamage(src,M)
								sleep(3)
								usr.canattack=1
								return
					sleep(12)
					usr.canattack=1
					return
				if(usr.stype == "Renji"&&src.inshikai)
					usr.icon_state = "attack2"
					src.attstyle = "Physical"
					spawn(1)
						var/obj/renji1/K = new/obj/renji1(usr.loc)
						step(K,usr.dir)
						for(var/mob/M in K.loc)
							takeDamage(src,M)
						src.attstyle = "Physical"
						spawn(1)
							del K
							var/obj/renji2/B = new/obj/renji2(usr.loc)
							step(B,usr.dir)
							var/obj/renji1/A = new/obj/renji1(usr.loc)
							step(A,usr.dir)
							step(A,usr.dir)
							for(var/mob/M in A.loc)
								takeDamage(src,M)
							src.attstyle = "Physical"
							spawn(1)
								del A
								var/obj/renji2/As = new/obj/renji2(usr.loc)
								step(As,usr.dir)
								step(As,usr.dir)
								var/obj/renji1/W = new/obj/renji1(usr.loc)
								step(W,usr.dir)
								step(W,usr.dir)
								step(W,usr.dir)
								for(var/mob/M in W.loc)
									takeDamage(src,M)
								spawn(1)
									for(var/mob/M in W.loc)
										src.attstyle = "Physical"
										takeDamage(src,M)
									spawn(1)
										del A
										del As
										var/obj/renji1/Ge = new/obj/renji1(usr.loc)
										step(Ge,usr.dir)
										step(Ge,usr.dir)
										del W
										for(var/mob/M in Ge.loc)
											src.attstyle = "Physical"
											takeDamage(src,M)
										spawn(1)
											del B
											del Ge
											var/obj/renji1/jue = new/obj/renji1(usr.loc)
											step(jue,usr.dir)
											del W
											for(var/mob/M in jue.loc)
												src.attstyle = "Physical"
												takeDamage(src,M)
											spawn(1)
												del jue
					sleep(12)
					usr.icon_state = ""
					usr.canattack = 1
					return
