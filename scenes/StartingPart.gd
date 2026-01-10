extends CanvasLayer


@onready var rect = $"CanvasLayer/ColorRect"
@onready var AnimPlr = get_node("CanvasLayer/AnimationPlayer")
@onready var KB = get_node("Keyboard")
func _on_ready() -> void:
	KB.Play()
	await get_tree().create_timer(2).timeout
	Dialogic.start("Dialogue1")
	await Dialogic.timeline_ended
	AfterParts()

func AfterParts():
	AnimPlr.play("backtonormal")
	await AnimPlr.animation_finished	
	rect.visible = false

func ShoyaGaming():
	pass
