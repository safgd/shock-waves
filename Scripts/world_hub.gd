class_name World_Hub
extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameStats.world_hub = self
	#SceneLoader.world_hub_scene_path = scene_file_path
	if GameStats.last_level_path.begins_with("res://Levels/level"):
		var level_entry: Level_Entry = get_level_entry(GameStats.last_level_path)
		GameStats.last_level_path = ""
		$Player.global_position = level_entry.get_player_spawn_pos()
	else:
		print(GameStats.last_level_path)

func get_level_entries() -> Array:
	return $"Level Entries".get_children()

func get_level_entry(level_path: String) -> Level_Entry:
	for level_entry in get_level_entries():
		if level_entry.level_scene_path == level_path:
			return level_entry
	return null

func get_player() -> Player:
	return $Player
