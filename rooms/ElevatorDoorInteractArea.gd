extends Area2D
var plr_detect = false
var debounce = false
signal StartingTime2(change: bool)
signal boom2(doit: int)
@export var dialogpart: String = "ElevatorDoorDialogue"

@onready var door1 = get_node("%DoorInner1")
@onready var door2 = get_node("%DoorInner2")
signal Movement(allowed: bool)
@onready var plr = get_node("%Player")
@onready var plrsprite = get_node("%Player/AnimatedSprite2D")

func _input(event):
	if plr_detect == true:
		if debounce == false:
				if Input.is_action_pressed("Talk"):
					debounce = true
					Dialogic.start("ElevatorDoorDialogue")
					await Dialogic.timeline_ended
					if Dialogic.VAR.OpenDoor == 1:
						Movement.emit(false)
						var tween1 = create_tween()
						tween1.tween_property(door1, "position", position + Vector2(-300, 300), 1)
						var tween2 = create_tween()
						tween2.tween_property(door2, "position", position + Vector2(300, 300), 1)
						boom2.emit(2)
						await get_tree().create_timer(4).timeout
						StartingTime2.emit(true)
						plrsprite.play("walkUp")
						var tween5 = create_tween()
						tween5.tween_property(plrsprite, "position", position + Vector2(0, -100), 2)
						await get_tree().create_timer(2).timeout
						get_tree().change_scene_to_file("res://scenes/THEFINALEFINALE.tscn")
					else:
						debounce = false
						
func _on_body_entered(body: Node2D) -> void:
	if body is Plr:
		plr_detect = true

func _on_body_exited(body: Node2D) -> void:
	if body is Plr:
		plr_detect = false
