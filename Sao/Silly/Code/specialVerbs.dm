


client
	var/list/specialVerbs = list("/die1" = /client/proc/Die)

	proc/callSpecialVerb(v)
		if(!v || !specialVerbs[v])return
		call(specialVerbs[v])(null)

	proc/Die()

		if(usr.race == "Human")
			var/list/choices = list("Yes")
			var/choice = input("Do you want to become a Soul?", "Race change option.") as null | anything in choices
			if(choice){usr.changeRace("Soul"); return}

		usr.health = 0
		usr.Death(usr)

mob
	proc/changeRace(newRace)

		race = newRace
		src << "You are now a [newRace]."
		switch(race)
			if("Soul"){alpha=128;loc = locate(181,22,6)}