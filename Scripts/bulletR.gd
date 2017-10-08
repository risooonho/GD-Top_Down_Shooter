extends Area2D

var B_SPEED = 410

var hit = false


func _process(delta):
	translate(Vector2(0, delta*B_SPEED))
	
func _ready():
	set_process(true)
	
func _on_visibility_exit_screen():
	queue_free()
	