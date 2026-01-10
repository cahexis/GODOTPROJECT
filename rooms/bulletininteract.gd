extends Area2D
var plr_detect = false
var debounce = false




func _input(event):
	if plr_detect == true:
		if debounce == false:
				if Input.is_action_pressed("Talk"):
					debounce = true
					Dialogic.start("BulletinBoard")
					await Dialogic.timeline_ended
					if Dialogic.VAR.DIA5 == 1:
						OS.shell_open("https://www.youtube.com/watch?v=FlGFFWWFZWw&list=PLvojVuC1SEv4Uy-j6B2llrxju7CSrvJP9")
						Dialogic.VAR.DIA5 = 2
					debounce = false
					
func _on_body_entered(body: Node2D) -> void:
	if body is Plr:
		plr_detect = true

func _on_body_exited(body: Node2D) -> void:
	if body is Plr:
		plr_detect = false
