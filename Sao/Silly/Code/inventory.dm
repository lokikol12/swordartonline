#define INVENTORY_DIMENSIONS list(4,5)
#define INVENTORY_CAPACITY (INVENTORY_DIMENSIONS[1] * INVENTORY_DIMENSIONS[2])
#define INVENTORY_PLANE 105
obj/UI
	Inventory

		icon = 'interface/inventory.dmi'

		title_background
			icon_state = "title"
			pixel_x = 20;pixel_y = 375
			scaleFactor = list(136,12)
			filters = filter(type="outline", size=1, color=rgb(255,255,255,180))
		title
			plane = 102
			maptext = "<span style='color:white;font-size:8pt;font-weight:bold'>Inventory</span>"
			filters = filter(type="outline", size=1, color=rgb(0,0,0,180))
			maptext_width = 208
			maptext_height = 25
			maptext_x = 60
			maptext_y = 375
		background
			icon_state = "background"
			pixel_x = 20;pixel_y = 204
			scaleFactor = list(136,170)
			maptext_width = 208
			maptext_height = 219
			maptext_x = 2
			maptext_y = 2
			filters = filter(type="outline", size=1, color=rgb(255,255,255,180))

		grid
			mouse_opacity = 2
			var/position = 0
			icon_state = "grid"
			pixel_x = -8;pixel_y = 338
			filters = filter(type="outline", size=1, color=rgb(0,0,225,180))


			MouseEntered(location,control,params)
				/*
				for(var/t in usr.client.equipmentNames)
					if(usr.client.equipment[t])
						if(usr.client.equipment[t][3] == position)
							usr.client.displayItemInfo(usr.client.equipment[t][1],pixel_x,pixel_y)
				*/
			MouseExited(location,control,params)
				usr.screen.Hide("QuestItemInformation")

			Click(location, control, params)
				if(usr.client.equipment.len < position) return
				var/list/p  = params2list(params)
				if(p["right"])
					usr.screen.hud["grid[position]"][1].maptext = null
					for(var/t in usr.client.equipmentNames)
						if(usr.client.equipment[t])
							if(usr.client.equipment[t][3] == position)
								usr.client.removeFromInventory(usr.client.equipment[t][1])
								return

				if(p["left"])
					for(var/t in usr.client.equipmentNames)
						if(usr.client.equipment[t])
							if(usr.client.equipment[t][3] == position)
								if(!usr.client.equipment[t][1].canUnequip)
									usr.client.addDialogue("Deity", "You cannot unequip this.")
									return
								usr.client.equipment[t][1].Wear()
							if(usr.client.equipment[t][1].dontKeep)
								usr.client.removeFromInventory(usr.client.equipment[t][1])
								return
							//usr.client.updateItemAppearance(usr.client.equipment[t][1])
							//usr.client.updateMaptext(t)


client/var/list/wearing = list()
client/var/list/inventoryStack = list()

mob/Login()
	..()
	if(!src.client.equipment) src.client.equipment = list()
	src.client.initInventoryGui()


client
	var/list/equipment
	var/list/equipmentNames
	var/list/itemsToStack = list()
	var/list/inventoryAmount
	var/loadingEquipment = 0

	proc/initInventoryGui()
		if(!equipmentNames) equipmentNames = list()

		var/obj/UI/Inventory/title_background/title_background = new
		var/obj/UI/Inventory/title/title = new
		var/obj/UI/Inventory/background/background = new
		src.mob.screen.Add("Inventory", list(title,title_background,background))
		var i
		var xMultiple = 0
		var yMultiple = 0
		var/gridPos = 0
		for(i=1, i<=INVENTORY_CAPACITY, i++)
			gridPos++
			var/obj/UI/Inventory/grid/grid = new
			src.mob.screen.Add("grid[i]",grid)
			if(xMultiple >= INVENTORY_DIMENSIONS[1])
				xMultiple = 0
				yMultiple++
			xMultiple++
			grid.pixel_y -= (32 * yMultiple)
			grid.pixel_x += (32 * xMultiple)
			grid.position = gridPos

	proc/dropItem(obj/equipment/item)
		if(!equipment[item.name]) return
		var/obj/e = new item.type
		e.plane = 1
		e.color = item.color
		e.loc = locate(mob.x,mob.y-1,mob.z)

	proc/addToInventory(obj/equipment/item)

		if(!item) return

		if(equipment.len < INVENTORY_CAPACITY)

			item.loc = null

			if(!equipment[item.name]) equipment[item.name] = list(item, item.amount,0)//third var is position
			equipment[item.name][2]++
			if(!(item.name in equipmentNames)) equipmentNames += item.name


			equipment[item.name][1].plane = INVENTORY_PLANE
			if(!loadingVars["equipment"]) outputMessage(src,"<span style='color:purple;font-size:2;font-weight:bold'>You received [item]!","gametext")
			if(guiToggles["inventory"] == 1)
				var/ePos = equipment.Find(item.name,1,equipment.len+1)

				equipment[item.name][3] = ePos
				src.mob.screen.hud["grid[ePos]"][1].overlays += item
				updateItemAppearance(equipment[item.name][1])


		else
			outputMessage(src,"<span style='color:red;font-size:2;font-weight:bold'>Your inventory is full! You cannot carry any more items.","gametext")
			return



	proc/removeFromInventory(obj/equipment/item,fluff)
		if(!item) return
		if(item.name == "Zanpakuto" && mob.inshikai || mob.inbankai)
			addDialogue("Sketch","No.")
			return
		//if(!item.canDrop)return
		equipmentSlots -= item.item_type
		if(guiToggles["inventory"] == 1)
			if(equipment[item.name][2] > 1)
				equipment[item.name][2]--
				dropItem(item)
				updateItemAppearance(equipment[item.name][1])
				return


		if(wearing[item.name])
			equipment[item.name][1].Wear()

		var/q = equipment.Find(item.name,1,equipment.len+1)

		if(q <= equipment.len)
			var/i
			for(i=q, i<=equipment.len, i++)

				src.mob.screen.hud["grid[i]"][1].overlays = null
				src.mob.screen.hud["grid[i]"][1].maptext = null


		if(equipment[item.name][1].dontKeep || fluff)
			equipment[item.name][1].loc = null
			equipment -= item.name
			populateInventory()
			return

		//equipment[item.name][1].Drop()
		dropItem(item)
		equipment -= item.name

		outputMessage(src,"<span style='color:#FFA500;font-size:2;font-weight:bold'>You dropped [item]!","gametext")
		populateInventory()



	proc/clearInventoryGrid()
		var/i
		for(i=1, i<=equipmentNames.len, i++)
			src.mob.screen.hud["grid[i]"][1].overlays = null
			src.mob.screen.hud["grid[i]"][1].maptext = null

	proc/updateItemAppearance(obj/equipment/item)
		if(!guiToggles["inventory"])return
		if(wearing[item.name])
			src.mob.screen.hud["grid[equipment[item.name][3]]"][1].maptext = "<span style='color:white;font-size:8pt;font-weight:bold'>E</span>"
		else
			src.mob.screen.hud["grid[equipment[item.name][3]]"][1].maptext = "<span style='color:white;font-size:8pt;font-weight:bold'>x[equipment[item.name][2]]</span>"

		src.mob.screen.hud["grid[equipment[item.name][3]]"][1].overlays = null
		src.mob.screen.hud["grid[equipment[item.name][3]]"][1].overlays += equipment[item.name][1]

	proc/populateInventory()

		if(guiToggles["inventory"] == 0)return
		var/i

		for(var/t in equipmentNames)
			for(var/obj/equipment/e in equipment[t])
				i++
				equipment[t][3] = i
				//src.mob.screen.hud["grid[i]"][1].overlays = equipment[t][1]
				//src.mob.screen.hud["grid[i]"][1].overlays += equipment[t][1]
				updateItemAppearance(equipment[t][1])


client

	proc/showInventory(num)

		var i
		switch(num)
			if(0)
				for(i=1, i<=INVENTORY_CAPACITY, i++)
					src.mob.screen.Show("Inventory")
					src.mob.screen.Show("grid[i]")
					guiToggles["inventory"] = 1
				populateInventory()
			if(1)
				for(i=1, i<=INVENTORY_CAPACITY, i++)
					src.mob.screen.Hide("Inventory")
					src.mob.screen.Hide("grid[i]")
					guiToggles["inventory"] = 0




	verb/InventoryMenu()
		set hidden = 1
		showInventory(guiToggles["inventory"])

