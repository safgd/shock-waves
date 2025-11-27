extends Node

@export var opened_levels: Dictionary[String, bool]

func is_level_open(level_path: String):
	return opened_levels.has(level_path)
