extends CanvasLayer


@onready var rect = $ColorRect
@onready var AnimPlr = $AnimationPlayer
@onready var changer = 0

func _on_thefinalefinale_begin(show: bool) -> void:
	if show == true:
		rect.visible = true
		AnimPlr.play("fade_to_black")
		await AnimPlr.animation_finished
	elif show == false:
		AnimPlr.play("backtonormal")
		await AnimPlr.animation_finished	
		rect.visible = false
