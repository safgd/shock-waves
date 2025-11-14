extends StaticBody3D

# should be changed to preload perhaps
@export var shock_wave_scene: PackedScene

func _ready() -> void:
	spawn_shock_wave()

func _on_timer_timeout() -> void:
	spawn_shock_wave()

func spawn_shock_wave():
	var shock_wave: Shock_Wave = shock_wave_scene.instantiate()
	add_child(shock_wave)
	shock_wave.global_position = global_position
