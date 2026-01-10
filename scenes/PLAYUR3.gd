class_name Plr3
extends CharacterBody2D

@export var speed: int = 80
var input_dir = Vector2.ZERO
@onready var animated_sprite = $AnimatedSprite2D
var movedir = ""
var allow = false

func _ready() -> void:
	animated_sprite.play("IdleUp")
	

func _on_thefinalefinale_mover(allower: bool) -> void:
	if allower == true:
		allow = true
	elif allower == false:
		allow = false
		animated_sprite.play("IdleUp")



func _process(delta: float) -> void:
	if allow == true:
		move_and_slide()
		player_movement()
		movement_direction()
		player_animation()
	
func player_movement():
	input_dir = Input.get_vector("WalkUp", "WalkUp", "WalkUp", "WalkDown")
	velocity = input_dir * speed
	
func movement_direction():
	if Input.is_action_pressed("WalkLeft"):
		pass
	if Input.is_action_pressed("WalkRight"):
		pass
	if Input.is_action_pressed("WalkUp"):
		movedir = "up"
	if Input.is_action_pressed("WalkDown"):
		movedir = "down"


func player_animation():
	if velocity:
		if movedir == "left":
			pass
		elif movedir == "right":
			pass
		elif movedir == "up":
			animated_sprite.play("walkUp")	
		elif movedir == "down":
			animated_sprite.play("walkDown")	
	else:
		if movedir == "left":
			pass
		elif movedir == "right":
			pass
		elif movedir == "up":
			animated_sprite.play("IdleUp")	
		elif movedir == "down":
			animated_sprite.play("Idle")	


func _on_ready() -> void:
	pass # Replace with function body.
