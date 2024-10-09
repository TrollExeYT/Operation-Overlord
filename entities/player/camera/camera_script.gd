extends Camera2D
class_name PlayerCamera

var reloading : bool = false

func _ready() -> void:
	INGAME.camera =  $"."
	_change_weapon_info(INGAME.player.weapons[INGAME.player.weapon_in_use].model, str(INGAME.player.weapons[INGAME.player.weapon_in_use].capacity) + " / " + str(INGAME.player.weapons[INGAME.player.weapon_in_use].ammunition))
	INGAME._start_game()


func _process(_delta: float) -> void:
	if INGAME.player != null:
		global_position = INGAME.player.global_position


func _change_reload_label() -> void:
	reloading = not reloading
	$GUI/Reloading.visible = reloading


func _change_weapon_info(new_name : String, new_ammunition : String) -> void:
	$GUI/Weapon/Name.text = new_name
	$GUI/Weapon/Ammunition.text = new_ammunition


func _change_time(new_time : String) -> void:
	$GUI/Time/Numbers.text = new_time


func _change_reichsmarks() -> void:
	$GUI/Reichsmarks.text = "Reichsmarks: " + str(INGAME.reichsmarks)


func _change_health(new_health : float) -> void:
	$GUI/HealthBar.value = new_health


func _change_message(new_text : String) -> void:
	$GUI/Message.text = new_text
