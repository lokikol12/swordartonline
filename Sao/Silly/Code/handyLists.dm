

var/list/hairstyles = list(
"Ichigo Kurosaki"='hairichigo.dmi',"Ichimaru Gin"='hairichimaru.dmi',
"Kira Azuru"='hairkira.dmi',"Rukia Kuchiki"='hairrukia.dmi',
"Kuchiki Byakuya"='hairbyakuya.dmi',"Renji Abarai"='hairrenji.dmi',
"Hitsugaya Toushiro"='hairhitsugaya.dmi',"Ukitake Jushiro"='hairukitake.dmi',
"Uryuu Ishida"='hairuryuu.dmi',"Sado Yasutora"='hairsado.dmi',
"Zaraki Kenpachi"='hairzaraki.dmi',"Soi Fon"='hairsoifong.dmi',
"Kariya"='hairkariya.dmi',"Nanao Ise"='hairnanao.dmi',"Bald"='bald.dmi',
)

world/New()
	spawn(1)
		loadClothingItems()
		..()

var/list/clothingItemsList

proc/loadClothingItems()

	if(!clothingItemsList) clothingItemsList = list()
	var/list/tempList = typesof(/obj/equipment/common) - /obj/equipment/common
	for(var/t in tempList)
		clothingItemsList += new t