extends CharacterBody2D

@export var aiText : RichTextLabel
@export var speed: float = 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var delivery := $"."
##@onready var ai_node := $"../AI"
func _physics_process(delta):
	var direction = Vector2.ZERO

	# Movement input
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
		animated_sprite.flip_h = true   # Flip when going left
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
		animated_sprite.flip_h = false  # Normal when going right
	
	# You can add up/down movement if you want:
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1

	# Apply velocity
	velocity = direction.normalized() * speed
	move_and_slide()

	# Animation control
	if direction != Vector2.ZERO:
		if not animated_sprite.is_playing():
			animated_sprite.play("walk")
	else:
		animated_sprite.stop()
		animated_sprite.frame = 0  # idle pose (first frame of walk)
