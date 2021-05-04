extends Node2D

var Fires
var FiresCount
var passou = false;


func _physics_process(delta):
	Fires = get_tree().get_nodes_in_group("firesGroup")
	FiresCount = Fires.size()
	print (FiresCount)
	if FiresCount == 0:
		get_tree().change_scene("res://Scenes/Victory.tscn")

