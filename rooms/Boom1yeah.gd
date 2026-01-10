extends AnimatedSprite2D

@onready var boom = $BoomSound

func _on_interact_secretary_boom(doit: int) -> void:
	if doit == 1:
		visible = true
		play("DeltaruneExplosion")
		boom.play()
		await get_tree().create_timer(2).timeout
		visible = false
