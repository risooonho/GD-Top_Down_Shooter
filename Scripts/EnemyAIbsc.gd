extends Navigation2D

# Member variables
const SPEED = 200.0

var begin = Vector2()
var end = Vector2()
var path = []


func _process(delta):
	if (path.size() > 1):
		var to_walk = delta*SPEED
		while(to_walk > 0 and path.size() >= 2):
			var pfrom = path[path.size() - 1]
			var pto = path[path.size() - 2]
			var d = pfrom.distance_to(pto)
			if (d <= to_walk):
				path.remove(path.size() - 1)
				to_walk -= d
			else:
				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
				to_walk = 0
		
		var atpos = path[path.size() - 1]
		get_node("/root/World/agent").set_pos(atpos)
		
		if (path.size() < 2):
			path = []
			set_process(false)
	else:
		set_process(false)


func _update_path():
	var p = get_simple_path(begin, end, true)
	path = Array(p) # Vector2array too complex to use, convert to regular array
	path.invert()
	
	set_process(true)


func _input(event):
	if (Input.is_action_pressed("test")):
		begin = get_node("/root/World/agent").get_pos()
		# Mouse to local navigation coordinates
		end = get_node("/root/World/player").get_pos()
		_update_path()


func _ready():
	set_process_input(true)
