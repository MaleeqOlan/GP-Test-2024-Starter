extends Area2D
# Emitted when the player was hit by a mob.
# Put this at the top of the script.
signal hit


# And this function at the bottom.
func die():
	hit.emit()
	queue_free()


func _on_mob_detector_body_entered(body):
	die()
