extends Node2D

var score = 0
@onready var collectable = $Collectable
@onready var spawn_location = $Path/SpawnLocation
@onready var score_label = $Score
@onready var player = $Player
@onready var game_over = $UI/GameOver


func _ready() -> void:
	game_over.hide()


func _on_collectable_collected() -> void:
	change_collectable_position()
	increment_score()


func change_collectable_position():
	#set random position
	spawn_location.progress_ratio = randf()
	collectable.change_position(spawn_location.position)


func increment_score():
	score += 1
	score_label.set_score(score)


func _on_player_bitten() -> void:
	get_tree().paused = true
	game_over.show()
