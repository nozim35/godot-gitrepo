extends CharacterBody2D
# comment

const SPEED = 270.0
const JUMP_VELOCITY = -400.0
const MAX_JUMPS = 2   # ← Anzahl der Sprünge (2 = Double Jump)

var gravity
var jumps_left = MAX_JUMPS

@onready var animSprite = $AnimatedSprite2D
@onready var jumpSound = $jump

func _ready():
	# Schwerkraft aus den Projekteinstellungen laden
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

	# Beim Start die Richtung für den Idle-Status umdrehen
	animSprite.flip_h = true

func _physics_process(delta):
	# Schwerkraft anwenden
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 0:
			animSprite.play("fall3")
		else:
			animSprite.play("jump3")
	else:
		# Sprünge zurücksetzen, sobald man den Boden berührt
		jumps_left = MAX_JUMPS

		if velocity.x == 0:
			animSprite.play("idle3")
		else:
			animSprite.play("run3")

	# Sprung (inkl. Double Jump)
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
		jumpSound.play()

	# Bewegung behandeln
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	if direction != 0:
		animSprite.flip_h = -direction < 0

	move_and_slide()
