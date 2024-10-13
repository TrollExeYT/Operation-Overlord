extends Control

func _on_escape_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	GLOBAL.map_index = -1
	get_tree().change_scene_to_file("res://scenes/gui/select_level/select_level_scene.tscn")
