#define MOB_TRACK_DISTANCE 30

mob/var/tmp/obj/screen/screen

client/var/list/guiToggles = list("dialogue"=0, "inventory"=0, "quest"=0)

mob/Login()
	..()
	screen = new(client)

obj/screen
	layer = 100

	var/list/hud
	appearance_flags = PLANE_MASTER
	screen_loc = "1,1"

	New(client/c)
		..()
		if(!c) return
		if(!hud) hud = new
		c.screen+=src

	proc
		Add(id,o)
			if(!hud[id]) hud[id] = list()
			hud[id] += o
		Remove(id)
			if(!hud[id]) return
			Hide(id)
			hud -= id
		Show(id)
			if(!(id in hud)) return
			vis_contents |= hud[id]
		Hide(id)
			if(!(id in hud)) return
			vis_contents -= hud[id]

mob/Del()
	if(screen && screen.hud)
		for(var/t in screen.hud)
			screen.Hide(t)
	..()

client
	proc/displayItemInfo(obj/equipment/itemReference,pX,pY)
		if(!itemReference)return
		if(!itemReference.statMods)return
		//str, def, rei, reir
		var/addText
		addText += {"\
		<text align=left valign=top><span style='-dm-text-outline:1px [itemReference.rarityColor[itemReference.rarity]] OUTLINE_SHARP;color:white;font-size:3pt;font-weight:bold'>\
		[itemReference.name]
		"}
		var/i
		var/list/statColors = list("red","#964b00","purple","blue")
		for(i=1, i<=itemReference.statMods.len, i++)
			var/percentMod = (( (itemReference.statMods[i])*100) - 100)
			if(percentMod < 0) percentMod = 0
			addText += "<span style='-dm-text-outline:1px [statColors[i]] OUTLINE_SHARP'>+[percentMod]%<br></span>"
		src.mob.screen.hud["QuestItemInformation"][1].pixel_x = pX
		src.mob.screen.hud["QuestItemInformation"][2].pixel_x = pX
		src.mob.screen.hud["QuestItemInformation"][1].pixel_y = pY
		src.mob.screen.hud["QuestItemInformation"][2].pixel_y = pY
		src.mob.screen.hud["QuestItemInformation"][2].maptext = addText
		src.mob.screen.Show("QuestItemInformation")



obj/UI
	icon = 'Silly/Interface/UI.dmi'
	plane = 100
	var/counter = 0
	var/list/scaleFactor = null
	var/pos = 0
	var/tab="					"
	New()
		..()
		if(scaleFactor)
			var/icon/i = new(src.icon, icon_state=src.icon_state)
			i.Scale(scaleFactor[1],scaleFactor[2])
			src.icon = i

	dialogue
		icon_state = "dialogue"
		//filters = filter(type="outline", size=1, color="#00FFFF")
		var/list/queu = list()
		var/tmp/num = 0
		var/tmp/dialogueCount = 0
		pixel_y = -72
		New()
			scaleFactor = list((VIEW_X * 32),72)
			maptext_width = VIEW_X * 32
			maptext_height = 72
			..()


	questMobTracker
		var/tmp/clickTrack = 0
		mouse_opacity = 2
		var/mobReference
		New(mRef)
			if(!mRef) del src
			mobReference = mRef

		Click()
			usr.client.trackMob(mobReference, src)

	itemRewards
		var/list/itemReference
		New(obj/equipment/o)
			if(!o)return
			itemReference += o
			appearance = o.appearance
			pixel_x = 348
			pixel_y = 178
			maptext_width = 50
			maptext_height = 32
			plane = 105
			maptext_y = -12
			//maptext = "<text align=middle valign=bottom><span style='color:white;font-size:1px'>[o.name]"

			filters = filter(type="outline", size=1, color="[o.rarityColor[o.rarity]]")

	itemInteraction
		mouse_opacity = 2
		var/itemReference
		scaleFactor = list(36,36)
		plane = 111
		New(item)
			if(!item) del(src)
			itemReference = item

		MouseEntered(location,control,params)
			//usr.client.displayItemInfo(itemReference,itemReference[1].pixel_x,itemReference[1].pixel_y)

		MouseExited(location,control,params)
			usr.screen.Hide("QuestItemInformation")

	itemInformation
		plane = 110
		icon_state = "itemInformation"
		scaleFactor = list(64,80)
		filters = filter(type="outline", size=1, color=rgb(255,255,255,180))
		var/list/textObj
		New()
			if(!textObj) textObj = newlist(/obj/UI/itemInformationText)
			..()

	itemInformationText
		plane = 115
		maptext_x = 2
		maptext_width = 64
		maptext_height = 80
	Quest

		icon = 'interface/quest.dmi'
		progressTracker
			icon = null
			pixel_x = 294;pixel_y = 216
			maptext_width = 208
			maptext_height = 16
			maptext_y = 2
			New()
				maptext = {"<span style='-dm-text-outline: 1px black OUTLINE_SHARP;color:white;font-size:2pt;font-weight:bold'>Progress[tab][tab][tab]Rewards</span>"}

		back
			icon_state = "Placeholder"
			plane = 101
			pixel_x = 100;pixel_y = 450
			//maptext = "<span style='color:white;font-size:12pt;font-weight:bold'>Back</span>"
			maptext_width = 100
			maptext_height = 100
			Click()
				world << "back"

		titleUI
			pixel_x = 280;pixel_y = 375
			scaleFactor = list(208,25)
			icon_state = "questTitle"
			filters = filter(type="outline", size=1, color=rgb(0,50,180,180))

		title
			pixel_x = 280;pixel_y = 375
			maptext = "<span style='-dm-text-outline: 2px #222d OUTLINE_SHARP;color:white;font-size:12pt;font-weight:bold'>Quests</span>"
			maptext_width = 208
			maptext_height = 25
			maptext_y = 2
			New()
				..()
				maptext_x = (maptext_width/2) - maptext_height
				plane++


		background
			icon = 'interface/quest.dmi'
			icon_state = "questBackground"
			pixel_x = 280;pixel_y = 156
			scaleFactor = list(208,219)
			maptext_width = 208
			maptext_height = 219
			maptext_x = 2
			filters = filter(type="outline", size=1, color=rgb(255,255,255,180))
		questInfo
			summary
				//scaleFactor = list(208,219)
				pixel_x = 200;pixel_y = 100
				maptext_width = 208
				maptext_height = 219

		populate
			plane = 101


			foreground
				pixel_x = 282;pixel_y = 339
				scaleFactor = list(204,34)
				icon_state = "questForeground"
				//filters = filter(type="outline", size=1, color=rgb(255,255,255,180))


			desc
				pixel_x = 316;pixel_y = 341
				scaleFactor = list(168,30)
				maptext_width = 168
				maptext_height = 30
				maptext_x = 2
				maptext_y = 1
				icon_state = "questDescription"
				filters = filter(type="outline", size=1, color=rgb(0,0,102,180))

				Click()
					var/q = usr.client.questsList["ongoing"][pos]
					usr.client.expandQuest(q)


			photo
				icon_state = "questFrame"
				plane = 102
				pixel_x = 283;pixel_y = 340
				//filters = filter(type="outline", size=1, color=rgb(255,255,255,180))


