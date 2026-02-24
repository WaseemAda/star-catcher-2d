extends Area2D

@export var speed: float = 800.0

func _process(delta):
	var direction := 0.0

	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	position.x += direction * speed * delta
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)


func add_score():
	var main = get_parent()
	if main and main.has_method("add_score"):
		main.add_score()
