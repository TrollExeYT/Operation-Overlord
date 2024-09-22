extends Area2D
class_name Bullet

var direction : Vector2
var speed : float
var damage : float

func _shooted(start: Vector2, end: Vector2, new_speed: float, new_damage : float):
	direction = start.direction_to(end)
	speed = new_speed
	damage = new_damage

func _physics_process(_delta: float) -> void:
	global_position += direction * _delta * speed


func _on_body_entered(body: Node2D) -> void:
	if body is Zombie:
		body.health -= damage
		INGAME.reichsmarks += 20
		
		body._check_health()
		
		INGAME.camera._change_reichsmarks(INGAME.reichsmarks)
	
	queue_free()
