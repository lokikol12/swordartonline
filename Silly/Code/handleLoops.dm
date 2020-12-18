client
	var/list/runningLoops = list("mobTracking"=0)
	proc/addLoop(loop)
		if(runningLoops[loop][2] == 1)return
		runningLoops[loop][2] = 1
		call(runningLoops[loop][1])(null)
		world << "called loop"
