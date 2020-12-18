
mob
	var
		Party_name = ""
		Party_leader = 0
		Party_co_leader = 0
		Party_member = 0
		Party_rank = ""
		in_Party = 0

var
	list/
		Partys = list()

mob
 verb
  Create_Party()
   set category = "Other"
   if(usr.soulpower >= 10)
				var/list/L
				L = list("font size")
				if(usr.in_Party)
					outputMessage(usr,"<b>You are already in a Party!","gametext")
					return
				switch(alert("Are you sure that you want to create a Party?","","Yes","No"))

					if("Yes")
						goto Create

					if("No")
						return

				Create
					var/new_Party_name = input("What do you want to call your Party?","") as text
					if(!new_Party_name)
						alert("Party Name may not be blank.")
						return
					for(var/X in L)
						if(findtextEx(new_Party_name,X))
							alert("You canno't change your font size!")
							return
					if(length(new_Party_name) > 1000)
						alert("Your Party name is too long!")
						goto Create
					usr.Party_name = new_Party_name
					usr.Party_leader = 1
					usr.Party_rank = "Leader"
					usr.in_Party = 1
    	outputMessage("world","<b><font color = aqua>Party Info: [usr] has created the Party [usr.Party_name]!","gametext")
    	usr.overlays += /obj/gl
    	Partys.Add(usr.Party_name)
					usr.Give_Party_Verbs()
			else
			 outputMessage(usr,"<b>You must be over soulpower 10 to own a Party!","gametext")

mob/Party_Leader
	verb
		Party_Invite()
			set category = "Party"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(!M.in_Party)
						Menu.Add(M)
			var/mob/M = input("Who do you want to invite to the Party?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Do you want to join [usr]'s Party?","","Yes","No"))
					if("Yes")
						M.Party_name = usr.Party_name
						M.Party_member = 1
						M.Party_rank = "Member"
						M.in_Party = 1
						M.Give_Party_Verbs()
      outputMessage("world","<b><font color = aqua>Party Info: [M] has joined the Party [usr.Party_name]!","gametext")
					if("No")
						outputMessage(usr,"[M] has declined your Party Invite","gametext")
						return
		Party_Boot()
			set category = "Party"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_Party)
						if(M.Party_name == usr.Party_name)
							Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Party?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.Party_leader)
					alert("You cannot boot the leader!")
					return
				switch(alert("Are you sure you want to boot [M] from the Party?","","Yes","No"))
					if("Yes")
						outputMessage("world","<b><font color = aqua>Party Info: [usr] has booted [M] from the Party [usr.Party_name]!","gametext")
						M.leaveParty()
						M.Party_name = "None"
						M.Party_leader = 0
						M.Party_co_leader = 0
						M.Party_member = 0
						M.Party_rank = ""
						M.in_Party = 0
					if("No")
						return
		Change_Rank()
			set category = "Party"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_Party)
						if(M.Party_name == usr.Party_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
			 if(M.Party_leader)
			  alert("You cannot change the leader's rank!")
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						M.Party_co_leader = 1
						M.Give_Party_Verbs()
						M.Party_rank = "Co-Leader"
					if("Member")
						M.Party_member = 1
						M.leaveParty()
						M.Give_Party_Verbs()
						M.Party_rank = "Member"
					if("Cancel")
						return
  Custom_Rank()
   set category = "Party"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_Party)
						if(M.Party_name == usr.Party_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank name do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				var/ID=input("What do you want to rename [M]'s rank name to?")as text
		  M.Party_rank=ID
		Party_Announce(T as text)
			set category = "Party"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtextEx(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.Party_name == usr.Party_name)
				 X << "<font size=2><font color = silver><b><center>[usr] would like to announce to the Party:<center><br>[T]"

mob/Party_Verbs
	verb
		Party_Say(T as text)
			set category = "Party"

			var/list/L
			L = list("font size")

			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtextEx(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.Party_name == usr.Party_name)
					X << "<b><font color = yellow>(Party Say)([src.Party_rank])[src.name]: [T]"


		Party_Who()
			set category = "Party"
			var/tmp/C = 0
  	outputMessage(usr,"<font size=1><b><font color=silver><center>---------------------Party WHO------------------------","gametext")
  	for(var/mob/M in world)
				if(M.in_Party)
				 if(M.Party_name == usr.Party_name)
  		 	C += 1
  		  outputMessage(usr,"<font size=1><b><font color=red>[M.name]([M.key])([M.Party_rank])-[M.race]","gametext")
  	outputMessage(usr,"<b><font color = red>[C] Party Members Online!","gametext")
  	outputMessage(usr,"<font size=1><b><font color=silver><center>---------------------Party WHO------------------------","gametext")

		Party_Leave()
			set category = "Party"
			switch(alert("Are you sure you want to leave the Party [src.Party_name]?","","Yes","No"))
				if("Yes")
					src.leaveParty()
					outputMessage("world","<b><font color = aqua>Party Info: [usr] has left the Party [usr.Party_name]!","gametext")
					src.Party_name = ""
					src.Party_leader = 0
					src.Party_co_leader = 0
					src.Party_member = 0
					src.Party_rank = ""
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.in_Party = 0
				if("No")
					return

mob
	proc
		Give_Party_Verbs()
			if(src.Party_leader)
				src.verbs += typesof(/mob/Party_Leader/verb)
				src.verbs += typesof(/mob/Party_Verbs/verb)
			if(src.Party_co_leader)
				src.verbs += typesof(/mob/Party_Leader/verb)
				src.verbs += typesof(/mob/Party_Verbs/verb)
			if(src.Party_member)
				src.verbs += typesof(/mob/Party_Verbs/verb)
	 leaveParty()
			src.verbs -= typesof(/mob/Party_Leader/verb)
			src.verbs -= typesof(/mob/Party_Verbs/verb)
