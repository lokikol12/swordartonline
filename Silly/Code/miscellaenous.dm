mob/proc/rechargeStats()
	health = mhealth
	reiryoku = mreiryoku
	strength = mstrength
	defence = mdefence
	reiatsu = mreiatsu
	skill()


mob/proc/handleStatMods(list/statMods,num) // 1 to add and -1 to subtract
	if(!statMods) return
	//world << "b_str:[strmod]"
	for(var/x in statMods)

		switch(x)
			if("str")
				if(strmod > defaultstrmod) strmod = defaultstrmod
				strmod += (statMods[x] * num)
				if(strmod < defaultstrmod) strmod = defaultstrmod
			if("def")
				if(defmod > defaultdefmod) defmod = defaultdefmod
				defmod += (statMods[x] * num)
				if(defmod < defaultdefmod) defmod = defaultdefmod
			if("rei")
				if(reimod > defaultreimod) reimod = defaultreimod
				reimod += (statMods[x] * num)
				if(reimod < defaultreimod) reimod = defaultreimod
			if("res")
				if(resmod > defaultresmod) resmod = defaultresmod
				resmod += (statMods[x] * num)
				if(resmod < defaultresmod) resmod = defaultresmod
	//world << "a_str:[strmod]"

mob/proc/updateHair()
	if(hair) overlays -= hair
	var/choice = input("What hair style would you like?", "Choose a hairstyle.") in hairstyles
	if(choice)
		hairstyles[choice] += input("What color would you like?") as color
		hair = hairstyles[choice]
		overlays += hair