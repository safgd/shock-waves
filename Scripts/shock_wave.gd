extends Node3D

@onready var csg_torus: CSGTorus3D = $CSGTorus
@export var ring_growth: float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
	csg_torus.inner_radius += ring_growth * delta
	csg_torus.outer_radius += ring_growth * delta
