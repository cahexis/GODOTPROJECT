extends Area2D
var plr_detect = false
var debounce = false

@export var dialogpart: String = "MonoCubDialogue"

@onready var Sprite = $NpcSprite


	
func _input(event):
	if plr_detect == true:
		if debounce == false:
				if Input.is_action_pressed("Talk"):
					debounce = true
					Sprite.play()
					Dialogic.start(dialogpart)
					await Dialogic.timeline_ended
					Sprite.stop()
					debounce = false
					
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		plr_detect = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		plr_detect = false
