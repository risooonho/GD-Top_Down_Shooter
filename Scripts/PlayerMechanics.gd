extends KinematicBody2D

export var MOTION_SPEED = 140
export var SPRINT_SPEED = 60

const MAX_SPEED = 240

var offset 
var relative_mouse_pos 
var RayNode 
var ShotR
var motion

var hasShot = false


#executes on active scene
func _ready():
	set_fixed_process(true)
	
#onready variables 
func _fixed_process(delta):
	motion = Vector2()
	offset = Vector2()
	relative_mouse_pos = Vector2()
	RayNode = get_node("RayCast2D")
		
		
	#crosshair 
	offset = -get_viewport().get_canvas_transform().o * get_node("Camera2D").get_zoom() 
	relative_mouse_pos = get_viewport().get_mouse_pos() * get_node("Camera2D").get_zoom() + offset 
	get_node("Gun").look_at(relative_mouse_pos)
	get_node("/root/World/Crosshair").set_pos(relative_mouse_pos)
		
	#Gun rotation in radians
	ShotR = get_node("Gun").get_rot()
		
		
	#max speed,for stability 
	if (MOTION_SPEED > MAX_SPEED):
		MOTION_SPEED = MAX_SPEED
		
		
	#movement and rotation 
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		RayNode.set_rotd(180)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		RayNode.set_rotd(0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		RayNode.set_rotd(-90)
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		RayNode.set_rotd(90)
	var firing = Input.is_action_pressed("fire")
		
	#sprint 
	if Input.is_action_pressed("sprint"):
	    motion = motion.normalized()*(MOTION_SPEED + SPRINT_SPEED)*delta
	else:
		motion = motion.normalized()*MOTION_SPEED*delta
		
	move(motion)
		
		
	#Shooting here
	if (firing and hasShot == false):
		var shot = preload("res://Scenes/Bullet.tscn").instance()
		shot.set_pos(get_node("Gun/GunPos").get_global_pos())
		#apply the gun rotation to the bullet
		shot.rotate(ShotR)
		get_node("/root/World/BulletPar").add_child(shot)
		
	#shot delay
	#DO NOT CHANGE!!
	hasShot = firing