extends Area2D
signal collected


func _on_body_entered(body: Node2D) -> void:
	collected.emit()


func change_position(new_position):
	position = new_position
