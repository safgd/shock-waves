extends MeshInstance3D

var default_cylinder_pos: Vector3
var default_cylinder_2_pos: Vector3
@export var cylinder_distance: float = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	default_cylinder_pos = $Cylinder.position 
	default_cylinder_2_pos = $"Cylinder 2".position
	AudioManager.audio_tick.connect(_on_audio_tick)

func _on_audio_tick():
	$Cylinder.position += Vector3(cylinder_distance, 0.0, 0.0)
	$"Cylinder 2".position += Vector3(cylinder_distance, 0.0, 0.0)
	$Timer.start()


func _on_timer_timeout() -> void:
	$Cylinder.position = default_cylinder_pos
	$"Cylinder 2".position = default_cylinder_2_pos
