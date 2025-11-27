class_name Collectable
extends Area3D

signal collected

enum Type{
	COIN,
	HEALTH
}

@export var type: Type
@export var alternative_material: Material
var level_scene_path: String

func _ready() -> void:
	level_scene_path = get_parent().get_parent().scene_file_path
	if type == Type.COIN:
		if GameStats.was_coin_collected(level_scene_path, name):
			$MeshInstance3D.set_surface_override_material(0, alternative_material)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		collected.emit()
		body.get_collected(type)
		match type:
			Type.COIN:
				AudioManager.play_coin_sound()
				if not GameStats.was_coin_collected(level_scene_path, name):
					GameStats.add_coin(level_scene_path, name)
			Type.HEALTH:
				AudioManager.play_heal_item_sound()
		call_deferred("queue_free")
