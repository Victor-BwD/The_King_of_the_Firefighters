extends Area2D


func _on_Fire_body_entered(body):
		if(body.name == "Balde"):
			queue_free()
