extends CharacterBody2D
class_name Zombie

var not_death : bool
var health : float
var speed : float
var damage : float
var can_attack : bool

var target : Player

func _attack() -> void:
	target.health -= damage * get_process_delta_time()
	target._check_health()

func _check_health() -> void:
	if health < 0:
		queue_free()
