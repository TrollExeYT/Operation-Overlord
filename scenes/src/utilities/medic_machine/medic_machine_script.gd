extends Utility

func _ready() -> void:
	cost = 0


func _heal_player() -> void:
	INGAME.player.health = move_toward(INGAME.player.health,100, 5 * get_process_delta_time())
	INGAME.camera._change_health(INGAME.player.health)


func _physics_process(_delta: float) -> void:
	if active:
		if Input.is_action_pressed("p_interact"):
			_heal_player()


func _on_area_body_entered(_body: Node2D) -> void:
	_change_active()


func _on_area_body_exited(_body: Node2D) -> void:
	_change_active()
