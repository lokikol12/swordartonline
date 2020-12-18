obj
	inouezip
		icon = 'inoueslash.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = (O:reiatsu * 2) + O:mhealth - O:health
				if(damage < 1)
				 damage = 1
				M.health -= damage
				src.loc = M.loc
				view(O,8) << output("<b><font color = red>[O] hit [M] with his Koten Zanshun for [damage] damage!","gametext")
				M.Death(O)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc = T.loc
			if(istype(A,/obj/))
			 var/obj/T = A
				src.loc = T.loc
		Move()
		 var/k = new/obj/inoueziptrail(src.loc)
		 k:dir = src.dir
		 ..()

obj
 inoueziptrail
  icon = 'inoueslash.dmi'
  icon_state = "trail"
  New()
   spawn(30)
   del src

obj
	inoueshield
		icon = 'inoueshield.dmi'
obj
	uraharashield
		icon = 'uraskill.dmi'
		icon_state = "bms"

	inoueheal
		icon = 'inoueheal.dmi'
		layer = 4000
		New()
			..()
			spawn(50)
			del(src)

obj
 ccharge
  icon = 'cerocharge.dmi'
  layer = 100
  New()
   spawn(8)
   del src



obj
 var
  strength
//CHECK
obj
 bpower1
  icon = 'powerstrike2.dmi'
  density = 1
  New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = O.strength * 4.5- M.defence / 2
				if(damage < 1)
				 damage = 1
				M.health -= damage
				view(O,8) << output("<b><font color = red>[O] hit [M] with his La Muerte for [damage] damage!","gametext")
				M.Death(O)
				del src

			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
		 for(var/obj/bpower2/M in world)
		  if(M.owner == src.owner)
		   del M
		 for(var/obj/bpower3/M in world)
		  if(M.owner == src.owner)
		   del M
		 ..()
 bpower2
  icon = 'powerstrike2.dmi'
  icon_state = "1"
 bpower3
  icon = 'powerstrike2.dmi'
  icon_state = "2"
//CHECK
/* NOT COMPLETE
mob
 chad
  verb
   Rage_of_the_Devil()
    usr.underlays += 'sadoaura.dmi'
    usr.underlays += /obj/caura1
    usr.underlays += /obj/caura2
    usr.underlays += /obj/caura3
    usr.underlays += /obj/caura4
    usr.underlays += /obj/caura5
    usr.underlays += /obj/caura6
    usr.underlays += /obj/caura7
    usr.underlays += /obj/caura8*/
mob
 var
  tmp/devilwait = 0

obj
 caura1
  icon = 'sadoaura.dmi'
  icon_state = "bottom left"
  pixel_x = -32
 caura2
  icon = 'sadoaura.dmi'
  icon_state = "middle"
  pixel_y = 32
 caura3
  icon = 'sadoaura.dmi'
  icon_state = "bottom right"
  pixel_x = 32
 caura4
  icon = 'sadoaura.dmi'
  icon_state = "middle left"
  pixel_x = -32
  pixel_y = 32
 caura5
  icon = 'sadoaura.dmi'
  icon_state = "middle right"
  pixel_x = 32
  pixel_y = 32
 caura6
  icon = 'sadoaura.dmi'
  icon_state = "top left"
  pixel_y = 64
  pixel_x = -32
 caura7
  icon = 'sadoaura.dmi'
  icon_state = "top"
  pixel_y = 64
 caura8
  icon = 'sadoaura.dmi'
  icon_state = "top right"
  pixel_y = 64
  pixel_x = 32

obj
	shuriken
		icon = 'shuriken.dmi'
		icon_state = ""
		density = 1
		New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = O.strength / 1.5
				if(damage < 1)
				 damage = 1
				if(M.chadref)
				 var/K = new/obj/reflection(M.loc)
				 K:strength = damage
				 K:dir = M.dir
				 K:Gowner = M
				 walk(K,M.dir)
				 del src
				M.health -= damage
				view(O,8) << output("<b><font color = red>[O] hit [M] with his Shuriken for [damage] damage!","gametext")
				M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	arrow
		icon = 'quincyarrow.dmi'
		icon_state = ""
		density = 1
		New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = round(src.strength / 1.25 - M.reiatsu / 2.5)
				if(damage < 1)
				 damage = 1
				M.health -= damage
				view(O,8) << output("<b><font color = red>[O] hit [M] with his arrow for [damage] damage!","gametext")
				src.loc = M.loc
				M.Death(O)
				spawn(3)
				 if(!M.npc)
				  if(src)
				   var/dirold = M.dir
				   step(M,src.dir)
				   M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Move()
		 new/obj/arrowtrail(src.loc)
		 ..()
obj
 arrowtrail
  icon = 'quincyarrow.dmi'
  icon_state = "trail"
  New()
   spawn(rand(0,10))
   del src


obj
	shinsou
		icon = 'ichimarushikai.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(7)
			del(src)
		Move()
			var/J = 1
			for(var/mob/M in oview(src,6))
				if(src.Gowner == M)
					J = 0
				if(J == 1)
					if(src)
						del src
			..()
			var/obj/shinsotrail/k = new/obj/shinsotrail(src.loc)
			k.dir = src.dir
			k.owner = src

		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner||M.ispedal)
					del(src)
					return
				var/mob/O = src.Gowner
				var/damage = O.strength * 1 - M.defence / 1
				if(damage < 1)
					damage = 1
				if(O.bankai)
					damage = O.strength * 1 - M.defence / 1
				M.health -= damage
				src.loc = M.loc
				M.Death(O)
				view(O,8) << output("<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!","gametext")
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del src
			if(istype(A,/obj/))
				del(src)
		Del()
			for(var/obj/K in world)
				if(K.owner == src)
					del(K)
			for(var/mob/M in world)
				if(M == src.Gowner)
					M.frozen = 0
					M.canattack = 1
					M.icon_state = ""
			..()
obj
 shinsotrail
  layer = 100
  icon = 'ichimarushikai.dmi'
  icon_state = "trail"
obj
 renji1
  icon = 'renjishikaimove.dmi'
  icon_state = "1"
obj
 renji2
  icon = 'renjishikaimove.dmi'
  icon_state = "2"
obj
 ikkakus1
  icon = 'ikkakushikaimove.dmi'
  icon_state = "1"
obj
 mayuripoison
  icon = 'mayuribankaimove.dmi'
obj
	rukiabankaiclothes
		icon = 'rukiabankaiclothes.dmi'
obj
 ikkakus2
  icon = 'ikkakushikaimove.dmi'
  icon_state = "2"
obj
 reflection
  icon = 'sadoreflect.dmi'
  density = 1
  New()
	  spawn(20)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = src.strength / 2
				if(damage < 1)
				 damage = 1
				if(M.chadref)
				 var/K = new/obj/reflection(M.loc)
				 K:strength = damage
				 K:dir = M.dir
				 K:Gowner = M
				 walk(K,M.dir)
				 del src
				M.health -= damage
			 view(O,8) << output("<b><font color = red>[O] hit [M] with his Reflect for [damage] damage!","gametext")
				M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
 power1
  icon = 'powerstrike.dmi'
  density = 1
  New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				var/damage = O.strength * 1.5- M.defence / 2
				if(damage < 1)
				 damage = 1
				if(M.chadref)
				 var/K = new/obj/reflection(M.loc)
				 K:strength = damage
				 K:dir = M.dir
				 K:Gowner = M
				 walk(K,M.dir)
				 del src
				M.health -= damage
				view(O,8) << output("<b><font color = red>[O] hit [M] with his Power Strike for [damage] damage!","gametext")
				M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
		 for(var/obj/power2/M in world)
		  if(M.owner == src.owner)
		   del M
		 for(var/obj/power3/M in world)
		  if(M.owner == src.owner)
		   del M
		 ..()

obj
 directo
  icon = 'eldirecto.dmi'
  density = 1
  New()
	  spawn(100)
	  del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
				 del src
				 return
				if(M.ispedal)
		 	 del src
		 	 return
				var/mob/O = src.Gowner
				O.loc = M.loc
				src.loc = locate(0,0,0)
				M.underlays += 'eldirecto.dmi'
				view(O,8) << "<b>[O]: El Directo!"
				step(M,src.dir)
				step(O,src.dir)
				sleep(1)
				M.moving = 0
				O.moving = 0
				step(M,src.dir)
				sleep(1)
				M.moving = 0
				step(M,src.dir)
				sleep(1)
				M.moving = 0
				O.moving = 0
				step(M,src.dir)
				sleep(1)
				M.moving = 0
				step(M,src.dir)
				M.underlays -= 'eldirecto.dmi'
				var/damage = O.strength * 3.2- M.defence / 2
				if(damage < 1)
				 damage = 1
				M.health -= damage
				view(O,8) << output("<b><font color = red>[O] hit [M] with his El Directo for [damage] damage!","gametext")
				M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
 power2
  icon = 'powerstrike.dmi'
  icon_state = "1"
 power3
  icon = 'powerstrike.dmi'
  icon_state = "2"

/*     Beginning of Yamamoto     */
obj/yamamoto
	icon = 'yamamototechs.dmi' //sets default icon for everything below obj/yamamoto

	fireaura //just gives a boost for now
		yamamotoaura1
			icon_state = "bottomleft"
			pixel_x = -32
		yamamotoaura2
			icon_state = "bottommiddle"
		yamamotoaura3
			icon_state = "bottomright"
			pixel_x = 32
		yamamotoaura4
			icon_state = "middleleft"
			pixel_x = -32
			pixel_y = 32
		yamamotoaura5
			icon_state = "middle"
			pixel_y = 32
		yamamotoaura6
			icon_state = "middleright"
			pixel_x = 32
			pixel_y = 32
		yamamotoaura7
			icon_state = "topleft"
			pixel_y = 64
			pixel_x = -32
		yamamotoaura8
			icon_state = "topmiddle"
			pixel_y = 64
		yamamotoaura9
			icon_state = "topright"
			pixel_y = 64
			pixel_x = 32

	jokakuenjo //fire prison
		density = 1
		Left
			icon_state = "Jokaku Enjo (Fortress Blaze) (Left Side)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*0.75-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)
		BlackLeft
			icon_state = "Black Jokaku Enjo (Fortress Blaze) (Left Side)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*2-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)
		Right
			icon_state = "Jokaku Enjo (Fortress Blaze) (Right Side)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*0.75-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)
		BlackRight
			icon_state = "Black Jokaku Enjo (Fortress Blaze) (Right Side)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*2-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)
		TopBottom
			icon_state = "Jokaku Enjo (Fortress Blaze)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*0.75-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)
		BlackTopBottom
			icon_state = "Black Jokaku Enjo (Fortress Blaze)"
			New()
				spawn(150)
				del src
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*2-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				if(istype(A,/obj/yamamoto/ennetsujigoku/))
					var/obj/O = A
					O.loc = src.loc
					return
				else
					del(src)

	ennetsujigoku //minefield of fire pillars
		density = 1
		Top
			icon_state = "Ennetsu Jigoku (Top)"
			density = 0
			layer = MOB_LAYER+1
			New()
				spawn(40)
				del src
		BlackTop
			icon_state = "Black Ennetsu Jigoku (Top)"
			density = 0
			layer = MOB_LAYER+1
			New()
				spawn(40)
				del src
		Bottom
			icon_state = "Ennetsu Jigoku (Bottom)"
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					M.loc = src.loc
					var/damage = O.reiatsu*3-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				else
					del(src)
			New()
				spawn(40)
				del src
		BlackBottom
			icon_state = "Black Ennetsu Jigoku (Bottom)"
			Bumped(A)
				if(ismob(A))
					var/mob/M = A
					if(M.ispedal)
						del M
						return
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					M.loc = src.loc
					var/damage = O.reiatsu*8-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Ennetsu Jigoku and takes [damage] damage!", "gametext")
					M.Death(O)
					return
				else
					del(src)
			New()
				spawn(40)
				del src

	tenchikajin
		density = 1
		Left
			icon_state = "Black Fire Slash (Left)"
			New()
				spawn(20)
				del(src)
			Bump(A)
				if(ismob(A))
					var/mob/M = A
					if(M.ispedal)
						del(M)
						return
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*15-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Zanka no Tachi: Tenchi Kaijin and takes [damage] damage!", "gametext")
					M.Death(O)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/turf/tele/))
					del(src)
				if(istype(A,/obj/))
					del(src)
		Middle
			icon_state = "Black Fire Slash (Middle)"
			New()
				spawn(20)
				del(src)
			Bump(A)
				if(ismob(A))
					var/mob/M = A
					if(M.ispedal)
						del(M)
						return
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*15-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Zanka no Tachi: Tenchi Kaijin and takes [damage] damage!", "gametext")
					M.Death(O)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/turf/tele/))
					del(src)
				if(istype(A,/obj/))
					del(src)
		Right
			icon_state = "Black Fire Slash (Right)"
			New()
				spawn(20)
				del(src)
			Bump(A)
				if(ismob(A))
					var/mob/M = A
					if(M.ispedal)
						del(M)
						return
					if(M==src.Gowner)
						return
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*15-M.defence/2
					if(damage<1)
						damage = 1
					M.health -= damage
					view(M,8) << output("<b><font color=red>[M] is hit by [O]'s Zanka no Tachi: Tenchi Kaijin and takes [damage] damage!", "gametext")
					M.Death(O)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/turf/tele/))
					del(src)
				if(istype(A,/obj/))
					del(src)

	taimatsu
		icon_state = "Fire Prison"
		layer = MOB_LAYER+1
		Black
			icon_state = "Black Fire Prison"
/*     End of Yamamoto     */