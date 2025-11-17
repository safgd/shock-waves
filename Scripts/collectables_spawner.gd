extends Node3D

@export var spawn_ammount: int = 1
@export var spawn_positions: Array[Node3D]
@export var collectables_scenes: Array[PackedScene]

var not_yet_collected_count: int = 0

func _ready() -> void:
	pass

func _on_spawn_wait_timer_timeout() -> void:
	if spawn_ammount > 0:
		var remaining_collectables_count: int = spawn_ammount
		var remaining_spawn_positions: Array[Node3D] = spawn_positions.duplicate()
		AudioManager.play_coin_spawn_sound()
		for i in range(remaining_spawn_positions.size()):
			if remaining_collectables_count <= 0:
				return
			# choose random collectable
			var collectable: Collectable = collectables_scenes[randi() % collectables_scenes.size()].instantiate()
			add_child(collectable)
			# choose random spawn position from the pool and remove that spawn after
			var random_slot_index: int = randi() % remaining_spawn_positions.size()
			collectable.global_position = remaining_spawn_positions[random_slot_index].global_position
			remaining_spawn_positions.remove_at(random_slot_index)
			# keeep track to not spawn too many collectables
			remaining_collectables_count -= 1
			not_yet_collected_count += 1
			collectable.collected.connect(register_collection)
		

func register_collection():
	not_yet_collected_count -= 1
	if not_yet_collected_count <= 0:
		not_yet_collected_count = 0
		$"Spawn Wait Timer".start()
