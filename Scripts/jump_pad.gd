extends Area3D

@export var jump_velocity: float = 9.0

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.perform_jump(jump_velocity, true)
		AudioManager.play_jump_pad_sound()
