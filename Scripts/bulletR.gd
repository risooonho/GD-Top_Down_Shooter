extends Area2D

var B_SPEED = 300

var hit = false


func _process(delta):
	translate(Vector2(delta*B_SPEED, 0))


func _ready():
	set_process(true)


func _hit_something():
	if (hit):
		return
	hit = true
	set_process(false)
	
func _on_visibility_exit_screen():
	queue_free()
	
func _on_shot_area_enter(area):
	# Hit an enemy or asteroid
	if (area.has_method("destroy")):
		#Hulk typing at it's best
		area.destroy()
		_hit_something()


func _on_shot_body_enter(body):
	# Hit the tilemap
	_hit_something()
	
	
	
	
#var rotation  = self.get_rot()
#var direction = Vector2(sin(rotation), cos(rotation))
#
#var distance_from_me = 100 #need to best adjusted by you
#var spawn_point = self.get_global_pos() + direction * distance_from_me
#
#var bullet = preload("res://Scenes/Bullet.tscn").instance()
#onready var world  = get_node("World").add_child(shot)
#shot.set_pos(spawn_point).get_global_pos())