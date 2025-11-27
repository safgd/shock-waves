class_name Shop_Item
extends Area3D

@export var coin_cost: int = 1
var bought: bool = false

func _ready() -> void:
	monitoring = not bought
	
func _on_body_entered(body: Node3D) -> void:
	if bought:
		return
	if body.is_in_group("Player"):
		var player: Player = body
		if GameStats.pay_with_coins(coin_cost):
			bought = true
			player.add_hat(self)
			
