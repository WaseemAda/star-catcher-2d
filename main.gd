extends Node2D

@export var star_scene: PackedScene

@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var score_label: Label = $ScoreLabel
@onready var game_over_label: Label = $GameOverLabel
@onready var restart_button: Button = $RestartButton
@onready var timer: Timer = $Timer

# Sounds
@onready var catch_sound: AudioStreamPlayer = $CatchSound
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound
@onready var click_sound: AudioStreamPlayer = $ButtonClickSound

var score: int = 0
var is_game_over: bool = false


func _ready():
	randomize()
	_update_score_label()

	game_over_label.visible = false
	restart_button.visible = false

	timer.start()


func _on_timer_timeout():
	spawn_star()


func spawn_star():
	if is_game_over:
		return

	var star = star_scene.instantiate()
	var random_x = randf_range(0.0, screen_size.x)
	star.global_position = Vector2(random_x, -100.0)
	add_child(star)


func add_score():
	score += 1
	_update_score_label()
	catch_sound.play()      # 🔊 play catch sound


func _update_score_label():
	score_label.text = "Score: " + str(score)


func game_over():
	if is_game_over:
		return

	is_game_over = true
	timer.stop()

	game_over_label.visible = true
	restart_button.visible = true

	game_over_sound.play()   # 🔊 play game over sound


func _on_restart_button_pressed() -> void:
	click_sound.play()
	get_tree().reload_current_scene()
