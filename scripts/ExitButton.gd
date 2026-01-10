extends Button



func _on_pressed() -> void:
	get_tree().quit()


func _on_mouse_entered() -> void:
	self.text = "bye bye"



func _on_mouse_exited() -> void:
	self.text = "leave"
