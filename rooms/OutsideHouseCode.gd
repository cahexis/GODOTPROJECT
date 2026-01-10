extends Node2D
@onready var door = $DoorSprite
@onready var transition = $CanvasLayer
@onready var cr = $CanvasLayer/ColorRect
@onready var ap = $CanvasLayer/AnimationPlayer
@onready var mus = $NeighborhoodMusic
@onready var booms = $BoomSound
@onready var plr = $Player

signal controls(enable: bool)
signal playboom(playing: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		plr.visible = false
		await get_tree().create_timer(1).timeout
		ap.play("backtonormal")
		await ap.animation_finished	
		cr.visible = false
		await get_tree().create_timer(2).timeout
		var doortween = get_tree().create_tween()
		doortween.tween_property(door, "position", position + Vector2(-300, -300), 1)
		playboom.emit(true)
		booms.play()
		await get_tree().create_timer(2).timeout
		plr.visible = true
		Dialogic.start("DialogOutsideHouse")
		await Dialogic.timeline_ended
		controls.emit(true)
		mus.play()
