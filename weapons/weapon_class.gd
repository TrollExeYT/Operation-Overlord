extends Node2D
class_name Weapon

var model : String
var type : String
var in_use : bool

var ammunition : int
var max_ammunition : int
var ammunition_scene : PackedScene

var capacity : int 
var max_capacity : int

var speed_bullet : float
var can_shot : bool = true

var can_reload : bool = true
var reload_time : float 

var damage : float

var start_cannon : Node2D
var end_cannon : Node2D

func _fire() -> void:
	if capacity < 1 or not can_reload:
		return
	
	var bullet : Bullet = ammunition_scene.instantiate()
	bullet.global_position = end_cannon.global_position
	bullet.look_at(get_global_mouse_position())
	bullet._shooted(start_cannon.global_position, end_cannon.global_position, speed_bullet, damage)
	get_tree().current_scene.add_child(bullet)
	
	capacity -= 1
	_change_info()
	
	if capacity < 1:
		_reload()

func _reload() -> void:
	if not can_reload:
		return
	
	can_reload = false
	INGAME.camera._change_message("Reloading...")
	
	var reload_ammunition = max_capacity - capacity
	
	if capacity != max_capacity and reload_ammunition > 0 and ammunition > 0:
		await get_tree().create_timer(reload_time).timeout
		if reload_ammunition > ammunition:
			capacity += ammunition
			ammunition -= ammunition
		else:
			capacity += reload_ammunition
			ammunition -= reload_ammunition
	
	INGAME.camera._change_message("")
	_change_info()
	can_reload = true


func _change_use() -> void:
	in_use = !in_use
	
	$".".visible = in_use


func _change_info() -> void:
	INGAME.camera._change_weapon_info(model,str(capacity) + " / " + str(ammunition))
