class_name Collectable
extends Area3D

signal collected

enum Type{
	COIN,
	HEALTH
}

@export var type: Type
@export var ammount: float = 1.0
@export var alternative_material: Material
var level_scene_path: String

func _ready() -> void:
	level_scene_path = get_parent().get_parent().scene_file_path
	if type == Type.COIN:
		if GameStats.was_coin_collected(level_scene_path, name):
			if get_node_or_null("MeshInstance3D"):
				$MeshInstance3D.set_surface_override_material(0, alternative_material)
			$"Coin Mesh".set_surface_override_material(0, alternative_material)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		collected.emit()
		body.get_collected(type, ammount)
		match type:
			Type.COIN:
				AudioManager.play_coin_sound()
				ParticleManager.spawn_spark_particles(global_position)
				if not GameStats.was_coin_collected(level_scene_path, name):
					GameStats.add_coin(level_scene_path, name, ammount)
			Type.HEALTH:
				AudioManager.play_heal_item_sound()
				ParticleManager.spawn_red_spark_particles(global_position)
		call_deferred("queue_free")
