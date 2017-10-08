extends Button



func _ready():
	set_process(true)
	
	
func _process(delta):
	if self.is_pressed():
		get_tree().change_scene("res://scenes/World.scn")
