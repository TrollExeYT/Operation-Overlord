extends Weapon

func _ready() -> void:
	model = "M1945"
	type = "PISTOL"
	in_use = true
	
	ammunition = 40
	max_ammunition = 80
	
	capacity = 8
	max_capacity = 8
	
	start_cannon = $StartCannon
	end_cannon = $EndCannon
	
	ammunition_scene = preload("res://weapons/pistols/ammunition/pistol/pistol_ammunition_scene.tscn")
	
	speed_bullet = 750
	damage = 20
	
	reload_time = 1.5
