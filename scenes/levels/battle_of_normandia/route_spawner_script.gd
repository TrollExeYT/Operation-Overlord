extends Path2D

var normal = preload("res://entities/zombies/normal/normal_zombie_scene.tscn")

func _on_timer_timeout() -> void:
	$ZombieSpawn.progress_ratio = randi()
	var instantiated : Zombie = normal.instantiate()
	instantiated.global_position = $ZombieSpawn.global_position
	get_tree().current_scene.add_child(instantiated)
	$Timer.start()
