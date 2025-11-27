extends StaticBody3D

@export var shop_items_scenes: Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(shop_items_scenes.size()):
		var shop_item: Shop_Item = shop_items_scenes[i].instantiate()
		add_child(shop_item)
		shop_item.position = $"Item Slots".get_child(i).position
