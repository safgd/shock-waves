extends RayCast3D

@export var pre_color_extended: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_raycast_update()
	var collider = get_collider()
	if collider and collider is Ground:
		collider.notify_pre_marking(global_position, pre_color_extended)
	call_deferred("queue_free")
