turf
	teleSaocaves

		teletomagicbladecave
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(356,174,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefrommagicebladecave
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(160,381,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return


		teletomagicboss
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(346,60,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefrommagicboss
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(376,49,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return



		teletomagicbladezone2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(350,2,4)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
		telefrommagicbladezone2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(371,174,3)
						usr.safe = 0
					else
						if(istype(A,/obj/))
							return
