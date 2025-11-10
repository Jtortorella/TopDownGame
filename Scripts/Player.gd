extends CharacterBody2D
@onready var sprites: AnimatedSprite2D = $Sprites
@onready var attack_timer: Timer = $AttackTimer
var last_direction := "Down"
var player_state := "Idle"
var input_vector := Constants.ZERO_VECTOR
func _physics_process(delta: float) -> void:
	check_idle();
	check_walk();
	check_attack();
	animate_based_on_state();
	move_based_on_state(delta);
	move_and_slide()
func move_based_on_state(delta: float) -> void:
	if player_state != 'Attacking':
		input_vector = set_input_vector()
		velocity = input_vector.normalized() * Constants.SPEED * delta
	else:
		input_vector = Constants.ZERO_VECTOR;
		velocity = Constants.ZERO_VECTOR;
func set_input_vector() -> Vector2:
	for direction in Constants.Animations.Walk:
		if Input.is_action_pressed(direction):
			last_direction = direction
			return Constants.DirectionVectors[direction]
	return Constants.ZERO_VECTOR
func check_idle() -> void:
	if input_vector == Constants.ZERO_VECTOR:
		player_state = 'Idle'
func check_attack() -> void:
	if Input.is_action_pressed('Attack'):
		player_state = 'Attack'
func check_walk() -> void:
	if input_vector != Constants.ZERO_VECTOR:
		player_state = 'Walk'
func play_animation(animation_name: String) -> void:
	sprites.play(animation_name);
func animate_based_on_state() -> void:
	if player_state == 'Attack':
		attack_timer.start();
		play_animation(Constants.Animations.Attack[last_direction])
	else:
		if player_state == 'Idle' && player_state != 'Attack':
			play_animation(Constants.Animations.Idle[last_direction])
		elif player_state == 'Walk' && player_state != 'Attack':
			play_animation(last_direction);
func _on_attack_timer_timeout() -> void:
	player_state = 'Idle'
