client
	var/tmp/mob/tempMob
	var/image/dirText
	var/list/trackingMob //list(mob, status, signImage)
	var/list/questMobsTracker
	var/prevTargetAngle
	var/trackingRefreshTime = 5
	var/maxTrackDistance = 3

	proc/mobTrackingLoop()
		if(runningLoops["mobTracking"])return
		runningLoops["mobTracking"] = 1
		var/prevTime = world.timeofday
		var/timeLimit
		var/trackingTimeLimit = 200
		timeLimit = prevTime + trackingTimeLimit

		while(runningLoops["mobTracking"] && world.timeofday < timeLimit)
			if(!runningLoops["mobTracking"])break
			if(!trackingMob || !trackingMob["mob"]) break
			//world << "Loop is running."
			//if(get_dist(src.mob, tempMob) < 1) break
			if(!prevTargetAngle){prevTargetAngle = getAngle(tempMob);updateTrackingDir(tempMob)}
			if(prevTargetAngle != getAngle(tempMob))
				prevTargetAngle = getAngle(tempMob)
				updateTrackingDir(tempMob)

			sleep(trackingRefreshTime)
		runningLoops["mobTracking"] = 0
		stopTrackingMob()
		//world << "Loop has ended."

	proc/stopTrackingMob()
		trackingMob["type"] = null
		if(trackingMob["mob"])
			trackingMob["mob"].filters = null
			trackingMob["mob"] = null
		trackingMob["status"] = 0
		src.images -= trackingMob["image"]

		trackingMob["image"] = null
		questMobsTracker["new"].filters = null
		dirText.maptext = null
		if(runningLoops["mobTracking"]) runningLoops["mobTracking"] = 0

	proc/updateTrackingDir(mob/m)
		if(!m) return
		dirText.maptext = "<text align=center valign=top><span style='-dm-text-outline:1px blue OUTLINE_SHARP;color:white;font-size:2pt;font-weight:bold'>[getAngle(m)]<span>"

	proc/trackMob(mob/mRef,obj/UI/questMobTracker/questMob)
		if(!mRef)return
		if(!questMobsTracker) questMobsTracker = list()
		if(!trackingMob) trackingMob = list()

		if(!dirText)
			dirText = new(null, src.mob)
			dirText.plane = 120
			dirText.pixel_x = 50
			dirText.pixel_y = -70
			images += dirText

		if(trackingMob.len && trackingMob["type"]== mRef)
			stopTrackingMob()
			return

		if(trackingMob["mob"])
			//mobTrackingLoop()
			trackingMob["status"] = 1
			trackingMob["mob"].filters = null
			src.images -= trackingMob["image"]
			trackingMob["image"] = null
			questMobsTracker["old"] = questMobsTracker["new"]

		if(questMobsTracker["old"]) questMobsTracker["old"].filters = null



		var/mob/m
		var/found = 0
		for(m in oview(MOB_TRACK_DISTANCE))
			if(found) continue
			if(m.type == mRef)
				found = 1
				tempMob = m
				trackingMob["mob"] = m
				trackingMob["type"] = m.type
				var/image/trackSign = new(null, m)
				trackSign.plane = 115
				trackSign.maptext_width = 32
				trackSign.maptext_height = 32
				trackSign.maptext_y = 24
				trackSign.maptext = "<text align=center valign=top><span style='-dm-text-outline:1px red OUTLINE_SHARP;color:white;font-size:18pt;font-weight:bold'>!<span>"
				trackingMob["image"] = trackSign
				src.images += trackingMob["image"]
				m.filters = filter(type="outline", size=1, color="yellow")
				questMobsTracker["new"].filters = filter(type="outline", size=1, color="yellow")
				mobTrackingLoop()
				return



