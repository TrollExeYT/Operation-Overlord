extends Zombie

@onready var nav_agent : NavigationAgent2D = $NavAgent

func _ready() -> void:
	speed = 100
	damage = 45
	health = 100


func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(nav_agent.get_next_path_position())
	velocity = direction * speed
	rotation = rotate_toward(rotation , get_angle_to(nav_agent.get_next_path_position()) + rotation , _delta * 1.5)
	move_and_collide(velocity * _delta)
	
	if target != null:
		_attack()


func _makepath() -> void:
	if INGAME.player != null:
		nav_agent.target_position = INGAME.player.global_position


func _on_timer_timeout() -> void:
	_makepath()


func _on_attack_zones_body_entered(_body: Node2D) -> void:
	if _body is Player:
		target = _body


func _on_attack_zones_body_exited(_body: Node2D) -> void:
	target = null
