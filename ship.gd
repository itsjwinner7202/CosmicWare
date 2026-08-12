extends CharacterBody2D
const SPEED = 500

@onready var fire: Area2D = $Area2D2

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		fire.visible = true
	else:
		fire.visible = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite2D.flip_h = true
		elif direction > 0:
			$Sprite2D.flip_h = false
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
