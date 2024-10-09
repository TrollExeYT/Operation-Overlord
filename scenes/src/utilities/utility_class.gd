extends StaticBody2D
class_name Utility

var active : bool = false
var message : Label
var cost : int

func _change_active() -> void:
	active = not active
	message.visible = active
