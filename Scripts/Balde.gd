extends RigidBody2D

var picked=false


func _physics_process(delta):
	if picked==true:
		self.position = get_node("../Player/Position2D").global_position
		sleeping = true
		
	else:
		sleeping = false
		
func _input(event):
	if Input.is_action_just_pressed("Pick") and picked ==false:
		var bodies = $pickable_area.get_overlapping_bodies()
		for i in bodies:
			if i.name =="Player" and picked == false:
				picked =true
	else:
		if Input.is_action_just_pressed("Pick") and picked ==true:
			picked = false
