#define EQUIPMENT_PLANE 5
obj
	equipment //create all equipment under this tree.
		plane = EQUIPMENT_PLANE
		var/list/statMods	  // statMods = list(0,0,0,0,0)  -> str, def, rei, res, health
		var/list/verbGains
		var/amount
		var/rarity = 1 // 1 = common(basic clothes), 2=unique, 3=rare, 4=legendary
		var/list/rarityColor = list("black","green","gold","red")
		// deals with items that have different on-grid and wear() offsets.
		//1,2 = gridPos, 3,4 = wearPos
		var/list/itemPos

		var
			worn = 0
		var/canUnequip = 1
		proc/handleStatMods(mob/m,num) // 1 to add and -1 to subtract
			if(!statMods) return
			var/i
			for(i=1, i<=statMods.len, i++)
				switch(i)
					if(1)
						m.strmod += (statMods[i] * num)
						if(m.strmod < m.defaultstrmod) m.strmod = m.defaultstrmod
					if(2)
						m.defmod += (statMods[i] * num)
						if(m.defmod < m.defaultdefmod) m.defmod = m.defaultdefmod
					if(3)
						m.reimod += (statMods[i] * num)
						if(m.reimod < m.defaultreimod) m.reimod = m.defaultreimod
					if(4)
						m.resmod += (statMods[i] * num)
						if(m.resmod < m.defaultresmod) m.resmod = m.defaultresmod
					if(5)
						m.mhealth += (statMods[i] * num)
						m.health = m.mhealth


		verb

			Interact()
				set hidden = 1
				if(!usr.client)return
				usr.client.addToInventory(src)

			Wear()

				if(usr && src.name in usr.client.wearing)
					usr.client.wearing[src.name] = null
					usr.client.wearing -= src.name
					//if(itemPos) pixel_x = itemPos[1];pixel_y=itemPos[2]
					usr.overlays -= src
					handleStatMods(usr, -1)
					if(verbGains) usr.verbs -= verbGains
					if(item_type)usr.client.equipmentSlots -= item_type
					usr.client.updateItemAppearance(src)
					//filters = null

				else

					var/queu = 0
					for(var/x in usr.client.equipmentSlots)
						if(x == item_type)queu++
					if(queu > 2 && !usr.stype == "Ichigo")
						usr.client.addDialogue("Narrator", "Remove your other [item_type] first!")
						return

					usr.client.wearing[src.name] = src
					/*
					if(itemPos)
						pixel_x = itemPos[3];pixel_y=itemPos[4]
						world << "n_x: [pixel_x], new_y:[pixel_y]"
					*/
					usr.overlays += src
					//world << "added [src] to overlays"
					handleStatMods(usr, 1)
					if(verbGains) usr.verbs += verbGains
					usr.client.equipmentSlots += item_type
					usr.client.updateItemAppearance(src)

			Drop()
				loc=null







client
	proc/loadEquipment(list/equipList)

		if(equipList.len <=0)return
		loadingVars["equipment"] = 1
		for(var/x in equipList)
			addToInventory(equipList[x][1])
			equipment[x][2] = equipList[x][2]
			if(equipment[x][1].item_type) equipmentSlots += equipment[x][1].item_type
			if(wearing[equipment[x][1].name])
				mob.overlays += equipment[x][1]
		loadingVars["equipment"] = 0
