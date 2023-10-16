extends Node2D


var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var gernade_scene: PackedScene = preload("res://scenes/projectiles/gernade.tscn")


func _on_gate_player_entered_gate(body):
	print("player entered the gate!")
	print(body)


func _on_player_laser_shot(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = direction.angle() + (PI / 2)
	laser.direction = direction
	$Projectiles.add_child(laser)
	print("laser from level!")


func _on_player_gernade_thrown(pos, direction):
	var gernade = gernade_scene.instantiate() as RigidBody2D
	gernade.position = pos
	gernade.linear_velocity = direction * gernade.speed
	$Projectiles.add_child(gernade)
	print("gernade from level!")


func _on_house_player_entered():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
