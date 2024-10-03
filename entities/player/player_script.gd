extends CharacterBody2D
class_name Player

var health : float = 100 #Vida del jugador
var direction : Vector2 #Direccion en la que se mueve
var speed : float = 200 #Velocidad del jugador
var weapons : Array[Weapon] #Array de armas maximo debe ser 2
var weapon_in_use : int = 0 #Indice del arma que se usa
var weapon_position : Node2D

func _ready() -> void:
	INGAME.active = true
	INGAME.player = $"."
	_set_weapon($WeaponPosition/M1945)


func _get_input() -> void:
	look_at(get_global_mouse_position())
	
	direction = Input.get_vector("p_left","p_right","p_up","p_down")
	
	if Input.is_action_just_pressed("p_shoot"):
		weapons[weapon_in_use]._fire()
	
	if Input.is_action_just_pressed("p_reload"):
		weapons[weapon_in_use]._reload()
	
	if Input.is_action_just_pressed("p_change_weapon") and weapons.size() > 1:
		print("CAMBIO ARMA")


func _physics_process(_delta: float) -> void:
	_get_input()
	
	velocity = direction.normalized() * speed
	
	move_and_slide()


func _set_weapon(new_weapon : Weapon) -> void:
	if weapons.size() < 2:
		weapons.append(new_weapon)
	else:
		weapons[weapon_in_use].queue_free()
		weapons[weapon_in_use] = new_weapon


func _get_actual_weapon() -> Weapon:
	return weapons[weapon_in_use]


func _add_weapon(new_weapon : PackedScene):
	var instantiated_weapon : Weapon = new_weapon.instantiate()
	instantiated_weapon.position = weapon_position.position
	weapon_position.add_child(instantiated_weapon)


func _check_health() -> void:
	INGAME.camera._change_health(health)
	if health < 0:
		queue_free()
		INGAME._stop_game()
