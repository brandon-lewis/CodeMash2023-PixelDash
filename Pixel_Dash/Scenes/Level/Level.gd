extends Node2D

func _ready():
	$Player.connect("fruit_collected", $HUD, "update_current_fruit")
	for fruit_child in $Collectibles.get_children():
		if fruit_child.get("fruit") != null:
			$HUD.increase_fruit_max(fruit_child.fruit)
