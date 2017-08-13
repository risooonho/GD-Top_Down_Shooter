extends KinematicBody2D

var EnSpeed = 200

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	var Move = Vector2()
	var AreaIn = get_node("HitArea").get_overlapping_bodies()
	
	
	if(AreaIn.size() != 0):
		for thing in AreaIn:
			if(thing.is_in_group("player")):
				if(thing.get_global_pos().x < self.get_global_pos().y):
					Move += Vector2(-1,0)
				if(thing.get_global_pos().x > self.get_global_pos().y + 5):
					Move += Vector2(1,0)
				if(thing.get_global_pos().y < self.get_global_pos().y + 5):
					Move += Vector2(0,-1)
				if(thing.get_global_pos().y > self.get_global_pos().y):
					Move += Vector2(0,1)
	
	Move = Move.normalized() * EnSpeed * delta
	Move = move(Move)
	