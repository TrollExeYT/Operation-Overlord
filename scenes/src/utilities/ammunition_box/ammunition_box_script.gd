extends Utility

func _ready() -> void:
	message = $Message
	cost = 250


func _physics_process(_delta: float) -> void:
	if active and Input.is_action_just_pressed("p_interact"):
		_add_ammunition()


func _on_area_body_entered(_body: Node2D) -> void:
	_change_active()


func _on_area_body_exited(_body: Node2D) -> void:
	_change_active()


func _add_ammunition() -> void:
	if INGAME.player._get_actual_weapon().ammunition != INGAME.player._get_actual_weapon().max_ammunition and INGAME.reichsmarks >= cost:
		INGAME.reichsmarks -= cost
		INGAME.player._get_actual_weapon().ammunition = INGAME.player._get_actual_weapon().max_ammunition
		
	
	INGAME.camera._change_reichsmarks(INGAME.reichsmarks)
	INGAME.player._get_actual_weapon()._change_info()
