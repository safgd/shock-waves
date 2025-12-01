extends Node

# to precompile shaders
func _ready():
	$"Spark Particles".emitting = true
	$"Red Spark Particles".emitting = true
	$"Glass Shard Particles".emitting = true

func spawn_spark_particles(pos: Vector3):
	$"Spark Particles".global_position = pos
	$"Spark Particles".emitting = true

func spawn_red_spark_particles(pos: Vector3):
	$"Red Spark Particles".global_position = pos
	$"Red Spark Particles".emitting = true

func spawn_glass_shard_particles(pos: Vector3):
	$"Glass Shard Particles".global_position = pos
	$"Glass Shard Particles".emitting = true
