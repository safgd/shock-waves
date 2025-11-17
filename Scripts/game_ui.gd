class_name Game_UI
extends CanvasLayer

@onready var fps_label: Label = $"VBoxContainer/FPS Label"
@onready var health_label: Label = $"VBoxContainer/Health Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	fps_label.text = str(Engine.get_frames_per_second()) + " fps"

func update_health_label(health_points: int):
	health_label.text = str(health_points) + " HP"
