extends CanvasLayer

onready var bananaLabel = $HBoxContainer/BananaVBox/Label
onready var strawberryLabel = $HBoxContainer/StrawberryVBox/Label

onready var fruit_totals := {
	"banana": { "current": 0, "total": 0, "labelNode": bananaLabel },
	"strawberry": { "current": 0, "total": 0, "labelNode": strawberryLabel }
}

func update_current_fruit(fruit_data:Dictionary) -> void:
	for fruit in fruit_data.keys():
		fruit_totals.get(fruit).current = fruit_data.get(fruit)
	update_labels()

func increase_fruit_max(fruit:String) -> void:
	fruit_totals.get(fruit.to_lower()).total += 1
	update_labels()

func update_labels():
	for fruit_value in fruit_totals.values():
		var fruit_label = "%d/%d" % [fruit_value.current, fruit_value.total]
		fruit_value.labelNode.text = fruit_label
