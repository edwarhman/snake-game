extends Node2D
@export var player: Node2D
const PLAYER_SIZE = 8


func _on_bottom_body_entered(body: Node2D) -> void:
	body.position.y = $Top.position.y + PLAYER_SIZE

func _on_top_body_entered(body: Node2D) -> void:
	body.position.y = $Bottom.position.y - PLAYER_SIZE

func _on_right_body_entered(body: Node2D) -> void:
	body.position.x = $Left.position.x + PLAYER_SIZE

func _on_left_body_entered(body: Node2D) -> void:
	body.position.x = $Right.position.x - PLAYER_SIZE
