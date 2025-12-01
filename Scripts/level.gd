class_name Level
extends Node3D

@export var hub_world_scene_path: String
var uncompleted_grounds_count: int = 0
var won: bool = false

func _ready() -> void:
	GameStats.last_level_path = scene_file_path

func register_to_be_completed_ground():
	uncompleted_grounds_count += 1

func register_completed_ground():
	uncompleted_grounds_count -= 1
	if uncompleted_grounds_count <= 0:
		win_condition_fulfilled()

func win_condition_fulfilled():
	if not won:
		won = true
		AudioManager.play_win_sound()
		if not GameStats.was_coin_collected(scene_file_path, scene_file_path):
			GameStats.add_coin(scene_file_path, scene_file_path, 1.0)
		AudioManager.change_to_music(11)
		SceneLoader.change_to_scene_async(self, hub_world_scene_path)
