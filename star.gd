extends Area2D

@export var fall_speed: float = 200.0

func _process(delta):
	# If game is over, stop the star
	if get_parent().is_game_over:
		return

	position.y += fall_speed * delta

	var screen_height = get_viewport().get_window().size.y
	if position.y > screen_height:
		get_parent().game_over()
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if get_parent().is_game_over:
		return

	if area.name == "Player":
		area.add_score()
		queue_free()
