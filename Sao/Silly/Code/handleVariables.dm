

client/var/list/loadingVars = list()
client/var/list/changedToSystem = list()

client/proc/changeEquipmentSystem()

	if("equipment" in changedToSystem)return
	var/obj/equipment/needsTransfer = locate() in mob.contents
	if(!needsTransfer)return

	for(var/obj/equipment/e in mob.contents)
		addToInventory(e)
		mob.contents -= e

	changedToSystem += "equipment"
	outputMessage(src,"<span style='color:#FFA500;font-size:3;font-weight:bold'>Transferred you over to the new equipment system.</span>","chat")
