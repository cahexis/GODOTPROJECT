extends CanvasLayer


@onready var rect = $ColorRect
@onready var AnimPlr = $AnimationPlayer

func _on_ready() -> void:
	AnimPlr.play("backtonormal")
	await AnimPlr.animation_finished	
	rect.visible = false



func _on_credits_button_pressed() -> void:
	rect.visible = true
	AnimPlr.play("fade_to_black")
	await AnimPlr.animation_finished
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")



func _on_start_pressed() -> void:
	rect.visible = true
	AnimPlr.play("fade_to_black")
	await AnimPlr.animation_finished
	get_tree().change_scene_to_file("res://scenes/EpilogueScene.tscn")
