extends Area2D

func _on_Spikes_body_entered(body):
	if body.has_method("take_spike_damage"):
		body.take_spike_damage()
