extends Control

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_Quit_pressed():
	get_tree().quit()



func _on_start_pressed() -> void:
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://main.tscn")



func _on_quit_pressed() -> void:
	$ButtonClickSound.play()
	get_tree().quit()
