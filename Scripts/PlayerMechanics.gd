extends KinematicBody2D

export var MOTION_SPEED = 140
export var SPRINT_SPEED = 60
const MAX_SPEED = 240

var offset 
var relative_mouse_pos 
var RayNode 

var can_shoot = true
var has_shot = false
var alive = true

###############################################################
#var player_global = get_node("Player").get_global_pos()
#var self_global = self.get_global_pos()
#var player_local = player_global - self_global
#Bullet Rotation
#var rotation  = self.get_rot()
#var direction = Vector2(sin(rotation), cos(rotation))
#var distance_from_me = 100 #need to best adjusted by you
#var spawn_point      = self.get_global_pos() + direction * distance_from_me
#var bullet = bullet_scene.instance()
#var wolrd  = self.get_node("../world") #not as a player child plees
#world.add_child(bullet)
#bullet.set_global_pos(spawn_point
#func _ready():
#	set_fixed_process(true)
#	timer = Timer.new()
#	timer.connect("timeout",self,"_on_timer_stop")
##########################################################
func _ready():
	set_fixed_process(true)

#Movement down heaaar
func _fixed_process(delta):
	var motion = Vector2()
	offset = Vector2()
	relative_mouse_pos = Vector2()
	RayNode = get_node("RayCast2D")
	
	
	if (MOTION_SPEED > MAX_SPEED):
		MOTION_SPEED = MAX_SPEED
		
		
	
	#motions down heaaar
	
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
	
	if Input.is_action_pressed("sprint"):
	    motion = motion.normalized()*(MOTION_SPEED + SPRINT_SPEED)*delta
	else:
		motion = motion.normalized()*MOTION_SPEED*delta
	
	move(motion)
	
	
	#Shooting mechs heaaar
	
	
	if (firing and has_shot == false):
		var shot = preload("res://Scenes/Bullet.tscn").instance()
		shot.set_pos(get_node("Gun/GunPos").get_global_pos())
		get_node("/root/World/BulletPar").add_child(shot)
		var shot = preload("res://Scenes/Bullet.tscn").instance()
		shot.set_pos(get_node("Gun/GunPos").get_global_pos())
		get_node("/root/World/BulletPar").add_child(shot)
		
		
		
		
	has_shot = firing
		
		
		
		
	offset = -get_viewport().get_canvas_transform().o * get_node("Camera2D").get_zoom() # Get the offset
	relative_mouse_pos = get_viewport().get_mouse_pos() * get_node("Camera2D").get_zoom() + offset # And add it to the mouse position
		
	get_node("Gun").look_at(relative_mouse_pos)
	get_node("/root/World/Crosshair").set_pos(relative_mouse_pos)
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	


