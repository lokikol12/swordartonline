

mob/proc/unreleasetrueform()
	src.inhom = 0
	rundelay = defaultrundelay
	src.verbs -= /mob/techniques/verb/trutheye
	src.overlays -= 'hm2.dmi'
	src.overlays -= 'hm3.dmi'
	src.strmod -= 4
	src.defmod -= 4
	src.reimod -= 4
	src.resmod -= 4







mob/proc/releaseBlade()
	if(src.armon == 1)
		src.armon = 0
		src.overlays -= 'wings4.dmi'
		src.overlays -= /obj/ulqui3
		src.overlays -= /obj/ulqui4
		src.rundelay = src.defaultrundelay
		src.strmod -= 5
		src.defmod -= 5



mob/proc/releaseHoug()
	src.inhoug = 0
	src.icon = 'azienplayer.dmi'
	src.verbs -= /mob/techniques/verb/KuyoShiban
	src.overlays -= /obj/houg3
	src.rundelay = src.defaultrundelay
	src.overlays -= /obj/houg33
	src.overlays -= 'houg7.dmi'
	src.overlays -= 'houg3.dmi'
	src.overlays -= 'hougwing5.dmi'
	src.overlays -= 'hougwing.dmi'
	src.overlays -= /obj/hougw
	src.overlays -= /obj/hougw2
	src.resmod -= 5
	src.reimod -= 5





mob/proc/swordoff()
	src.swordon = 0
	src.overlays -= 'sword.dmi'