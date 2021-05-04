extends Area2D


func _on_fogo_body_entered(body):
	if(body.name == "balde"):
		queue_free()
