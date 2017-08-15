extends Node2D


var MaxEnemies = 0
var EnemyScn
var Enemy
var pos1
var pos2


func _ready():
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	pos1 = get_node("Pos/Position")
	pos2 = get_node("Pos/Position1")
	EnemyScn = preload("res://Scenes/Enemy.tscn")
	
	#test = T
	if (Input.is_action_pressed("test") and MaxEnemies <= 0):
		Enemy = EnemyScn.instance()
		Enemy.set_pos(pos1.get_global_pos())
		get_node("Par").add_child(Enemy)
	if (Input.is_action_pressed("test") and MaxEnemies <= 1):
		Enemy = EnemyScn.instance()
		Enemy.set_pos(pos2.get_global_pos())
		get_node("Par").add_child(Enemy)
		MaxEnemies = 2