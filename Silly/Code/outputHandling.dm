
client/var/filterMessages = null

/proc/outputMessage(target, msg, channel)

	if(!msg | !target) return
	if(!channel) channel = "gametext"



	switch(target)
		if("say") view(5) << output(msg, channel)
		if("world") world << output(msg, channel)
		else
			target << output(msg, channel)

