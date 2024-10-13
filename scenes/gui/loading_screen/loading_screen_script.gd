extends Control

func _ready() -> void:
	if GLOBAL.map_index == -1:
		print("error")
		get_tree().change_scene_to_file("res://scenes/gui/main_menu/main_menu_scene.tscn")
	
	$Container/MapName.text = Maps.mapname[GLOBAL.map_index]

func _process(_delta: float) -> void:
	$Container/ProgressBar.value += 100 * _delta

func _on_progress_bar_value_changed(value: float) -> void:
	if value == 100:
		get_tree().change_scene_to_file(Maps.path[GLOBAL.map_index])
