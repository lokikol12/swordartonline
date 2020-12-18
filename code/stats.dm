
mob/proc/statgainstrb()
	if(src.soulpower < 100)
		if(prob(10))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 30
		if(prob(40))
			src.mstrength += 30
			src.strength += 30
			src.spentpoints += 30
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 1350
			src.health += 1350
			src.spentpoints += 30
		if(prob(40))
			src.mstrength += 70
			src.strength += 70
			src.spentpoints += 70
	if(src.soulpower > 1000)
		if(prob(21))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 50
			src.exp += 2000
		if(prob(40))
			src.mstrength += 80
			src.strength += 80
			src.spentpoints += 80
	if(src.soulpower > 2000)
		if(prob(10))
			src.mhealth += 2050
			src.health += 2050
			src.spentpoints += 50
		if(prob(40))
			src.mstrength += 180
			src.strength += 180
			src.spentpoints += 180
	if(src.soulpower > 5000)
		if(prob(10))
			src.mhealth += 2050
			src.health += 2050
			src.spentpoints += 50
		if(prob(40))
			src.mstrength += 280
			src.strength += 280
			src.spentpoints += 280





mob/proc/statgainst()
	if(src.soulpower < 100)
		if(prob(10))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mstrength += 10
			src.strength += 10
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(11))
			src.mhealth += 750
			src.health += 750
			src.spentpoints += 50
			src.Cor += 5000
		if(prob(40))
			src.mstrength += 40
			src.strength += 40
			src.spentpoints += 40
			src.exp += 800
	if(src.soulpower > 500)
		if(prob(11))
			src.mhealth += 1350
			src.health += 1350
			src.spentpoints += 30
		if(prob(40))
			src.mstrength += 70
			src.strength += 70
			src.spentpoints += 70
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 50
			src.exp += 2000
		if(prob(40))
			src.mstrength += 60
			src.strength += 60
			src.spentpoints += 60
	if(src.soulpower > 2000)
		if(prob(11))
			src.mhealth += 2050
			src.health += 2050
			src.spentpoints += 50
		if(prob(40))
			src.mstrength += 80
			src.strength += 80
			src.spentpoints += 80
	if(src.soulpower > 5000)
		if(prob(11))
			src.mhealth += 2050
			src.health += 2050
			src.spentpoints += 50
		if(prob(40))
			src.mstrength += 180
			src.strength += 180
			src.spentpoints += 180







mob/proc/balencerb()
	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 20
		if(prob(20))
			src.mstrength += 25
			src.strength += 25
			src.spentpoints += 25
		if(prob(10))
			src.mdefence += 25
			src.defence += 25
			src.spentpoints += 25
		if(prob(20))
			src.mreiatsu += 10
			src.reiatsu += 10
			src.spentpoints += 10
		if(prob(15))
			src.mana +=35
			src.mmana += 35
			src.spentpoints += 35
		if(prob(20))
			src.mresistance += 10
			src.resistance += 10
			src.spentpoints += 10
			src.Cor += 500
	if(src.soulpower > 100)
		if(prob(10))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(10))
			src.mstrength += 40
			src.strength += 40
			src.spentpoints += 40
		if(prob(25))
			src.mdefence += 60
			src.defence += 60
			src.spentpoints += 60
		if(prob(20))
			src.mreiatsu += 20
			src.reiatsu += 20
			src.spentpoints += 20
		if(prob(15))
			src.mana += 30
			src.mmana += 30
			src.spentpoints += 30
			src.Cor += 500
		if(prob(10))
			src.mresistance += 40
			src.resistance += 40
			src.spentpoints += 40
			src.exp += 400
	if(src.soulpower > 500)
		if(prob(10))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(10))
			src.mstrength += 50
			src.strength += 50
			src.spentpoints += 50
		if(prob(5))
			src.mdefence += 50
			src.defence += 50
			src.spentpoints += 50
		if(prob(30))
			src.mreiatsu += 50
			src.reiatsu += 50
			src.spentpoints += 50
		if(prob(15))
			src.mana += 50
			src.mmana += 50
			src.spentpoints += 50
		if(prob(20))
			src.mresistance += 50
			src.resistance += 50
			src.spentpoints += 50
			src.exp += 1400
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1750
			src.health += 1750
			src.spentpoints += 40
		if(prob(10))
			src.mstrength += 70
			src.strength += 70
			src.spentpoints += 70
		if(prob(15))
			src.mdefence += 70
			src.defence += 70
			src.spentpoints += 70
		if(prob(20))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
		if(prob(15))
			src.mana +=70
			src.mmana += 70
			src.spentpoints += 70
		if(prob(30))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 2000
	if(src.soulpower > 2000)
		if(prob(10))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
			src.Cor += 5000
			src.exp += 5000
		if(prob(20))
			src.mstrength += 100
			src.strength += 100
			src.spentpoints += 100
		if(prob(5))
			src.mdefence += 100
			src.defence += 100
			src.spentpoints += 100
		if(prob(20))
			src.mreiatsu += 140
			src.reiatsu += 140
			src.spentpoints += 140
		if(prob(15))
			src.mana +=150
			src.mmana += 150
			src.spentpoints += 150
		if(prob(10))
			src.mresistance += 150
			src.resistance += 150
			src.spentpoints += 150
			src.Cor += 5000




mob/proc/balence()
	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 20
		if(prob(10))
			src.mstrength += 10
			src.strength += 10
			src.spentpoints += 10
		if(prob(10))
			src.mdefence += 10
			src.defence += 10
			src.spentpoints += 10
		if(prob(10))
			src.mreiatsu += 10
			src.reiatsu += 10
			src.spentpoints += 10
		if(prob(15))
			src.mana +=10
			src.mmana += 10
			src.spentpoints += 10
		if(prob(10))
			src.mresistance += 10
			src.resistance += 10
			src.spentpoints += 10
			src.Cor += 500
	if(src.soulpower > 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(10))
			src.mstrength += 20
			src.strength += 20
			src.spentpoints += 20
		if(prob(5))
			src.mdefence += 20
			src.defence += 20
			src.spentpoints += 20
		if(prob(10))
			src.mreiatsu += 20
			src.reiatsu += 20
			src.spentpoints += 20
		if(prob(15))
			src.mana += 20
			src.mmana += 20
			src.spentpoints += 20
		if(prob(10))
			src.mresistance += 20
			src.resistance += 20
			src.spentpoints += 20
			src.Cor += 500
			src.exp += 400
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(10))
			src.mstrength += 50
			src.strength += 50
			src.spentpoints += 50
		if(prob(5))
			src.mdefence += 50
			src.defence += 50
			src.spentpoints += 50
		if(prob(10))
			src.mreiatsu += 50
			src.reiatsu += 50
			src.spentpoints += 50
		if(prob(15))
			src.mana += 50
			src.mmana += 50
			src.spentpoints += 50
			src.Cor += 500
		if(prob(10))
			src.mresistance += 50
			src.resistance += 50
			src.spentpoints += 50
			src.exp += 1400
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1750
			src.health += 1750
			src.spentpoints += 40
		if(prob(10))
			src.mstrength += 70
			src.strength += 70
			src.spentpoints += 70
		if(prob(5))
			src.mdefence += 70
			src.defence += 70
			src.spentpoints += 70
		if(prob(10))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
			src.Cor += 500
		if(prob(15))
			src.mana +=70
			src.mmana += 70
			src.spentpoints += 70
		if(prob(10))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 2000
	if(src.soulpower > 2000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
			src.exp += 5000
		if(prob(10))
			src.mstrength += 100
			src.strength += 100
			src.spentpoints += 100
		if(prob(5))
			src.mdefence += 100
			src.defence += 100
			src.spentpoints += 100
		if(prob(10))
			src.mreiatsu += 100
			src.reiatsu += 100
			src.spentpoints += 100
		if(prob(15))
			src.mana +=100
			src.mmana += 100
			src.spentpoints += 100
		if(prob(10))
			src.mresistance += 100
			src.resistance += 100
			src.spentpoints += 100





mob/proc/statgainrei()

	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 20
		if(prob(50))
			src.mreiatsu += 10
			src.reiatsu += 10
			src.spentpoints += 10
		if(prob(15))
			src.mana +=10
			src.mmana += 10
			src.spentpoints += 10
			src.Cor += 500
		if(prob(10))
			src.mresistance += 10
			src.resistance += 10
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(1))
			src.mhealth += 250
			src.health += 250
			src.spentpoints += 5
		if(prob(50))
			src.mreiatsu += 20
			src.reiatsu += 20
			src.spentpoints += 20
		if(prob(15))
			src.mana +=20
			src.mmana += 20
			src.spentpoints += 20
		if(prob(10))
			src.mresistance += 20
			src.resistance += 20
			src.spentpoints += 20
			src.exp += 600
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
			src.Cor += 500
		if(prob(15))
			src.mana +=70
			src.mmana += 70
			src.spentpoints += 70
		if(prob(10))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 1200
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(30))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
			src.exp += 1700
		if(prob(15))
			src.mana +=100
			src.mmana += 100
			src.spentpoints += 10
		if(prob(10))
			src.mresistance += 60
			src.resistance += 60
			src.spentpoints += 60
	if(src.soulpower > 2000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(40))
			src.mreiatsu += 80
			src.reiatsu += 80
			src.spentpoints += 80
			src.Cor += 500
			src.exp += 2000
		if(prob(15))
			src.mana +=80
			src.mmana += 80
			src.spentpoints += 80
		if(prob(10))
			src.mresistance += 80
			src.resistance += 80
			src.spentpoints += 80



mob/proc/statgainreirb()

	if(src.soulpower < 100)
		if(prob(10))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 20
		if(prob(50))
			src.mreiatsu += 20
			src.reiatsu += 20
			src.spentpoints += 20
		if(prob(15))
			src.mana +=20
			src.mmana += 20
			src.spentpoints += 20
		if(prob(20))
			src.mresistance += 10
			src.resistance += 10
			src.Cor += 5000
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(10))
			src.mhealth += 250
			src.health += 250
			src.spentpoints += 5
		if(prob(50))
			src.mreiatsu += 40
			src.reiatsu += 40
			src.spentpoints += 40
		if(prob(15))
			src.mana +=40
			src.mmana += 40
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 40
			src.resistance += 40
			src.spentpoints += 40
			src.Cor += 5000
			src.exp += 600
	if(src.soulpower > 500)
		if(prob(10))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
		if(prob(25))
			src.mana +=70
			src.mmana += 70
			src.spentpoints += 70
		if(prob(30))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 1200
	if(src.soulpower > 1000)
		if(prob(10))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(30))
			src.mreiatsu += 70
			src.reiatsu += 70
			src.spentpoints += 70
			src.Cor += 5000
			src.exp += 1700
		if(prob(15))
			src.mana +=100
			src.mmana += 100
			src.spentpoints += 10
		if(prob(20))
			src.mresistance += 60
			src.resistance += 60
			src.spentpoints += 60
	if(src.soulpower > 2000)
		if(prob(10))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 40
		if(prob(40))
			src.mreiatsu += 180
			src.reiatsu += 180
			src.spentpoints += 180
			src.Cor += 5000
			src.exp += 2000
		if(prob(15))
			src.mana += 180
			src.mmana += 180
			src.spentpoints += 180
		if(prob(20))
			src.mresistance += 180
			src.resistance += 180
			src.spentpoints += 180





mob/proc/defenserb()

	if(src.soulpower < 100)
		if(prob(10))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 15
		if(prob(40))
			src.mdefence += 25
			src.defence += 25
			src.spentpoints += 25
	if(src.soulpower > 100)
		if(prob(10))
			src.mhealth += 1250
			src.health += 1250
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 50
			src.defence += 50
			src.spentpoints += 50
			src.exp += 500
			src.Cor += 500
	if(src.soulpower > 500)
		if(prob(11))
			src.mhealth += 2250
			src.health += 2250
			src.spentpoints += 50
		if(prob(30))
			src.mdefence += 70
			src.defence += 70
			src.spentpoints += 70
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 30
		if(prob(20))
			src.mdefence += 170
			src.defence += 170
			src.spentpoints += 170
			src.exp += 1500
	if(src.soulpower > 2000)
		if(prob(10))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 190
			src.defence += 190
			src.spentpoints += 190
			src.Cor += 500
	if(src.soulpower > 2000)
		if(prob(10))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 490
			src.defence += 490
			src.spentpoints += 490
			src.Cor += 500






mob/proc/defense()

	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mdefence += 10
			src.defence += 10
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(1))
			src.mhealth += 1250
			src.health += 1250
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 50
			src.defence += 50
			src.spentpoints += 50
			src.exp += 500
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 2250
			src.health += 2250
			src.spentpoints += 50
		if(prob(30))
			src.mdefence += 70
			src.defence += 70
			src.spentpoints += 70
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 30
		if(prob(20))
			src.mdefence += 70
			src.defence += 70
			src.spentpoints += 70
			src.exp += 1500
	if(src.soulpower > 2000)
		if(prob(1))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 90
			src.defence += 90
			src.spentpoints += 90
	if(src.soulpower > 5000)
		if(prob(10))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(30))
			src.mdefence += 90
			src.defence += 90
			src.spentpoints += 90
	if(src.soulpower > 10000)
		if(prob(20))
			src.mhealth += 2000
			src.health += 2000
			src.spentpoints += 40
		if(prob(20))
			src.mdefence += 190
			src.defence += 190
			src.spentpoints += 190

mob/proc/resistance()

	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mresistance += 10
			src.resistance += 10
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(1))
			src.mhealth += 1250
			src.health += 1250
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 50
			src.resistance += 50
			src.spentpoints += 50
			src.exp += 500
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 2250
			src.health += 2250
			src.spentpoints += 50
		if(prob(30))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 30
		if(prob(20))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 1500
	if(src.soulpower > 2000)
		if(prob(1))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 90
			src.resistance += 90
			src.spentpoints += 90
	if(src.soulpower > 5000)
		if(prob(10))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(30))
			src.mresistance += 90
			src.resistance += 90
			src.spentpoints += 90
	if(src.soulpower > 10000)
		if(prob(20))
			src.mhealth += 2000
			src.health += 2000
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 190
			src.resistance += 190
			src.spentpoints += 190


mob/proc/resistancerb()

	if(src.soulpower < 100)
		if(prob(1))
			src.mhealth += 500
			src.health += 500
			src.spentpoints += 10
		if(prob(40))
			src.mresistance += 10
			src.resistance += 10
			src.spentpoints += 10
	if(src.soulpower > 100)
		if(prob(1))
			src.mhealth += 1250
			src.health += 1250
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 80
			src.resistance += 80
			src.spentpoints += 80
			src.exp += 500
	if(src.soulpower > 500)
		if(prob(1))
			src.mhealth += 2250
			src.health += 2250
			src.spentpoints += 50
		if(prob(30))
			src.mresistance += 90
			src.resistance += 90
			src.spentpoints += 90
	if(src.soulpower > 1000)
		if(prob(1))
			src.mhealth += 1500
			src.health += 1500
			src.spentpoints += 30
		if(prob(20))
			src.mresistance += 70
			src.resistance += 70
			src.spentpoints += 70
			src.exp += 1500
	if(src.soulpower > 2000)
		if(prob(1))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 190
			src.resistance += 190
			src.spentpoints += 190
	if(src.soulpower > 5000)
		if(prob(10))
			src.mhealth += 1000
			src.health += 1000
			src.spentpoints += 40
		if(prob(30))
			src.mresistance += 290
			src.resistance += 290
			src.spentpoints += 290
	if(src.soulpower > 10000)
		if(prob(20))
			src.mhealth += 2000
			src.health += 2000
			src.spentpoints += 40
		if(prob(20))
			src.mresistance += 390
			src.resistance += 390
			src.spentpoints += 390


mob/verb/focus()
	set category = "Training"
	set name = "Self Train Focus"
	switch(input("How would you like to focus your training?", text) in list ("Resistance","Defense","Strength","Reiatsu","Balenced"))
		if("Strength")
			usr.stattype = "Strength"
		if("Reiatsu")
			usr.stattype = "Reiatsu"
		if("Balenced")
			usr.stattype = "Balenced"
		if("Defense")
			usr.stattype = "Defense"
		if("Resistance")
			usr.stattype = "Resistance"





mob/proc/speedmastery()
	if(src.defaultrundelay < 1)
		src.defaultrundelay = 1
		return
	if(prob(20))
		src.defaultrundelay -= 0.01