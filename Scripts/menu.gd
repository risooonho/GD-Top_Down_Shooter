extends VBoxContainer


#Play button
#Changes main menu to world scene
func _on_play_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
