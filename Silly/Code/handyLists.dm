

var/list/hairstyles = list(
"Messy "='hairichigo.dmi',"Short "='hairichimaru.dmi',
"Stylish "='hairkira.dmi',"Bob "='hairrukia.dmi',
"Long "='hairbyakuya.dmi',"Long with Band"='hairrenji.dmi',
"Spiky "='hairhitsugaya.dmi',"Long2"='hairukitake.dmi',
"Flat"='hairuryuu.dmi',"Cool"='hairsado.dmi',
"Mohawk"='hairzaraki.dmi',"Medium"='hairsoifong.dmi',
"Spiky Top"='hairkariya.dmi',"Righ Sided"='hairnanao.dmi',"Bald"='bald.dmi',
)

world/New()
	loadClothingItems()
	..()

var/list/clothingItemsList

proc/loadClothingItems()

	if(!clothingItemsList) clothingItemsList = list()
	var/list/tempList = typesof(/obj/equipment/common) - /obj/equipment/common
	for(var/t in tempList)
		clothingItemsList += new t