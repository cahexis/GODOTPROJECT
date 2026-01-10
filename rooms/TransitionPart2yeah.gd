extends CanvasLayer


@onready var rect = $ColorRect
@onready var AnimPlr = $AnimationPlayer
@onready var changer = 0

func _on_grand_finalepart_2_starting_time(change: bool) -> void:
	if change == true:
		rect.visible = true
		AnimPlr.play("fade_to_black")
		await AnimPlr.animation_finished
	elif change == false:
		AnimPlr.play("backtonormal")
		await AnimPlr.animation_finished	
		rect.visible = false



func _on_door_interact_area_starting_time_2(change: bool) -> void:
	if change == true:
		rect.visible = true
		AnimPlr.play("fade_to_black")
		await AnimPlr.animation_finished
	elif change == false:
		AnimPlr.play("backtonormal")
		await AnimPlr.animation_finished	
		rect.visible = false
