extends Node2D

@onready var KB = $Keyboard
@onready var P1 = $Part1
@onready var P2 = $Part2
@onready var P3 = $Part3
@onready var P4 = $Part4
@onready var P5 = $Part5
@onready var P6 = $Part6
@onready var OWG = $OwGameplay
@onready var WindowBreak = $WindowBreak

signal ChangeCanvas(change: int)

func _on_ready() -> void:
#	await get_tree().create_timer(2).timeout
	Dialogic.start("Dialogue1")
	await Dialogic.timeline_ended
	ChangeCanvas.emit(1)
	KB.play()
	await get_tree().create_timer(4).timeout
	P2.visible = true
	OWG.visible = true
	OWG.play()
	await OWG.finished
	KB.stop()
	await get_tree().create_timer(2).timeout
	OWG.visible = false
	P3.visible = true
	await get_tree().create_timer(2).timeout
	P4.visible = true
	await get_tree().create_timer(2).timeout	
	P5.visible = true
	await get_tree().create_timer(1).timeout
	Dialogic.start("Dialogue2")
	WindowBreak.play()
	P6.visible = true
	await Dialogic.timeline_ended
	ChangeCanvas.emit(2)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://rooms/OutsideHouse.tscn")
