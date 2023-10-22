extends LevelParent


func _on_gate_player_entered_gate(_body):
	var tween: Tween = create_tween()
	tween.tween_property($Player, "player_speed", 0, 0.2)


func _on_house_player_entered():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
