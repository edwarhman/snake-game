extends CharacterBody2D
class_name CharacterBody2DMovement8D
@export var SPEED := 240.0

func apply_movement(direction):
	var distance = position / 16 - floor(position / 16)
	if(distance.x < 0.25 and distance.y < 0.25):
		compose([
			block_turn_back,
			keep_moving,
			only_4_directions,
			set_vel
		]).call(direction)
	move_and_slide()
	

func get_input_direction():
	return Input.get_vector('ui_left', 'ui_right', "ui_up", "ui_down")


func updateDirection():
	rotation = velocity.angle() + PI / 2


func set_vel(new_vel: Vector2):
	set_velocity(new_vel * SPEED)


func only_4_directions(direction: Vector2):
	#if direction.x != 0 and direction.y != 0:
	#	direction.x = 0
	var check_dir = abs(direction.normalized())
	if check_dir.x < 1 and check_dir.y < 1:
		return velocity / SPEED
	return direction


func keep_moving(direction):
	if direction:
		return direction
	return velocity / SPEED


func block_turn_back(direction):
	if velocity != direction * SPEED * -1:
		return direction
	return velocity / SPEED


func compose(fns: Array):
	return func(x):
		return fns.reduce(func (prev, next):return next.call(prev), x)
