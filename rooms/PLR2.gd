class_name Plr
extends CharacterBody2D

@export var speed: int = 80
var input_dir = Vector2.ZERO
@onready var animated_sprite = $AnimatedSprite2D
var movedir = ""
var allow = false

func _ready() -> void:
	animated_sprite.play("Idle")
	
func _on_interact_secretary_movement(allowed: bool) -> void:
	if allowed == true:
		allow = true
	elif allowed == false:
		animated_sprite.play("Idle")
		allow = false

func _on_grand_finalepart_2_movement(allowed: bool) -> void:
	if allowed == true:
		allow = true
func _on_door_interact_area_movement(allowed: bool) -> void:
	if allowed == true:
		allow = true
	elif allowed == false:
		allow = false


func _process(delta: float) -> void:
	if allow == true:
		move_and_slide()
		player_movement()
		movement_direction()
		player_animation()
	
func player_movement():
	input_dir = Input.get_vector("WalkLeft", "WalkRight", "WalkUp", "WalkDown")
	velocity = input_dir * speed
	
func movement_direction():
	if Input.is_action_pressed("WalkLeft"):
		movedir = "left"
		Global.player_facing = "left"
		print(Global.player_facing)
	if Input.is_action_pressed("WalkRight"):
		movedir = "right"
		Global.player_facing = "right"
		print(Global.player_facing)
	if Input.is_action_pressed("WalkUp"):
		movedir = "up"
		Global.player_facing = "up"
		print(Global.player_facing)
	if Input.is_action_pressed("WalkDown"):
		movedir = "down"
		Global.player_facing = "down"
		print(Global.player_facing)

func player_animation():
	if velocity:
		if movedir == "left":
			animated_sprite.play("walkLeft")
		elif movedir == "right":
			animated_sprite.play("walkRight")	
		elif movedir == "up":
			animated_sprite.play("walkUp")	
		elif movedir == "down":
			animated_sprite.play("walkDown")	
	else:
		if movedir == "left":
			animated_sprite.play("IdleLeft")
		elif movedir == "right":
			animated_sprite.play("IdleRight")	
		elif movedir == "up":
			animated_sprite.play("IdleUp")	
		elif movedir == "down":
			animated_sprite.play("Idle")	
