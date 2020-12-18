/mob/var/list/itemDrops // list(list(item, probability))

/mob/proc/dropItems()

	if(!itemDrops) return
	var/i
	for(i=1, i<=itemDrops.len, i++)
		var/probChance = itemDrops[i][2]
		if(prob(probChance)) itemDrops[i][1].loc = locate(src.x, src.y, src.z)








