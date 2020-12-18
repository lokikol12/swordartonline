#define get_opposite(x) __opposite_dirs[(x)]
#define MOB_AGGRO_DISTANCE 12
#define VIEW_X 24
#define VIEW_Y 20
var
    list/__opposite_dirs = list(2,1,null,8,null,null,null,4)    //used internally to assist with movement input keys

client
    var/tmp
        move_dir = 0
        input_dir = 0


    verb
        MoveKey(key as num,state as num)
            set hidden = 1
            set instant = 1
            . = input_dir==0
            //update the INPUT_DPAD status
            var/opposite = get_opposite(key)
            if(state)
                //if this is a keypress, turn on the key bit
                input_dir |= key
                move_dir |= key
                //turn off the opposite key bit
                if(opposite & input_dir)
                    move_dir &= ~opposite
            else
                //if this is a keyrelease, turn off the key bit
                input_dir &= ~key
                move_dir &= ~key
                //turn on the opposite key bit if it's being held
                if(opposite & input_dir)
                    move_dir |= opposite
            if(.&&input_dir!=0)
                MoveLoop()


client/South()
	triggerNPCAwake()
	..()
client/East()
	triggerNPCAwake()
	..()
client/West()
	triggerNPCAwake()
	..()
client/North()
	triggerNPCAwake()
	..()
client/proc/canMove()
	if(src.mob.frozen)return 0
	return 1

client
	var/movementSpeed = 2
	var/mobAggroDistance = 19

	proc/MoveLoop()
		while(input_dir && canMove())

			if(world.tick_usage > 90) sleep(world.tick_lag)
			if(!move_dir)return

			step(src.mob,move_dir)
			Click()
			triggerNPCAwake()
			sleep(world.tick_lag * movementSpeed)

	proc/triggerNPCAwake()
		for(var/mob/enemy/e in oview(MOB_AGGRO_DISTANCE, src.mob))
			src.Click()
			if(!e.target)
				e.target = src.mob
				e.movementLoop()
client
	show_popup_menus = 0

	proc/getAngle(mob/mRef)
		if(!mRef)return
		return dir2text(get_dir(src.mob, mRef))

var/list/onlinePlayers

mob/Login()
	if(!onlinePlayers) onlinePlayers = list()
	onlinePlayers += src
	src.client.view="[VIEW_X]x[VIEW_Y]"
	..()


client/proc/updateOverlays()

	for(var/x in equipment)
		if(wearing[equipment[x][1].name]) mob.overlays += equipment[x][1]