extends CanvasLayer


@onready var rect = $ColorRect
@onready var AnimPlr = $AnimationPlayer
@onready var changer = 0






func _on_grand_finalepart_1_starting_time(change: bool) -> void:
	if change == true:
		rect.visible = true
		AnimPlr.play("fade_to_black")
		await AnimPlr.animation_finished
	else:
		AnimPlr.play("backtonormal")
		await AnimPlr.animation_finished	
		rect.visible = false
