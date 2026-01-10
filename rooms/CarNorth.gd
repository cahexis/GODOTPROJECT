extends Area2D
var plr_detect = false
var debounce = false
@onready var doorsound = $CarDoor
@onready var driving = $CarDriving
@onready var car = $Car
@export var dialogpart: String = "CarInteract"
@onready var music = get_node("%NeighborhoodMusic")
@onready var plr = get_node("%Player")
@onready var trans = get_node("%CanvasLayer")
@onready var ap = get_node("%CanvasLayer/AnimationPlayer")
@onready var cr = get_node("%CanvasLayer/ColorRect")
signal stopplr(enable: bool)

func _input(event):
	if plr_detect == true:
		if debounce == false:
				if Input.is_action_pressed("Talk"):
					debounce = true
					Dialogic.start(dialogpart)
					await Dialogic.timeline_ended
					if Dialogic.VAR.Option == 1:
						music.stop()
						stopplr.emit(true)
						doorsound.play()
						await get_tree().create_timer(2).timeout
						plr.visible = false
						await doorsound.finished
						var tween = create_tween()
						tween.tween_property(car, "position", Vector2(-500, 50), 3.0)
						driving.play()
						await get_tree().create_timer(2).timeout
						debounce = false
						cr.visible = true
						ap.play("fade_to_black")
						await ap.animation_finished
						await driving.finished
						get_tree().change_scene_to_file("res://rooms/GRAND_FINALEPART1.tscn")
					
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		plr_detect = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		plr_detect = false
