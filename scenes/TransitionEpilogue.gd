extends CanvasLayer



@onready var rect = $ColorRect
@onready var AnimPlr = $AnimationPlayer




func _on_epilogue_scene_change_canvas(change: int) -> void:
	if change == 1:
		AnimPlr.play("backtonormal")
		await AnimPlr.animation_finished	
		rect.visible = false
	else:
		rect.visible = true
		AnimPlr.play("fade_to_black")
		await AnimPlr.animation_finished
