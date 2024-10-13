extends Control


func _on_escape_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gui/main_menu/main_menu_scene.tscn")


func _on_start_pressed() -> void:
	GLOBAL.map_index = 0
	get_tree().change_scene_to_file("res://scenes/gui/loading_screen/loading_screen_scene.tscn")
