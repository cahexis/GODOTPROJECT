extends Control

var startisdone = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if startisdone == false:
		var backg = get_node("Background")
		var creditsbutton = get_node("CreditsButton")
		var buttons1 = get_node("ButtonHolder")
		var Title1 = get_node("Title1")
		var Title2 = get_node("Title2")
		var firetext = get_node("CharacterBody2D")
		backg.hide()
		creditsbutton.hide()
		buttons1.hide()
		Title1.hide()
		Title2.hide()
		firetext.hide()
		await get_tree().create_timer(1).timeout
		Title1.show()
		await get_tree().create_timer(1).timeout
		firetext.show()
		await get_tree().create_timer(1).timeout
		Title2.show()
		await get_tree().create_timer(0.5).timeout
		backg.show()
		buttons1.show()
		creditsbutton.show()
		startisdone = true
