extends StaticBody2D
class_name Utility

var active : bool = false
var message : String
var cost : int

func _change_active() -> void:
	active = not active
