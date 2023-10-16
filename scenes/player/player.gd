extends CharacterBody2D

signal laser_shot(pos: Vector2, direction: Vector2)
signal gernade_thrown(pos: Vector2, direction: Vector2)

@export var player_speed: int = 700
var can_shoot_laser: bool = true
var can_shoot_gernade: bool = true


func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	var player_direction = (get_global_mouse_position() - self.position).normalized()
	velocity = direction * player_speed
	move_and_slide()
	
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("primary_action") and can_shoot_laser:
		var laser_start_positions: Array = $LaserStartPositions.get_children()
		var start_position: Marker2D = laser_start_positions[randi() % laser_start_positions.size()]
		$GPUParticles2D.emitting = true
		can_shoot_laser = false
		laser_shot.emit(start_position.global_position, player_direction)
		$LaserTimer.start()
	
	if Input.is_action_pressed("secondary_action") and can_shoot_gernade:
		var gernade_start_positions: Array = $GernadeStartPositions.get_children()
		var start_position: Marker2D = gernade_start_positions[randi() % gernade_start_positions.size()]
		can_shoot_gernade = false
		gernade_thrown.emit(start_position.global_position, player_direction)
		$GernadeTimer.start()


func _on_gernade_timer_timeout():
	can_shoot_gernade = true


func _on_laser_timer_timeout():
	can_shoot_laser = true

