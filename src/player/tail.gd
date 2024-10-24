extends CharacterBody2DMovement8D
class_name Tail
signal toutched
const scene: PackedScene = preload("res://src/player/tail.tscn")
var target: Node2D
var previus_position: Vector2


static func create(new_target):
	var new_tail: Tail = scene.instantiate()
	new_tail.target = new_target
	new_tail.position = new_target.position
	return new_tail


func _physics_process(delta: float) -> void:
	if target:
		var distance_to_target = position.distance_to(target.position)
		var direction_to_target = (target.position - position).normalized()
		if abs(direction_to_target).x > 0.15 or abs(direction_to_target).y > 0.15:
			if distance_to_target > 24 and distance_to_target <= 26:
				velocity = direction_to_target * SPEED
			if distance_to_target > 25 and distance_to_target <= 50:
				velocity = direction_to_target * SPEED * 1.1
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != target:
		toutched.emit()
		print(body)
	pass # Replace with function body.
