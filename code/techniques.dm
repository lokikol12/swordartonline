
mob
 var
  tmp/see = 0
client
 Southwest()
  return
 Southeast()
  return
 Northwest()
  return
 Northeast()
  return

obj
 rukiadust
  icon = 'icetrail.dmi'
  New()
   spawn(rand(5,10))
   del src

mob
 var
  tmp/shaking = 0

mob
 var
  notarara = 0

mob
	yamamoto/verb
		JokakuEnjo()
			set name = "Jokaku Enjo"
			set category = "Combat"
			if(usr.reiryoku<100)
				outputMessage(usr,"<b>Your reiatsu is too low!","gametext")
				return
			if(onCD("Jokaku"))
				return
			if(usr.safe)
				return
			if(!usr.jokaku)
				usr.jokaku = 1
				if(!inbankai)
					addCD("Jokaku")
					view(usr,8) << "<b>[usr]: Jokaku Enjo!</b>"
					var/obj/A1 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-4,usr.y+4,usr.z))
					var/obj/A2 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-3,usr.y+4,usr.z))
					var/obj/A3 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-2,usr.y+4,usr.z))
					var/obj/A4 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-1,usr.y+4,usr.z))
					var/obj/A5 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x,usr.y+4,usr.z))
					var/obj/A6 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+1,usr.y+4,usr.z))
					var/obj/A7 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+2,usr.y+4,usr.z))
					var/obj/A8 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+3,usr.y+4,usr.z))
					var/obj/A9 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+4,usr.y+4,usr.z))
					var/obj/A10 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-4,usr.y-4,usr.z))
					var/obj/A11 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-3,usr.y-4,usr.z))
					var/obj/A12 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-2,usr.y-4,usr.z))
					var/obj/A13 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x-1,usr.y-4,usr.z))
					var/obj/A14 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x,usr.y-4,usr.z))
					var/obj/A15 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+1,usr.y-4,usr.z))
					var/obj/A16 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+2,usr.y-4,usr.z))
					var/obj/A17 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+3,usr.y-4,usr.z))
					var/obj/A18 = new/obj/yamamoto/jokakuenjo/TopBottom(locate(usr.x+4,usr.y-4,usr.z))
					var/obj/B1 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y+3,usr.z))
					var/obj/B2 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y+2,usr.z))
					var/obj/B3 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y+1,usr.z))
					var/obj/B4 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y,usr.z))
					var/obj/B5 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y-1,usr.z))
					var/obj/B6 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y-2,usr.z))
					var/obj/B7 = new/obj/yamamoto/jokakuenjo/Left(locate(usr.x-4,usr.y-3,usr.z))
					var/obj/C1 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y+3,usr.z))
					var/obj/C2 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y+2,usr.z))
					var/obj/C3 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y+1,usr.z))
					var/obj/C4 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y,usr.z))
					var/obj/C5 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y-1,usr.z))
					var/obj/C6 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y-2,usr.z))
					var/obj/C7 = new/obj/yamamoto/jokakuenjo/Right(locate(usr.x+4,usr.y-3,usr.z))
					A1.Gowner = usr
					A2.Gowner = usr
					A3.Gowner = usr
					A4.Gowner = usr
					A5.Gowner = usr
					A6.Gowner = usr
					A7.Gowner = usr
					A8.Gowner = usr
					A9.Gowner = usr
					A10.Gowner = usr
					A11.Gowner = usr
					A12.Gowner = usr
					A13.Gowner = usr
					A14.Gowner = usr
					A15.Gowner = usr
					A16.Gowner = usr
					A17.Gowner = usr
					A18.Gowner = usr
					B1.Gowner = usr
					B2.Gowner = usr
					B3.Gowner = usr
					B4.Gowner = usr
					B5.Gowner = usr
					B6.Gowner = usr
					B7.Gowner = usr
					C1.Gowner = usr
					C2.Gowner = usr
					C3.Gowner = usr
					C4.Gowner = usr
					C5.Gowner = usr
					C6.Gowner = usr
					C7.Gowner =  usr
					spawn(100)
						removeCD("Jokaku")
				else
					addCD("Jokaku")
					view(usr,8) << "<b>[usr]: Zanka no Tachi: Jokaku Enjo!</b>"
					var/obj/A1 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-4,usr.y+4,usr.z))
					var/obj/A2 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-3,usr.y+4,usr.z))
					var/obj/A3 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-2,usr.y+4,usr.z))
					var/obj/A4 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-1,usr.y+4,usr.z))
					var/obj/A5 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x,usr.y+4,usr.z))
					var/obj/A6 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+1,usr.y+4,usr.z))
					var/obj/A7 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+2,usr.y+4,usr.z))
					var/obj/A8 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+3,usr.y+4,usr.z))
					var/obj/A9 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+4,usr.y+4,usr.z))
					var/obj/A10 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-4,usr.y-4,usr.z))
					var/obj/A11 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-3,usr.y-4,usr.z))
					var/obj/A12 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-2,usr.y-4,usr.z))
					var/obj/A13 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x-1,usr.y-4,usr.z))
					var/obj/A14 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x,usr.y-4,usr.z))
					var/obj/A15 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+1,usr.y-4,usr.z))
					var/obj/A16 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+2,usr.y-4,usr.z))
					var/obj/A17 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+3,usr.y-4,usr.z))
					var/obj/A18 = new/obj/yamamoto/jokakuenjo/BlackTopBottom(locate(usr.x+4,usr.y-4,usr.z))
					var/obj/B1 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y+3,usr.z))
					var/obj/B2 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y+2,usr.z))
					var/obj/B3 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y+1,usr.z))
					var/obj/B4 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y,usr.z))
					var/obj/B5 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y-1,usr.z))
					var/obj/B6 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y-2,usr.z))
					var/obj/B7 = new/obj/yamamoto/jokakuenjo/BlackLeft(locate(usr.x-4,usr.y-3,usr.z))
					var/obj/C1 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y+3,usr.z))
					var/obj/C2 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y+2,usr.z))
					var/obj/C3 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y+1,usr.z))
					var/obj/C4 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y,usr.z))
					var/obj/C5 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y-1,usr.z))
					var/obj/C6 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y-2,usr.z))
					var/obj/C7 = new/obj/yamamoto/jokakuenjo/BlackRight(locate(usr.x+4,usr.y-3,usr.z))
					A1.Gowner = usr
					A2.Gowner = usr
					A3.Gowner = usr
					A4.Gowner = usr
					A5.Gowner = usr
					A6.Gowner = usr
					A7.Gowner = usr
					A8.Gowner = usr
					A9.Gowner = usr
					A10.Gowner = usr
					A11.Gowner = usr
					A12.Gowner = usr
					A13.Gowner = usr
					A14.Gowner = usr
					A15.Gowner = usr
					A16.Gowner = usr
					A17.Gowner = usr
					A18.Gowner = usr
					B1.Gowner = usr
					B2.Gowner = usr
					B3.Gowner = usr
					B4.Gowner = usr
					B5.Gowner = usr
					B6.Gowner = usr
					B7.Gowner = usr
					C1.Gowner = usr
					C2.Gowner = usr
					C3.Gowner = usr
					C4.Gowner = usr
					C5.Gowner = usr
					C6.Gowner = usr
					C7.Gowner =  usr
					spawn(180)
						removeCD("Jokaku")
				usr.reiryoku -= usr.reiryoku * 0.30
				spawn(150)
				usr.jokaku = 0

		EnnetsuJigoku()
			set name = "Ennetsu Jigoku"
			set category = "Combat"
			var/list/target=new/list()
			for(var/mob/T in view(usr,8))
				if(T!=usr&&!T.ispedal)
					target += T
			if(target.len<1)
				return
			var/mob/M = input("Available targets","Targets") in target
			if(usr.reiryoku<500)
				outputMessage(usr,"<b>Your reiatsu is too low!","gametext")
				return
			if(usr.safe)
				return
			if(onCD("Enne"))
				return
			if(!usr.firing)
				usr.firing = 1
				if(!usr.inbankai)
					addCD("Enne")
					view(usr,8) << "<b>[usr]: Ennetsu Jigoku!</b>"
					var/obj/A1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x-3,M.y+3,M.z))
					var/obj/A2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x-3,M.y+4,M.z))
					var/obj/B1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x-3,M.y-3,M.z))
					var/obj/B2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x-3,M.y-2,M.z))
					var/obj/C1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x+3,M.y+3,M.z))
					var/obj/C2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x+3,M.y+4,M.z))
					var/obj/D1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x+3,M.y-3,M.z))
					var/obj/D2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x+3,M.y-2,M.z))
					var/obj/E1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x-2,M.y,M.z))
					var/obj/E2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x-2,M.y+1,M.z))
					var/obj/F1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x,M.y+2,M.z))
					var/obj/F2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x,M.y+3,M.z))
					var/obj/G1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x+2,M.y,M.z))
					var/obj/G2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x+2,M.y+1,M.z))
					var/obj/H1 = new/obj/yamamoto/ennetsujigoku/Bottom(locate(M.x,M.y-2,M.z))
					var/obj/H2 = new/obj/yamamoto/ennetsujigoku/Top(locate(M.x,M.y-1,M.z))
					A1.Gowner = usr
					A2.Gowner = usr
					B1.Gowner = usr
					B2.Gowner = usr
					C1.Gowner = usr
					C2.Gowner = usr
					D1.Gowner = usr
					D2.Gowner = usr
					E1.Gowner = usr
					E2.Gowner = usr
					F1.Gowner = usr
					F2.Gowner = usr
					G1.Gowner = usr
					G2.Gowner = usr
					H1.Gowner = usr
					H2.Gowner = usr
					spawn(100)
						removeCD("Enne")
				else
					addCD("Enne")
					view(usr,8) << "<b>[usr]: Zanka No Tachi: Ennetsu Jigoku!</b>"
					var/obj/A1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x-3,M.y+3,M.z))
					var/obj/A2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x-3,M.y+4,M.z))
					var/obj/B1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x-3,M.y-3,M.z))
					var/obj/B2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x-3,M.y-2,M.z))
					var/obj/C1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x+3,M.y+3,M.z))
					var/obj/C2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x+3,M.y+4,M.z))
					var/obj/D1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x+3,M.y-3,M.z))
					var/obj/D2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x+3,M.y-2,M.z))
					var/obj/E1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x-2,M.y,M.z))
					var/obj/E2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x-2,M.y+1,M.z))
					var/obj/F1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x,M.y+2,M.z))
					var/obj/F2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x,M.y+3,M.z))
					var/obj/G1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x+2,M.y,M.z))
					var/obj/G2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x+2,M.y+1,M.z))
					var/obj/H1 = new/obj/yamamoto/ennetsujigoku/BlackBottom(locate(M.x,M.y-2,M.z))
					var/obj/H2 = new/obj/yamamoto/ennetsujigoku/BlackTop(locate(M.x,M.y-1,M.z))
					A1.Gowner = usr
					A2.Gowner = usr
					B1.Gowner = usr
					B2.Gowner = usr
					C1.Gowner = usr
					C2.Gowner = usr
					D1.Gowner = usr
					D2.Gowner = usr
					E1.Gowner = usr
					E2.Gowner = usr
					F1.Gowner = usr
					F2.Gowner = usr
					G1.Gowner = usr
					G2.Gowner = usr
					H1.Gowner = usr
					H2.Gowner = usr
					spawn(180)
						removeCD("Enne")
				spawn(50)
				usr.reiryoku -= usr.reiryoku * 0.25
				usr.firing =0

		Taimatsu()
			set name = "Taimatsu"
			set category = "Combat"
			var/list/target=new/list()
			for(var/mob/T in view(usr,8))
				if(T!=usr&&!T.ispedal)
					target += T
			if(target.len<1)
				return
			var/mob/M = input("Available targets","Targets") in target
			if(usr.reiryoku<100)
				outputMessage(usr,"<b>Your reiatsu is too low!","gametext")
				return
			if(usr.safe)
				return
			if(!usr.firing)
				usr.firing = 1
				if(!inbankai)
					view(usr,8) << "<b>[usr]: Taimatsu!</b>"
					M.overlays += new/obj/yamamoto/taimatsu
					view(M,8) << output("[M] is trapped inside [usr]'s Taimatsu and can't move!", "gametext")
					M.frozen = 1
					spawn(20)
						M.overlays -= /obj/yamamoto/taimatsu
						M.frozen = 0
						usr.firing = 0
				else
					view(usr,8) << "<b>[usr]: Zanka no Tachi: Taimatsu!</b>"
					M.overlays += new/obj/yamamoto/taimatsu/Black
					view(M,8) << output("[M] is trapped inside [usr]'s Zanka no Tachi: Taimatsu and can't move!", "gametext")
					M.frozen = 1
					spawn(40)
						M.overlays -= /obj/yamamoto/taimatsu/Black
						M.frozen = 0
						usr.firing = 0

		TenchiKaijin()
			set category = "Combat"
			set name = "Zanka no Tachi: Tenchi Kaijin"
			if(usr.reiryoku<100)
				outputMessage(usr,"<b>Your reiatsu is too low!", "gametext")
				return
			if(usr.safe)
				return
			if(!usr.firing&&usr.inbankai)
				usr.firing = 1
				view(usr,8) << "<b>Zanka no Tachi: Tenchi Kaijin!</b>"
				sleep(10)
				var/obj/A1 = new/obj/yamamoto/tenchikajin/Left
				var/obj/B1 = new/obj/yamamoto/tenchikajin/Middle
				var/obj/B2 = new/obj/yamamoto/tenchikajin/Middle
				var/obj/B3 = new/obj/yamamoto/tenchikajin/Middle
				var/obj/C1 = new/obj/yamamoto/tenchikajin/Right
				if(usr.dir==NORTH||usr.dir==SOUTH)
					A1.loc = locate(usr.x-2,usr.y,usr.z)
					B1.loc = locate(usr.x-1,usr.y,usr.z)
					B2.loc = usr.loc
					B3.loc = locate(usr.x+1,usr.y,usr.z)
					C1.loc = locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==EAST||usr.dir==WEST)
					A1.loc = locate(usr.x,usr.y-2,usr.z)
					B1.loc = locate(usr.x,usr.y-1,usr.z)
					B2.loc = usr.loc
					B3.loc = locate(usr.x,usr.y+1,usr.z)
					C1.loc = locate(usr.x,usr.y+2,usr.z)
				A1.Gowner = usr
				B1.Gowner = usr
				B2.Gowner = usr
				B3.Gowner = usr
				C1.Gowner = usr
				A1.dir = usr.dir
				B1.dir = usr.dir
				B2.dir = usr.dir
				B3.dir = usr.dir
				C1.dir = usr.dir
				walk(A1,usr.dir)
				walk(B1,usr.dir)
				walk(B2,usr.dir)
				walk(B3,usr.dir)
				walk(C1,usr.dir)
				sleep(40)
				usr.firing = 0

obj
 elec
  icon = 'electricity.dmi'
  layer =100
  New()
   spawn(20)
   del src




mob/chad
	verb
		Power_Blast()
			set category = "Combat"
			if(usr.safe)
				outputMessage(usr,"<b>You are in safe zone!","gametext")
				return
			if(!usr.firing)
				usr.firing = 1
				if(usr.dir == NORTH)
					var/obj/power1/A = new /obj/power1/
					var/obj/power2/B = new /obj/power2/
					var/obj/power3/C = new /obj/power3/
					B.loc = locate(usr.x, usr.y-1, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y-2, usr.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(usr.dir == SOUTH)
					var/obj/power1/A = new /obj/power1/
					var/obj/power2/B = new /obj/power2/
					var/obj/power3/C = new /obj/power3/
					B.loc = locate(usr.x, usr.y+1, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y+2, usr.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(usr.dir == WEST)
					var/obj/power1/A = new /obj/power1/
					var/obj/power2/B = new /obj/power2/
					var/obj/power3/C = new /obj/power3/
					B.loc = locate(usr.x+1, usr.y, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x+2, usr.y, usr.z)
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,WEST)
					walk(C,WEST)
					walk(B,WEST)
				if(usr.dir == EAST)
					var/obj/power1/A = new /obj/power1/
					var/obj/power2/B = new /obj/power2/
					var/obj/power3/C = new /obj/power3/
					B.loc = locate(usr.x-1, usr.y, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x-2, usr.y, usr.z)
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,EAST)
					walk(C,EAST)
					walk(B,EAST)
				sleep(10)
				usr.firing = 0

		La_Muerte()
			set category = "Combat"
			if(usr.safe)
				outputMessage(usr,"<b>You are in safe zone!","gametext")
				return
			if(!usr.firing)
				usr.firing = 1
				if(usr.dir == NORTH)
					var/obj/bpower1/A = new /obj/bpower1/
					var/obj/bpower2/B = new /obj/bpower2/
					var/obj/bpower3/C = new /obj/bpower3/
					B.loc = locate(usr.x, usr.y-1, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y-2, usr.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(usr.dir == SOUTH)
					var/obj/bpower1/A = new /obj/bpower1/
					var/obj/bpower2/B = new /obj/bpower2/
					var/obj/bpower3/C = new /obj/bpower3/
					B.loc = locate(usr.x, usr.y+1, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y+2, usr.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(usr.dir == WEST)
					var/obj/bpower1/A = new /obj/bpower1/
					var/obj/bpower2/B = new /obj/bpower2/
					var/obj/bpower3/C = new /obj/bpower3/
					B.loc = locate(usr.x+1, usr.y, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x+2, usr.y, usr.z)
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,WEST)
					walk(C,WEST)
					walk(B,WEST)
				if(usr.dir == EAST)
					var/obj/bpower1/A = new /obj/bpower1/
					var/obj/bpower2/B = new /obj/bpower2/
					var/obj/bpower3/C = new /obj/bpower3/
					B.loc = locate(usr.x-1, usr.y, usr.z)
					A.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x-2, usr.y, usr.z)
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					A.Gowner = usr
					B.Gowner = usr
					C.Gowner = usr
					walk(A,EAST)
					walk(C,EAST)
					walk(B,EAST)
				if(!usr.devil)
					sleep(30)
					usr.firing = 0
				else
					sleep(7)
					usr.firing = 0

		El_Directo()
			set category = "Combat"
			if(usr.safe)
				outputMessage(usr,"<b>You are in safe zone!","gametext")
				return
			if(!usr.firing)
				usr.firing = 1
				var/obj/directo/A = new /obj/directo/
				A.loc = locate(usr.x, usr.y, usr.z)
				A.Gowner = usr
				walk(A,usr.dir)
				sleep(120)
				usr.firing = 0