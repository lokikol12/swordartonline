//Gotei 13 squads
mob/Squad_Captain
	verb
		Squad_Boot()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Squad?","Squad [usr.squad]") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.status == "Captain")
					alert("You cannot boot the Captain!")
					return
				switch(alert("Are you sure that you want to boot [M] from Squad [usr.squad]?","","Yes","No"))
					if("Yes")
						outputMessage(world,"<b><font color = yellow>Squad Info: [usr] has booted [M] from Squad [usr.squad]!","gametext")
						M.leavesquad()
					if("No")
						return

		Squad_Promote()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to promote/demote?","[usr.squad]") as null | anything in Menu
			if(!M)
				return
			if(istype(M,/mob))
				switch(input("Do you want to promote or demote [M]?")in list("Promote","Demote","Cancel"))
					if("Promote")
						if(M.status == "Captain")
							outputMessage(usr,"You can't promote the Captain.","gametext")
						else
							M.status = "Lieutenant"
							outputMessage(usr,"You have promoted [M]", "gametext")
							outputMessage(M,"You have been promoted by [usr]", "gametext")
							M.Give_Squad_Verbs()
					if("Demote")
						if(M.status == "Captain")
							outputMessage(usr,"You can't demote the Captain.","gametext")
						if(M.status == "Member")
							outputMessage(usr,"[M] can't be demoted.","gametext")
						else
							M.status = "Member"
							outputMessage(usr,"You have demoted [M]", "gametext")
							outputMessage(M,"You have been demoted by [usr]", "gametext")
							M.Give_Squad_Verbs()
					if("Cancel")
						return

		Squad_Announce(T as text)
			set category = "Squad"
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
				if(X.squad == usr.squad)
					X << "<font size=1><font color = silver><b><center>[usr.status] [usr] would like to announce to the Squad:<center><br>[T]"

mob/Squad_Verbs
	verb
		Squad_Say(T as text)
			set category = "Squad"
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
				if(X.squad == usr.squad)
					X << "<b><font color = yellow>(Squad Say)([src.status])[src.name]: [T]"

		Squad_Who()
			set category = "Squad"
			var/tmp/C = 0
			outputMessage(usr,"<font size=1><b><font color=yellow><center>-Online Squad Members-","gametext")
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					if(M.squad=="Captain"||M.squad=="Lieutenant")
						outputMessage(usr,"<font size=1><b><font color=red>[M.status] [M.name]","gametext")
					else
						outputMessage(usr,"<font size=1><b><font color=red>[M.name]","gametext")
			outputMessage(usr,"<b><font color = red>[C] Squad Members Online!","gametext")

		Squad_Leave()
			set category = "Squad"
			switch(alert("Are you sure about leaving [src.squad]?","","Yes","No"))
				if("Yes")
					outputMessage(world,"<b><font color = yellow>Squad Info: [usr] has left Squad [usr.squad]!","gametext")
					src.leavesquad()
				if("No")
					return

mob
	proc
		Give_Squad_Verbs()
			if(src.status == "Captain"&&src.race == "Shinigami")
				src.race = "Shinigami"
				src.verbs += typesof(/mob/Squad_Captain/verb)
				src.verbs += typesof(/mob/Squad_Verbs/verb)
			if(src.status == "Lieutenant")
				src.verbs += /mob/Squad_Captain/verb/Squad_Boot
				src.verbs += /mob/Squad_Captain/verb/Squad_Announce
				src.verbs += typesof(/mob/Squad_Verbs/verb)
			if(src.status == "Member")
				src.verbs += typesof(/mob/Squad_Verbs/verb)
				src.verbs -= typesof(/mob/Squad_Captain/verb)

		leavesquad()
			if(src.status=="Captain")
				Captains += src.squad
			src.squad = "Ryoka"
			src.status = "Member"
			src.verbs -= typesof(/mob/Squad_Captain/verb)
			if(client.equipment["Captain Suit"]) client.removeFromInventory(client.equipment["Captain Suit"][1],"null")
			if(client.equipment["Captain Suit{Long Sleeve}"]) client.removeFromInventory(client.equipment["Captain Suit{Long Sleeve}"][1],"null")
			src.verbs -= typesof(/mob/Squad_Verbs/verb)

//Espada
mob/Espada_Leader
	verb
		Espada_Boot()
			set category = "Espada"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(M.name!=usr.name&&M.client)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Espada?","Espada") as null | anything in Menu
			if(!M)
				return
			if(M.status == "Zero")
				alert("You cannot boot Espada Zero!")
				return
			switch(alert("Are you sure that you want to boot [M]([M.status]) from the Espada?","","Yes","No"))
				if("Yes")
					outputMessage(world,"<b><font color = yellow>Espada Info: [usr] has booted [M] from the Espada!","gametext")
					M.leaveespada()
				if("No")
					return

		Espada_Announce(T as text)
			set category = "Espada"
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
				if(X.squad == usr.squad)
				 X << "<font size=1><font color = silver><b><center>[usr]([usr.status]) would like to announce to the Espada:<center><br>[T]"

mob/Espada_Verbs
	verb
		Espada_Say(T as text)
			set category = "Espada"
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
				if(X.squad == usr.squad)
					X << "<b><font color = yellow>(Espada Say)[src.name]([src.status]): [T]"

		Espada_Who()
			set category = "Espada"
			var/tmp/C = 0
			outputMessage(usr,"<font size=1><b><font color=yellow><center>-Online Espada Members-","gametext")
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					outputMessage(usr,"<font size=1><b><font color=red>[M.name]([M.status])","gametext")
			outputMessage(usr,"<b><font color = red>[C] Espada Members Online!","gametext")

		Espada_Leave()
			set category = "Espada"
			switch(alert("Are you sure about leaving the Espada?","","Yes","No"))
				if("Yes")
					src.leaveespada()
					outputMessage(world,"<b><font color = yellow>Espada Info: [usr] has left the Espada!","gametext")
				if("No")
					return

mob
	proc
		Give_Espada_Verbs()
			if(src.status == "Zero")
				src.verbs += typesof(/mob/Espada_Leader/verb)
				src.verbs += typesof(/mob/Espada_Verbs/verb)
				src.defmod = 2
				src.strmod = 2
				src.reimod = 2
			if(src.status!="Espada")
				src.defmod = 2
				src.verbs += typesof(/mob/Espada_Verbs/verb)
				src.verbs -= typesof(/mob/Espada_Leader/verb)

	 leaveespada()
			src.verbs -= typesof(/mob/Espada_Leader/verb)
			src.verbs -= typesof(/mob/Espada_Verbs/verb)
			src.squad = "Ryoka"
			src.status = "Member"

//Vaizard
mob/Vaizard_Leader
	verb
		Vaizard_Boot()
			set category = "Vaizard"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(M.name!=usr.name&&M.client)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Vaizard?","Vaizard") as null | anything in Menu
			if(!M)
				return
			if(M.status == "Vaizard Leader")
				alert("You cannot boot Vaizard Leader!")
				return
			switch(alert("Are you sure that you want to boot [M]([M.status]) from the Vaizard?","","Yes","No"))
				if("Yes")
					outputMessage(world,"<b><font color = yellow>Vaizard Info: [usr] has booted [M] from the Vaizard!","gametext")
					M.leaveVaizard()
				if("No")
					return

		Vaizard_Announce(T as text)
			set category = "Vaizard"
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
				if(X.squad == usr.squad)
				 X << "<font size=1><font color = silver><b><center>[usr]([usr.status]) would like to announce to the Vaizard:<center><br>[T]"

mob/Vaizard_Verbs
	verb
		Vaizard_Say(T as text)
			set category = "Vaizard"
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
				if(X.squad == usr.squad)
					X << "<b><font color = yellow>(Vaizard Say)[src.name]([src.status]): [T]"

		Vaizard_Who()
			set category = "Vaizard"
			var/tmp/C = 0
			outputMessage(usr,"<font size=1><b><font color=yellow><center>-Online Vaizard Members-","gametext")
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					outputMessage(usr,"<font size=1><b><font color=red>[M.name]([M.status])","gametext")
			outputMessage(usr,"<b><font color = red>[C] Vaizard Members Online!","gametext")

		Vaizard_Leave()
			set category = "Vaizard"
			switch(alert("Are you sure about leaving the Vaizard?","","Yes","No"))
				if("Yes")
					src.leaveVaizard()
					outputMessage(world,"<b><font color = yellow>Vaizard Info: [usr] has left the Vaizard!","gametext")
				if("No")
					return

mob
	proc
		Give_Vaizard_Verbs()
			if(src.status == "Vaizard Leader")
				src.verbs += typesof(/mob/Vaizard_Leader/verb)
				src.verbs += typesof(/mob/Vaizard_Verbs/verb)
			if(src.status =="Vaizard")
				src.verbs += typesof(/mob/Vaizard_Verbs/verb)
				src.verbs -= typesof(/mob/Vaizard_Leader/verb)

		leaveVaizard()
			src.verbs -= typesof(/mob/Vaizard_Leader/verb)
			src.verbs -= typesof(/mob/Vaizard_Verbs/verb)
			Vaizards -= src.status
			src.squad = "Ryoka"
			src.status = "Member"




mob/Quincy_Emperor
	verb
		Sternritter_Boot()
			set category = "Stern"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(M.name!=usr.name&&M.client)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Quicy Empire?","Sternritter") as null | anything in Menu
			if(!M)
				return
			if(M.status == "Quincy Emperor")
				alert("You cannot boot Emp!")
				return
			switch(alert("Are you sure that you want to boot [M]([M.status]) from the family?","","Yes","No"))
				if("Yes")
					outputMessage(world,"<b><font color = yellow>Stern Info: [usr] has booted [M] from the Empire!","gametext")
					M.leaveVaizard()
				if("No")
					return

		Empire_Announce(T as text)
			set category = "Stern"
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
				if(X.squad == usr.squad)
				 X << "<font size=1><font color = silver><b><center>[usr]([usr.status]) would like to announce to the Empire:<center><br>[T]"

mob/Stern_Verbs
	verb
		Stern_Say(T as text)
			set category = "Stern"
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
				if(X.squad == usr.squad)
					X << "<b><font color = yellow>(Empire Say)[src.name]([src.status]): [T]"

		Stern_Who()
			set category = "Stern"
			var/tmp/C = 0
			outputMessage(usr,"<font size=1><b><font color=yellow><center>-Online Empire Members-","gametext")
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					outputMessage(usr,"<font size=1><b> Empire Members Online!","gametext")

		Stern_Leave()
			set category = "Stern"
			switch(alert("Are you sure about leaving the Empire","","Yes","No"))
				if("Yes")
					src.leaveStern()
					outputMessage(world,"<b><font color = yellow>Stern Info: [usr] has left the Empire!","gametext")
				if("No")
					return

mob
	proc
		Give_Stern_Verbs()
			if(src.status == "Quincy Emperor")
				src.verbs += typesof(/mob/Quincy_Emperor/verb)
				src.verbs += typesof(/mob/Stern_Verbs/verb)
			if(src.status =="Sternritter")
				src.verbs += typesof(/mob/Stern_Verbs/verb)

		leaveStern()
			src.verbs -= typesof(/mob/Quincy_Emperor/verb)
			src.verbs -= typesof(/mob/Stern_Verbs/verb)
			Vaizards += src.status
			src.squad = "Ryoka"
			src.status = "Member"