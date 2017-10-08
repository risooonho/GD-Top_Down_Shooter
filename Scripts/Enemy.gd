extends KinematicBody2D

var target_R
var force

func _ready():
	force = get_node("Enemy_Sprt").set_pos(Vector2(0, -1))
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	if Input.is_action_pressed("test2"):
		get_node("Enemy_Sprt").look_at(get_node("player").get_pos())
		move(force)
		
	