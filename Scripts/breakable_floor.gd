extends StaticBody3D

var player: Player
var broken: bool = false
var touching_player: bool = false

func _ready() -> void:
	player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if not broken and player:
		$CollisionShape3D.disabled = ( player.state == Player.State.STOMPING)
	
	if touching_player:
		if player.state == Player.State.STOMPING:
			AudioManager.play_broken_glass_sound()
			ParticleManager.spawn_glass_shard_particles(global_position)
			broken = true
			call_deferred("disable_collision") 
			call_deferred("queue_free")

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		touching_player = true
		
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		touching_player = false

func disable_collision():
	$CollisionShape3D.disabled = true
