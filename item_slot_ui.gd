class_name ItemSlotUI extends CenterContainer

@onready var item_display: Sprite2D = $Panel/ItemDisplay

func update(item: Item) -> void:
	if item:
		item_display.visible = true
		item_display.texture = item.texture
	else:
		item_display.visible = false

