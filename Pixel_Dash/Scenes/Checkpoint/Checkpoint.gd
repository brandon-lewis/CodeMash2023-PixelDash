extends Area2D

export (bool) var is_active := false setget set_active  # setget set_func, get_func

func set_active(new_value):
	is_active = new_value
	if is_active:
		$AnimatedSprite.play("activating")
	else:
		$AnimatedSprite.play("activating", true) # play backwards


func _on_Checkpoint_body_entered(body):
	if body.has_method("update_checkpoint"):
		body.update_checkpoint(self)


func _on_AnimatedSprite_animation_finished():
	if is_active:
		$AnimatedSprite.play("active")
	else:
		$AnimatedSprite.play("idle")
