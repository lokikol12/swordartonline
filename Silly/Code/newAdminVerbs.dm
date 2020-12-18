mob/var/tmp/list/adminOverlays = list()
mob/techniques/verb
	Add_Overlays_Test()
		set category = "Sub"
		var/tmp/list/choices = list("Add")
		if(adminOverlays && adminOverlays.len)
			choices += "Remove"
			if(adminOverlays.len>=2)choices += "Reset"

		var/overlayChoice = input("What would you like to do?", "Overlay Test") as null | anything in choices
		switch(overlayChoice)
			if("Add")
				var/icon/o_icon = input("Choose an icon.","Choose icon") as icon
				if(!o_icon)return
				var/obj/iconOverlay = new
				iconOverlay.layer = FLOAT_LAYER
				iconOverlay.name = "[o_icon]"
				iconOverlay.icon = o_icon
				var/needState = input("Does this icon need a specific icon_state?","icon_state") in list("Yes","No")
				if(needState == "Yes")
					var/stateName = input("Insert the icon_state name","icon_state name")
					iconOverlay.icon_state = stateName
				var/choice = input("Would you like to offset this icon?","Offset?")in list("Yes","No")
				switch(choice)
					if("Yes")
						var/xOffset = input("What is the x_offset?","x_offset")as num
						var/yOffset = input("What is the y_offset?","y_offset")as num
						iconOverlay.pixel_x = xOffset; iconOverlay.pixel_y = yOffset
					if("No")
						iconOverlay.pixel_x = 0; iconOverlay.pixel_y = 0
				usr.overlays += iconOverlay
				adminOverlays += iconOverlay
			if("Remove")
				if(adminOverlays.len>1)
					var/remove = input("Pick an overlay to remove", "Remove Overlay") as null | anything in adminOverlays
					if(!remove)return
					adminOverlays -= remove
					usr.overlays -= remove
					return
				usr.overlays -= adminOverlays
				for(var/x in adminOverlays)
					adminOverlays -= x
			if("Reset")
				usr.overlays -= adminOverlays
				for(var/x in adminOverlays)
					adminOverlays -= x







