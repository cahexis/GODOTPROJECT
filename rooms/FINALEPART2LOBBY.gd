extends Node2D
signal StartingTime(change: bool)
signal Movement(allowed: bool)
@onready var swerve = $SwerveSound
@onready var crash = $CrashSound
@onready var car1 = $CarBreak
@onready var car2 = $CarBurning
@onready var plr = $Player
@onready var fakeplr = $ShoyaThrown
@onready var txt = $Text
@onready var DEDLOL = $YOUDIEDLMAO
@onready var Blood = $Blooood
@onready var music = $OfficeMusic
@onready var animatr = get_node("Text/TextAnim")

func _ready() -> void:
	animatr.play("TextHide")
	await get_tree().create_timer(2).timeout
	StartingTime.emit(false)
	await get_tree().create_timer(0.7).timeout
	swerve.play()
	await get_tree().create_timer(1).timeout
	var tween1 = create_tween()
	tween1.tween_property(car1, "position", Vector2(8.0, 119.5), 0.5)
	crash.play()
	await tween1.finished
	fakeplr.visible = true	
	var tween2 = create_tween()
	tween2.tween_property(fakeplr, "position", Vector2(-1.0, 45), 0.5)
	await get_tree().create_timer(2).timeout
	car2.visible = true
	car1.visible = false
	DEDLOL.play()
	txt.visible = true
	animatr.play("TextShow")
	Blood.show()
	var tween3 = create_tween()
	tween3.tween_property(Blood, "scale", Vector2(1.5,1.5), 10.0)
	await get_tree().create_timer(10.5).timeout
	DEDLOL.stop()
	Blood.hide()
	txt.visible = false
	fakeplr.visible = false	
	plr.visible = true
	Movement.emit(true)
	music.play()
