var
    seconds = 0
    minutes = 0
    hours = 0

world
    proc/UpdateClock()
        if(seconds == 59)
            seconds = 0
            if(minutes == 59)
                minutes = 0
                hours++
            else
                minutes++
        else
            seconds++

        sleep(10)

    New()
        ..()
        sleep(10) //to account for the first run
        spawn()
            while(src)
                UpdateClock()


