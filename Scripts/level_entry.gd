@tool
class_name Level_Entry
extends Area3D

@export var coin_cost: int = 1:
	set(value):
		coin_cost = value
		update_speach_bubble()

@export var open: bool = false:
	set(value):
		open = value
		if open:
			$Sprite3D.position = $"Bouncer 2nd Pos".position
		else:
			$Sprite3D.position = $"Bouncer Door Pos".position

@export var level_scene_path: String
@export_multiline var level_name: String = "Level":
	set(value):
		level_name = value
		$Label3D.text = level_name

@export var bouncer_image: Texture2D:
	set(value):
		bouncer_image = value
		$Sprite3D.texture = bouncer_image

@export var light_color: Color:
	set(value):
		light_color = value
		$OmniLight3D.light_color = light_color

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		if open:
		#get_tree().call_deferred("change_scene_to_file", level_scene_path)
			SceneLoader.change_to_scene_async(get_parent().get_parent(), level_scene_path)
		else:
			if GameStats.coins >= coin_cost:
				GameStats.pay_with_coins(coin_cost)
				GameStats.unlock_level(level_scene_path)
				open = true
				SceneLoader.change_to_scene_async(get_parent().get_parent(), level_scene_path)
		

func _ready() -> void:
	open = GameStats.is_level_open(level_scene_path)
	
	$Label3D.text = level_name
	if open:
		$Sprite3D.position = $"Bouncer 2nd Pos".position
		$Sprite3D/Sprite3D.hide()
	else:
		$Sprite3D.position = $"Bouncer Door Pos".position

func get_player_spawn_pos() -> Vector3:
	return $"Player Spawn Pos".global_position

func update_speach_bubble():
	if coin_cost == 1:
		$Sprite3D/Sprite3D/Label3D.text = "Entry Cost:\n" + str(coin_cost) + " Coin"
	else:
		$Sprite3D/Sprite3D/Label3D.text = "Entry Cost:\n" + str(coin_cost) + " Coins"
