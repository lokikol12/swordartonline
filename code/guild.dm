
mob
	var
		guild_name = ""
		guild_leader = 0
		guild_co_leader = 0
		guild_member = 0
		guild_rank = ""
		in_guild = 0
		statincrease = 0
		membersinguild = 0
var
	list/
		Guilds = list()
		membersinguild =list()
mob
 verb
  Create_Guild()
   set category = "Other"
   if(usr.soulpower >= 10)
				var/list/L
				L = list("font size")
				if(usr.in_guild)
					outputMessage(usr,"<b>You are already in a guild!","gametext")
					return
				switch(alert("Are you sure that you want to create a guild?","","Yes","No"))

					if("Yes")
						goto Create

					if("No")
						return

				Create
					var/new_guild_name = input("What do you want to call your guild?","") as text
					if(!new_guild_name)
						alert("Guild Name may not be blank.")
						return
					for(var/X in L)
						if(findtextEx(new_guild_name,X))
							alert("You canno't change your font size!")
							return
					if(length(new_guild_name) > 1000)
						alert("Your guild name is too long!")
						goto Create
					usr.guild_name = new_guild_name
					usr.guild_leader = 1
					usr.membersinguild = 1
					usr.guild_rank = "Leader"
					usr.in_guild = 1
    	outputMessage("world","<b><font color = aqua>Guild Info: [usr] has created the guild [usr.guild_name]!","gametext")
    	usr.overlays += /obj/gl
    	Guilds.Add(usr.guild_name)
					usr.Give_Guild_Verbs()
			else
			 outputMessage(usr,"<b>You must be over soulpower 10 to own a guild!","gametext")

mob/Guild_Leader
	verb

		Guild_Invite()
			set category = "Guild"
			if(src.membersinguild >= 5)
				return
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(!M.in_guild)
						Menu.Add(M)
			var/mob/M = input("Who do you want to invite to the guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Do you want to join [usr]'s guild?","","Yes","No"))
					if("Yes")
						M.guild_name = usr.guild_name
						M.guild_member = 1
						M.guild_rank = "Member"
						M.in_guild = 1
						src.membersinguild += 1
						M.Give_Guild_Verbs()
						if(statincrease == 1)
							M.traits += "Rebirth1"
							outputMessage(M,"You got the increased stat gains from your guild.","gametext")
      outputMessage("world","<b><font color = aqua>Guild Info: [M] has joined the guild [usr.guild_name]!","gametext")
					if("No")
						outputMessage(usr,"[M] has declined your Guild Invite","gametext")
						return
		Guild_Boot()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("You cannot boot the leader!")
					return
				switch(alert("Are you sure you want to boot [M] from the guild?","","Yes","No"))
					if("Yes")
						outputMessage("world","<b><font color = aqua>Guild Info: [usr] has booted [M] from the guild [usr.guild_name]!","gametext")
						M.leaveguild()
						M.guild_name = "None"
						M.traits -= "Rebirth1"
						M.guild_leader = 0
						M.guild_co_leader = 0
						M.guild_member = 0
						M.guild_rank = ""
						M.in_guild = 0
					if("No")
						return
		Change_Rank()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
			 if(M.guild_leader)
			  alert("You cannot change the leader's rank!")
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						M.guild_co_leader = 1
						M.Give_Guild_Verbs()
						M.guild_rank = "Co-Leader"
					if("Member")
						M.guild_member = 1
						M.leaveguild()
						M.Give_Guild_Verbs()
						M.guild_rank = "Member"
					if("Cancel")
						return
  Custom_Rank()
   set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank name do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				var/ID=input("What do you want to rename [M]'s rank name to?")as text
		  M.guild_rank=ID
		Guild_Announce(T as text)
			set category = "Guild"
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
				if(X.guild_name == usr.guild_name)
				 X << "<font size=2><font color = silver><b><center>[usr] would like to announce to the guild:<center><br>[T]"

mob/Guild_Verbs
	verb
		Guild_Say(T as text)
			set category = "Guild"

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
				if(X.guild_name == usr.guild_name)
					X << "<b><font color = yellow>(Guild Say)([src.guild_rank])[src.name]: [T]"


		Guild_Who()
			set category = "Guild"
			var/tmp/C = 0
  	outputMessage(usr,"<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------","gametext")
  	for(var/mob/M in world)
				if(M.in_guild)
				 if(M.guild_name == usr.guild_name)
  		 	C += 1
  		  outputMessage(usr,"<font size=1><b><font color=red>[M.name]([M.key])([M.guild_rank])-[M.race]","gametext")
  	outputMessage(usr,"<b><font color = red>[C] Guild Members Online!","gametext")
  	outputMessage(usr,"<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------","gametext")

		Guild_Leave()
			set category = "Guild"
			switch(alert("Are you sure you want to leave the Guild [src.guild_name]?","","Yes","No"))
				if("Yes")
					src.leaveguild()
					outputMessage("world","<b><font color = aqua>Guild Info: [usr] has left the guild [usr.guild_name]!","gametext")
					src.guild_name = ""
					src.guild_leader = 0
					src.traits -= "Rebirth1"
					src.guild_co_leader = 0
					src.guild_member = 0
					src.guild_rank = ""
					src.verbs -= /mob/techniques/verb/GuildHouse2
					src.verbs -= /mob/techniques/verb/GuildHouse3
					src.verbs -= /mob/techniques/verb/GuildHouse
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.in_guild = 0
				if("No")
					return

mob
	proc
		Give_Guild_Verbs()
			if(src.guild_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_co_leader)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_member)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
	 leaveguild()
			src.verbs -= typesof(/mob/Guild_Leader/verb)
			src.verbs -= typesof(/mob/Guild_Verbs/verb)
			src.verbs -= /mob/techniques/verb/GuildHouse2
			src.verbs -= /mob/techniques/verb/GuildHouse3
			src.verbs -= /mob/techniques/verb/GuildHouse