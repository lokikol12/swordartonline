//new shit

proc
	OddNum(number)
		return(number%2) //returns true if it's odd, false if even

var
	list/in_tourny = list()
	list/next_fight = list()
	mob/fighter1
	mob/fighter2
	tround = 1
	reward1 = rand(50000000,150000000)
	reward2 = rand(10000000,75000000)
	tournament = 0
	tourny = 0
	creationtime

mob/var/round = 1

mob/Tournament/verb
	Enter_Tournament()
		set name = "Enter/Leave Tournament"
		set category = "Other"
		if(!in_tourny) in_tourny = list() //create the list if it's null
		if(usr in in_tourny) //if the usr is in in_tourny
			SendToSpawn(usr)
			usr.safe=0
			usr.inevent=0
			in_tourny -= usr //remove them
			outputMessage(usr, "<font color = yellow><b>You have left the tournament.", "gametext")
		else
			if(tournament)
				usr.loc=locate(262,344,5)
				usr.safe=1
				usr.inevent=1
				in_tourny += usr
				usr.round = 1
				outputMessage(usr, "<font color = yellow><b>You have joined the tournament.", "gametext")
			else
				return

mob/admin/verb
	Create_Tournament()
		set name = "Create Tournament"
		set category = "GM"
		if(tournament) //if there's an ongoing tournament
			outputMessage(usr, "<font color = yellow><b>There's already an ongoing tournament.", "gametext")
			return
		reward1 = input("How many souls will the WINNER receive?", "Create Tournament") as null|num //enter a reward for the winner
		if(!reward1) return //if cancelled or 0
		reward2 = input("How many souls will the RUNNER UP receive?", "Create Tournament") as null|num //enter a reward for the runner up
		while(!reward2) //while no reward has been enteyellow, this is skipped if they enter a reward higher than 0
			var/choice = input("The RUNNER UP will not receive a reward, is this correct?", "Create Tournament") in list("Yes", "No") //else ask them if the runner up not having a reward is correct
			if(choice == "Yes") //if use break out of loop
				break
			else //else ask them again
				reward2 = input("How many souls will the RUNNER UP receive?", "Create Tournament") as null|num
		var/delay = input("How long in minutes before the tournament starts?(default 1 min)", "Create Tournament") as num
		if(!delay)
			delay = 50
		else
			delay *= 600
		creationtime = world.time //set the time of creation
		StartTournament(src, creationtime, delay, reward1, reward2)

	Cancel_Tournament()
		set name = "Cancel Tournament"
		set category = "GM"
		if(!tournament) return
		for(var/mob/M in in_tourny)
			SendToSpawn(M)
		ResetDefaults()
		tournament = 0

proc
	StartTournament(_starter, _creationtime, _delay, _reward1, _reward2)
		var/mob/S
		if(tournament) //another check to be sure in case two people try to start one at the same time
			outputMessage(src, "<font color = yellow><b>There's already an ongoing tournament.", "gametext")
			return
		tournament = 1 //set it to ongoing
		if(_starter)
			S = _starter
			outputMessage(world, "<font size=2><font color = yellow><b><center>[S.name] will host a tournament shortly.", "gametext")
		else
			outputMessage(world, "<font size=2><font color = yellow><b><center>A tournament will begin shortly.", "gametext")
		sleep(10)
		outputMessage(world, "<font size=2><font color = yellow><b><center>You have [_delay/600] minutes to enter.", "gametext")
		for(var/mob/M in onlinePlayers) //give all online players the option to join
			M.verbs += /mob/Tournament/verb/Enter_Tournament
		while(world.time < _creationtime+_delay) //while the current time is less than the time of creation + the delay set
			sleep(10) //wait one second and try again
		if(length(in_tourny) > 1) //if there's more than one player in the tournament
			outputMessage(world, "<font size=2><font color = yellow><b><center>[length(in_tourny)] players have joined the tournament.", "gametext")
			sleep(10)
			outputMessage(world, "<font size=2><font color = yellow><b><center>The tournament will now start!", "gametext")
			for(var/mob/B in onlinePlayers)
				B.verbs -= /mob/Tournament/verb/Enter_Tournament
			NextFight()
		else
			outputMessage(world, "<font size=2><font color = yellow><b><center>Tournament has been cancelled. Not enough players have joined.", "gametext")
			for(var/mob/P in onlinePlayers)
				P.verbs -= /mob/Tournament/verb/Enter_Tournament
			for(var/mob/e in in_tourny)
				SendToSpawn(e)
				var/o = e.mexp * 125
				e.exp += o
				e.levelup()
				e.Cor += rand(1000000,20000000)
				e.inevent = 0
				outputMessage(e,"You got 100 levels for joining.","gametext")
				ResetDefaults()
			tournament = 0

	NextFight()
		fighter1 = null
		fighter2 = null
		if(OddNum(length(in_tourny))) //if the amount of players in the tournament is odd
			var/list/anotherlist = list() //create a list
			for(var/mob/M in in_tourny) //for every player in the tournament
				if(M.round == tround) //if their round matches the tournament round
					anotherlist += M //add them to the list
			if(OddNum(length(anotherlist))) //if that list is still an odd number
				var/mob/choice = pick(anotherlist) //pick a player from the list
				outputMessage(world, "<font size=2><font color = yellow><b><center>Due to an odd number of players [choice.name] has automatically advanced to the next round!", "gametext")
				choice.round++ //add one to their round
		if(!next_fight) next_fight = list()
		for(var/mob/M in in_tourny)
			if(M.round == tround) //if the player's round is equal to the current round
				next_fight += M //add them to the list
		if(length(next_fight) < 1) //if there are no players in the current round
			tround++ //it means it's time for the next round
			outputMessage(world, "<font size=2><font color = yellow><b><center>Moving onto round [tround]!", "gametext")
			for(var/mob/M in in_tourny)
				if(length(in_tourny) == 2)
					M.round = tround
					next_fight += M
				else
					if(M.round == tround)
						next_fight += M
		if(length(next_fight) == 1 && length(in_tourny) == 2) //if one person has been selected for the next fight, but the other hasn't
			for(var/mob/M in in_tourny) //run through the available players
				M.round = tround //set everyone's round equal to the current round
				if(!(M in next_fight)) //if they aren't in the next_fight list
					next_fight += M //add them
		if(length(next_fight) > 1)
			fighter1 = pick(next_fight) //pick a player
			fighter2 = pick(next_fight) //pick a player
			while(fighter1 == fighter2) //while a is equal to b in case of picking the same player
				fighter2 = pick(next_fight) //pick B again
				sleep(1)
			outputMessage(world, "<font size=2><font color = yellow><b><center>Next up: [fighter1.name] vs. [fighter2.name].", "gametext")
			sleep(10)
			outputMessage(world, "<font size=2><font color = yellow><b><center>Match starts in 3...", "gametext")
			sleep(10)
			outputMessage(world, "<font size=2><font color = yellow><b><center>Match starts in 2...", "gametext")
			sleep(10)
			outputMessage(world, "<font size=2><font color = yellow><b><center>Match starts in 1...", "gametext")
			sleep(10)
			fighter1.safe = 0
			fighter1.loc = locate(252,331,5)
			fighter2.safe = 0
			fighter2.loc = locate(273,328,5)
			outputMessage(world, "<font size=2><font color = yellow><b><center>FIGHT!", "gametext")
			next_fight = null //clears the list for reuse

	NextRoundLogout(mob/logged, mob/advancing)
		if(length(in_tourny) == 1) //if there's only one guy left after the logout
			outputMessage(world, "<font size=2><font color = yellow><b><center>[logged.name] has logged out. [advancing.name] has won the tournament.", "gametext")
			Payout(logged, advancing)
			SendToSpawn(logged)
			SendToSpawn(advancing)
			ResetDefaults()
			return
		else
			outputMessage(world, "<font size=2><font color = yellow><b><center>[logged.name] has logged out. [advancing.name] will advance to the next round.", "gametext")
			advancing.round++
			SendToSpawn(logged)
			advancing.loc=locate(262,344,5)
			advancing.safe = 1
			NextFight()

	Payout(mob/runnerup, mob/winner)
		if(reward2 && runnerup) //if a runnerup reward has been set and the runnerup exists
			runnerup.Cor += reward2
		if(reward1 && winner)
			winner.Cor += reward1

	ResetDefaults()
		for(var/mob/p in onlinePlayers)
			p.round = 1
			p.verbs -= /mob/Tournament/verb/Enter_Tournament
			in_tourny -= p
		tround = 1
		fighter1 = null
		fighter2 = null
		next_fight = null
		tournament = 0
		creationtime = null
		in_tourny = null

	TournyDeath(mob/loser, mob/winner)
		if(length(in_tourny) == 2) //if there are only 2 people left
			outputMessage(world, "<font size=2><font color = yellow><b><center>[winner.name] has beaten [loser.name] and is the winner of the tournament!", "gametext")
			outputMessage(world, "<font size=2><font color = yellow><b><center>As the winner [winner.name] will receive [reward1] Cor.", "gametext")
			if(reward2)
				outputMessage(world, "<font size=2><font color = yellow><b><center>As the runner up [loser.name] will receive [reward2] Cor.", "gametext")
			SendToSpawn(winner)
			SendToSpawn(loser)
			Payout(loser, winner)
			var/o = winner.mexp * 550
			var/l = loser.mexp *275
			loser.exp += l
			loser.inevent = 0
			winner.inevent = 0
			winner.tounrywins += 1
			winner.exp += o
			loser.levelup()
			winner.levelup()
			winner.health = winner.mhealth
			winner.reiryoku = winner.mreiryoku
			outputMessage(loser,"You got 250 levels for runner up","gametext")
			outputMessage(winner,"You got 500 levels for winner.","gametext")
			ResetDefaults()
		else
			outputMessage(world, "<font size=2><font color = yellow><b><center>[winner.name] has beaten [loser.name] and advances to the next round!", "gametext")
			winner.round++ //add one to the round of the winner
			in_tourny -= loser //removes the loser
			loser.round = 1
			var/y = loser.mexp *90
			var/t = winner.mexp *125
			loser.exp += y
			loser.Cor += rand(100000,5000000)
			loser.inevent = 0
			winner.Cor += rand(100000,5000000)
			outputMessage(loser,"You got 75 levels.","gametext")
			loser.levelup()
			winner.loc=locate(262,344,5)
			winner.safe = 1
			winner.exp += t
			outputMessage(winner,"You got 100 levels.","gametext")
			winner.levelup()
			SendToSpawn(loser)
			NextFight() //continue
		loser.updateHud()
		loser.client.updateOverlays()
		loser.verbs -= /mob/Tournament/verb/Enter_Tournament
		winner.updateHud()

	SendToSpawn(mob/M)
		if(M.soulpower >= 1)
			M.loc = locate(267,344,5)
		else
			M.loc = locate(267,344,5)
		M.safe = 1


mob/Logout()
	if(src in in_tourny)
		in_tourny -= src
		src.round = 1
		if(src == fighter1)
			NextRoundLogout(fighter1, fighter2)
		if(src == fighter2)
			NextRoundLogout(fighter2, fighter1)
	..()

client/Del()
	if(src.mob in in_tourny)
		in_tourny -= src.mob
		src.mob.round = 1
		if(src.mob == fighter1)
			NextRoundLogout(fighter1, fighter2)
		if(src.mob == fighter2)
			NextRoundLogout(fighter2, fighter1)
	..()