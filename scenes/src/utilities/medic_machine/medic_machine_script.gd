extends Utility

func _ready() -> void:
	cost = 0
	message = $Message
	message.rotation = 0

func _heal_player() -> void:
	INGAME.player.health += get_process_delta_time()

func _physics_process(delta: float) -> void:
	if active:
		_heal_player()
