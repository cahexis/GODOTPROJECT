extends AnimatedSprite2D



func _on_outside_house_playboom(playing: bool) -> void:
	if playing == true:
		visible = true
		play("DeltaruneExplosion")
		await get_tree().create_timer(2).timeout
		visible = false
