extends ColorRect



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_accept'):
		print('key_pressed')
		get_tree().paused = false
		get_tree().reload_current_scene()
