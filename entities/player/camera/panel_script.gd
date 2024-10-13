extends Panel

func _ready() -> void:
	$MapName.text = Maps.mapname[GLOBAL.map_index]

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and INGAME.active:
		_change_visible()

func _change_visible() -> void:
	INGAME.camera.gui.visible = not INGAME.camera.gui.visible 
	visible = not visible
	get_tree().paused = not get_tree().paused


func _on_return_pressed() -> void:
	_change_visible()


func _on_escape_pressed() -> void:
	INGAME._close_game()
