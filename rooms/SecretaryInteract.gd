extends Area2D
var plr_detect = false
var debounce = false
var optionchose = 0
@onready var cry = $JohnCry
@onready var BigSprite = $JohnSprite
signal boom(doit: int)
signal open(doit: bool)
var dialogpart = "SecretaryDialogue"
signal Movement(allowed: bool)


func _input(event):
	if plr_detect == true:
		if debounce == false:
				if Input.is_action_pressed("Talk"):
					if Dialogic.VAR.DialogueSwap == 0:
						debounce = true
						BigSprite.play("Talking")
						Dialogic.start(dialogpart)
						await Dialogic.timeline_ended
						BigSprite.stop()
						if Dialogic.VAR.Option == 1:
							BigSprite.play("Crying")
							Dialogic.VAR.Hesad = true
							cry.play()
							Dialogic.VAR.DialogueSwap = 1
						elif Dialogic.VAR.Option == 2:
							pass
						elif Dialogic.VAR.Option == 3:
							boom.emit(1)
							BigSprite.visible = false
							Dialogic.VAR.Badaboom = 1
							Dialogic.VAR.DialogueSwap = 67
						elif Dialogic.VAR.Option == 4:
							pass
#							OS.shell_open("https://www.youtube.com/watch?v=FlGFFWWFZWw&list=PLvojVuC1SEv4Uy-j6B2llrxju7CSrvJP9")
						debounce = false
					elif Dialogic.VAR.DialogueSwap == 1:
						debounce = true
						Dialogic.start("JohnVar1")
						await Dialogic.timeline_ended
						if Dialogic.VAR.Option2 == 1:
							boom.emit(1)
							BigSprite.visible = false
							Dialogic.VAR.DialogueSwap = 67
							Dialogic.VAR.Badaboom = 1
						elif Dialogic.VAR.Option2 == 2:
							Dialogic.VAR.Badaboom = 1
						debounce = false
						
func _on_body_entered(body: Node2D) -> void:
	if body is Plr:
		plr_detect = true

func _on_body_exited(body: Node2D) -> void:
	if body is Plr:
		plr_detect = false
