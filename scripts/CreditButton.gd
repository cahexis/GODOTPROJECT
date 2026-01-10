extends Button


@onready var animplr = get_node("CanvasLayer/AnimationPlayer")



func _on_gui_input(event: InputEvent) -> void:
	animplr.Play("fade_to_black")
	get_tree().change_scene_to_file("res://scenes/Main_Menu.tscn")
