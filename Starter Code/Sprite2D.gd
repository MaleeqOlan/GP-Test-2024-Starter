extends Sprite2D

@export var thing:PackedScene

func _input(event):	
	if event is InputEventMouseButton and event.pressed:	
		var new_thing = thing.instantiate()
		new_thing.global_position = event.global_position
		new_thing.name = "block " + str(event)
		get_tree().get_root().add_child(new_thing) 
		
		## scale = Vector2.ZERO
		##var tween = create_tween().set_trans(Tween.TRANS_CIRC)
		##tween.tween_property($"../block", "global_position", event.position, 1.0)
	pass


func _on_mob_detecter_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
