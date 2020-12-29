client
	script = "<STYLE>BODY {background: black; font-size: 1;color: white}</STYLE>"



world
	fps = 25
	hub = "Kodra777.SwordArtOnline"
	name = "Sword Art Online"
	hub_password = "262626"
	status = "<font size=2><font face=verdana><font color=Red><b>Sword Art Online Beta</b><br /><b>Highest Floor</b>: 15 <br /><b>Cor Gains</b>: 100% <br /><b>Mob exp</b>: 100%</font>"
	view=6


	New()
		..()
		loadranks()
		BanLoad()



	Repop()
		..()
		spawn(50) // wait 5 seconds
		savehouses()

	Reboot()
		savehouses()
		saveranks()
		..()

	Del()
		for(var/mob/M in world)
			del(M.client)
		savehouses()
		saveranks()
		BanSave()
		..()

proc
	BanSave()
		if(length(Bans)||length(IPBans))
			var/savefile/F = new("worldsaves/Bans.sav")
			F["Bans"] << Bans
			F["IPBans"] << IPBans

	BanLoad()
		if(fexists("worldsaves/Bans.sav"))
			var/savefile/load = new("worldsaves/Bans.sav")
			load["Bans"] >> Bans
			load["IPBans"] >> IPBans

	loadranks()
		if(fexists("worldsaves/Ranks.sav"))
			for(var/X in Captains)
				Captains.Remove(X)
			for(var/X in Vaizards)
				Vaizards.Remove(X)
			var/savefile/load = new("worldsaves/Ranks.sav")
			load["Captains"] >> Captains
			load["Vaizards"] >> Vaizards

	saveranks()
		var/savefile/save = new("worldsaves/Ranks.sav")
		save["Captains"] << Captains
		save["Vaizards"] << Vaizards


proc/Capitalize(t)
   if(length(t)==1)return t
   return uppertext(copytext(t,1,2))+copytext(t,2)

var/list/Bans = list()
var/list/IPBans = list()
var/tmp/list/boots = list()
var/private = 0
var/list/tags = list("<font")
var/Banned_Ip_list[0]
var/log = 0
var/list/Captains = list("One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen")
var/list/Espadas = list("Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine")
var/list/Vaizards = list("One","two","Three","Four","Five")
var/list/owners = list("Kodra777","Gokuwarior213")
var/list/Moderator = list("Silver1490","Kodra777","Odle51")
var/list/Admin = list ("Silver1490","Kodra777")
var/list/PlayerNames = list()


mob/proc/Filter(T as text, var/list/L)
	for(var/O in L)
		if(findtextEx(T,O))
			return TRUE
proc
    Comma(num)
        var/cop = 0
        var/cop_text = ""
        var/copi = ""
        if(isnum(num)&&!istext(num)){num=num2text(num,100000000000)}
        if(!istext(num)) return
        if(findtext(num,"."))
            cop = findtext(num,".")
            cop_text = applycommas(copytext(num,cop),"")
            copi = copytext(num,1,cop)
        if(copi == ""){copi=num}
        copi = applycommas(copi,",")
        copi = "[copi][cop_text]"
        return copi

proc/applycommas(number,adder)//apply commas proc witha  number in it xD
    if(isnum(number)){number=num2text(number,1000)}//translates in text so it can read with length.
    if(!adder) adder = ","
    var/digits=length(number)//gets the ammount of digits
    var/remaining=0//how many is remaining var
    var/returnnumber//the return number
    while(digits>=1)//as long as there is 1 or more digits
        if(digits>3)//if its greater than 3{4 or more}
            var/end="[adder]"+copytext(number,digits-2,digits+1)//ends the ending
            var/get=end//makes get the end| i felt like makin an extra var xD
            returnnumber=get+returnnumber//applies it to the return number
            remaining=(length(get)-1)+remaining//sets remaining to how much is remaining
            digits-=3//takes away 3 digits from the digits var
        else//other wise if its less than or equal to three{3 or less}
            var/get=copytext(number,1,(length(number)+1)-remaining)//gets the remaining numbers
            returnnumber=get+returnnumber//applies it to the return number
            digits=0//sets the digits to 0
    return returnnumber//displays the return number to whatever its defined to


mob/proc/spamcheck()
	if(src.spamcheck >= 10)
		return TRUE
	else
		src.spamcheck += 1
		spawn(3)
		src.spamcheck -= 1

proc/ipban(address)
	if(!Banned_Ip_list.Find(address) && address &&address!="localhost" &&address!="127.0.0.1")
		Banned_Ip_list.Add(address)

proc/scan(mob/M in world)
	var/mob/player
	for(player in world)
		if(player.client && player != M)
			return TRUE
			break
		else
			return

mob
	Stat()
		statpanel("Stats")
		if(statpanel("Stats"))
			stat("Class: [race]")
			if(src.status)
				stat("Rank: [status]")
			stat("Floor: [floor]")
			var/h
			var/t
			var/y
			h = applycommas(Cor)
			t = applycommas(round(exp))
			y = applycommas(mexp)

			var/f = defaultrundelay * 50
			stat("-----------------------------------")
			stat("Level: [src.soulpower]")
			stat("Experience: [t]/[y]")

		//	stat("Server Online: [hours]:[minutes]:[seconds]")
			stat("-----------------------------------")
			stat("Health: [applycommas(round(src.health))]/[applycommas(round(src.mhealth))]")
			stat("Reiryoku: [applycommas(round(src.reiryoku))]/[applycommas(round(src.mreiryoku))]")
			stat("Strength: [applycommas(round(src.strength))]([src.strmod]x)")
			stat("Defence: [applycommas(round(src.defence))]([src.defmod]x)")
			stat("Reiatsu: [applycommas(round(src.reiatsu))]([src.reimod]x)")
			stat("Resistance: [applycommas(round(src.resistance))]([src.resmod]x)")
			stat("Speed: [f]")
			stat("-----------------------------------")
			stat("Cor: [h]")
			stat("Tournament Wins: [src.tounrywins]")
			if(src.guild_leader == 1)
				stat("Guild Points: [src.guildpoints]")
			stat("Kills: [kills]")
			stat("Deaths: [deaths]")
			stat("Location: [src.x],[src.y],[src.z]")

		if(src.serverinfo) //variable is set by using the verb Sense_Reiatsu()
			statpanel("Server")  //create statpanel named Sense
			if(statpanel("Server")) //if the player is looking at the Sense tab then..
				if(src)
					stat("-----------------------------------")
					stat("In Tournament")
					for(var/h in in_tourny)
						stat("[h]")
					stat("-----------------------------------")
				/*	stat("Rng")
					for(var/h in next_fight)
						stat("[h]")
					stat("-----------------------------------")*/
					stat("Fighter1: [fighter1]")
					stat("Fighter2: [fighter2]")
					stat("-----------------------------------")
					var/r
					var/d
					var/e
					if(src.doublestatgain == 1)
						e = "200%"
					if(src.doublestatgain == 0)
						e = "100%"
					if(src.doubleexp == 0)
						d = "100%"
					if(src.doubleexp == 1)
						d = "200%"
					if(src.doublecor == 0)
						r = "100%"
					if(src.doublecor == 1)
						r = "200%"
					stat("Exp Event: [d]")
					stat("Cor Event: [r]")
					stat("Stat Event: [e]")
		if(src.sensetab) //variable is set by using the verb Sense_Reiatsu()
			statpanel("Sense")  //create statpanel named Sense
			if(statpanel("Sense")) //if the player is looking at the Sense tab then..
				for(var/mob/M in oview(25)) //Loop code below for every mob within 50 tiles of player
					if(M.client) //Loop code below for every mob within 50 tiles of player
						if(M.z==src.z) //as long as they are on the same map
							var/sensedir = get_dir(src,M) //get direction from a proc
							stat("")
							stat("<b>[dir2text(sensedir)]</b>", M)
							if((M.strength+M.defence+M.reiatsu)/3>(src.mstrength+src.mdefence+src.mreiatsu)/3) //checks the average stat of the mob against that of the player
								stat("They are stronger than you.")
							else
								stat("They are weaker than you.")
							stat("")
							sleep(1)

client
	mouse_pointer_icon = /obj/arrowcursor

obj/arrowcursor
	icon = 'cursor.dmi'
	name = ""
	layer = FLY_LAYER
	mouse_over_pointer = MOUSE_ACTIVE_POINTER


//Bumped proc to see if something is being bumped by a mob
atom
	proc/Bumped(mob/M)

mob
	Bump(atom/movable/O)
		O.Bumped(src)
		..()