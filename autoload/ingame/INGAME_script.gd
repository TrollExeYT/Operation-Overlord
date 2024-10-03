extends Node2D

var active : bool

var player : Player #Variable global del jugador
var camera : PlayerCamera

var minutes : int
var seconds : int

var reichsmarks : int

func _start_game() -> void:
	$TimeCounter.start()
	
	minutes = 30
	seconds = 0
	
	reichsmarks = 0


func _stop_game() -> void:
	$TimeCounter.stop()
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/gui/main_menu/main_menu_scene.tscn")

func _end_game() -> void:
	pass

func _on_time_counter_timeout() -> void:
	var new_time : String = ""
	
	if seconds < 1:
		minutes -= 1
		seconds += 59
	else:
		seconds -= 1
	
	if minutes < 1 and seconds < 1:
		_end_game()
		return
	
	if minutes < 10:
		new_time += "0" + str(minutes)
	else:
		new_time += str(minutes)
	
	new_time += ":"
	
	if seconds < 10:
		new_time += "0" + str(seconds)
	else:
		new_time += str(seconds)
	
	camera._change_time(new_time)
