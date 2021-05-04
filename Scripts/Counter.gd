extends NinePatchRect


var tempo = 120
onready var label_tempo = $Label

func _physics_process(delta):
	if(tempo>0):
		tempo -= delta* 1
		label_tempo.text = str(tempo).pad_decimals(0)
	elif(tempo <0):
		#get_tree().reload_current_scene()
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	
	
	



