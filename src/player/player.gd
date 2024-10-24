extends CharacterBody2DMovement8D
signal bitten
var lastChild: Node2D = self


func _physics_process(delta: float) -> void:
	var direction = get_input_direction().normalized()
	apply_movement(direction)
	updateDirection()


func _on_collectable_body_entered(body: Node2D) -> void:
	var instance: Tail = Tail.create(lastChild)
	instance.toutched.connect(on_bite_body)
	get_parent().add_child(instance)		
	lastChild = instance


func on_bite_body():
	print('body was bitten!')
	bitten.emit()
