extends Node2D
@onready var phone = $PhoneSprite
@onready var psound = $ShowPhone
@onready var edit = $BuckyEdit
@onready var sb1 = $SbeveAvatar
@onready var sb2 = $SbeveAvatar2
@onready var sb3 = $SbeveAvatar3
@onready var sbV = $SbevesVoice
@onready var caramb = $ShoyaDriving
@onready var splat = $Splat
signal StartingTime(change: bool)

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	StartingTime.emit(false)
	caramb.play()
	Dialogic.start("InCarDialogue")
	await Dialogic.timeline_ended
	var tween = create_tween()
	phone.visible = true
	tween.tween_property(phone, "position", Vector2(668, 372.0), 2.0)
	psound.play()
	await psound.finished
	edit.visible = true
	edit.play()
	await get_tree().create_timer(3).timeout
	sbV.play()
	sb1.visible = true
	await get_tree().create_timer(5).timeout
	sb1.visible = false
	sb2.visible = true
	await get_tree().create_timer(3).timeout
	sb2.visible = false
	sb3.visible = true
	await get_tree().create_timer(2).timeout
	sb3.visible = false
	splat.play()
	Dialogic.start("CarDialogue2")
	await Dialogic.timeline_ended
	StartingTime.emit(true)
	edit.stop()
	caramb.stop()
	get_tree().change_scene_to_file("res://rooms/GRAND_FINALEPART2.tscn")
