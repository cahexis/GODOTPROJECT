extends Node2D
signal BEGIN(show: bool)
signal mover(allower: bool)
var plr_detect = false
var db = false
@onready var plr = $Player
@onready var plrsprite = $Player/AnimatedSprite2D
@onready var cam = $Player/Camera2D
@onready var esprite = $EVILEMI
@onready var fin = $"."
@onready var rev = $EmiReveal
@onready var OfficeAmbiance = $OfficeAmbiance
var db2 = false
@onready var bmusic = $BattleMusic
@onready var bstart = $BattleStart
@onready var call = $Call
@onready var p1 = $Place1
@onready var p2 = $Place2
@onready var gun = $ShoyaGun
@onready var battlebg = $BackgroundBattul
@onready var revg = $revealgun
@onready var gunshot = $GunPow
@onready var bld = $Blooood
@onready var sbve = $SbeveBehind
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2).timeout
	OfficeAmbiance.play()
	BEGIN.emit(false)
	mover.emit(true)
	esprite.play("HiddenEmi")
	


func _on_start_scene_body_entered(body: Node2D) -> void:
	if body is Plr3:
		plr_detect = true
		if db == false:
			db = true
			mover.emit(false)
			OfficeAmbiance.stop()
			Dialogic.start("FinalDialogue1yay")
			cam.reparent(fin)
			var tween1 = create_tween()
			tween1.tween_property(cam, "position", Vector2(0, -925), 5)
			plrsprite.play("walkUp")
			var tween2 = create_tween()
			tween2.tween_property(plrsprite, "position", Vector2(0, -300), 6)
			await tween2.finished
			plrsprite.play("IdleUp")
			await Dialogic.timeline_ended
			bstart.play()
			await bstart.finished
			bmusic.play()
			plrsprite.play("IdleRight")
			var tween3 = create_tween()
			tween3.tween_property(plrsprite, "position", Vector2(-200, -300), 0.5)
			var tween4 = create_tween()
			tween4.tween_property(esprite, "position", Vector2(122, -898), 0.5)
			p1.visible = true
			p2.visible = true
			battlebg.visible = true
			await get_tree().create_timer(2).timeout
			bmusic.stop()
			Dialogic.start("FinalDialogue2")
			await Dialogic.timeline_ended
			gun.visible = true
			revg.play()
			var tween5 = create_tween()
			tween5.tween_property(gun, "scale", Vector2(15, 15), 1)			
			Dialogic.start("LASTDIALOGUEYAY")
			await Dialogic.timeline_ended
			bld.position = esprite.position + Vector2(5,10)
			bld.visible = true
			var tween6 = create_tween()
			tween6.tween_property(bld, "scale", Vector2(2, 2), 10)			
			gun.visible = false
			await get_tree().create_timer(1).timeout	
			sbve.visible = true	
			var tween67 = create_tween()
			tween67.tween_property(sbve, "position", Vector2(2, -784.0), 1)							
			Dialogic.start("JKTHISISLAST")
			await get_tree().create_timer(3).timeout
			BEGIN.emit(true)
			
func _process(delta: float) -> void:
	if Dialogic.VAR.EmiSprite == 1: #reveal
		if db2 == false:
			rev.play()
			db2 = true
		esprite.play("RevealedEmi")
	if Dialogic.VAR.EmiSprite == 2:
		esprite.play("ConfusedEmi") 	
	if Dialogic.VAR.EmiSprite == 3:
		esprite.play("ThinkEmi") 
	if Dialogic.VAR.EmiSprite == 4:
		esprite.play("4FingersMeme")
	if Dialogic.VAR.EmiSprite == 5:
		esprite.play("PhoneCallEmi") 
	if Dialogic.VAR.EmiSprite == 6:
		esprite.play("MadAtCallEmi") 
	if Dialogic.VAR.EmiSprite == 7:
		esprite.play("ReceiveCallEmi") 
	if Dialogic.VAR.EmiSprite == 8:
		esprite.play("DeadEmi")
