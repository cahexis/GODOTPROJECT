extends AnimatedSprite2D

@onready var boom = $BoomSound


func _on_door_interact_area_boom_2(doit: int) -> void:
	if doit == 2:
		visible = true
		play("DeltaruneExplosion")
		boom.play()
		await get_tree().create_timer(2).timeout
		visible = false
