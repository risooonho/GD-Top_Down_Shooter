extends Node2D

var MaxEnemies = 0

var Enemy
var pos1
var pos2
var pos3
var pos4
var pos5


func _ready():
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	pos1 = get_node("Pos/Position")
	pos2 = get_node("Pos/Position1")
	pos3 = get_node("Pos/Position2")
	pos4 = get_node("Pos/Position3")
	pos5 = get_node("Pos/Position4")
	
	
	if (Input.is_action_pressed("test") and MaxEnemies <= 0):
		var Enemy = preload("res://Scenes/Enemy.tscn").instance()
		Enemy.set_pos(pos1.get_global_pos())
		get_node("EnemyParent").add_child(Enemy)
	if (Input.is_action_pressed("test") and MaxEnemies <= 1):
		var Enemy = preload("res://Scenes/Enemy.tscn").instance()
		Enemy.set_pos(pos2.get_global_pos())
		get_node("EnemyParent").add_child(Enemy)
	if (Input.is_action_pressed("test") and MaxEnemies <= 2):
		var Enemy = preload("res://Scenes/Enemy.tscn").instance()
		Enemy.set_pos(pos3.get_global_pos())
		get_node("EnemyParent").add_child(Enemy)
	if (Input.is_action_pressed("test") and MaxEnemies <= 3):
		var Enemy = preload("res://Scenes/Enemy.tscn").instance()
		Enemy.set_pos(pos4.get_global_pos())
		get_node("EnemyParent").add_child(Enemy)
	if (Input.is_action_pressed("test") and MaxEnemies <= 4):
		var Enemy = preload("res://Scenes/Enemy.tscn").instance()
		Enemy.set_pos(pos5.get_global_pos())
		get_node("EnemyParent").add_child(Enemy)
		MaxEnemies = 5
