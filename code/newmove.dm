mob
	Move()
		if(src.frozen||src.moving||src.npc)
			return
		if(src.client)
			if(src.inshikai||src.inbankai)
				if(src.stype == "Rukia")
					var/K = new/obj/rukiadust(src.loc)
					K:dir = src.dir
			if(src.bankai == 1)
				if(src.stype == "Fire")
					if(src.inshikai == 1)
						var/obj/F = new/obj/techniques/bountofiretrail(src.loc)
						F.dir = src.dir
		src.moving = 1
		if(usr.race == "Inoue")
 		for(var/obj/inoueshield/S in world)
		 	if(S.owner == src)
		 	 S.density = 0
		..()
		if(usr.race == "Inoue"||usr.race == "Shinigami")
	 	for(var/obj/inoueshield/S in world)
	 		if(S.owner == src)
	  		S.loc=locate(src.x,src.y,src.z)
	   	S.density = 0
	   	step(S,src.dir)
	   	S.density = 1
		sleep(src.rundelay)
		src.moving = 0

