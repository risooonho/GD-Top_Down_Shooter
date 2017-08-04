extends Area2D

var B_SPEED = 300

var hit = false


func _process(delta):
	translate(Vector2(delta*B_SPEED, 0))


func _ready():
	set_process(true)


	
func _on_visibility_exit_screen():
	queue_free()
	




	
	
	
