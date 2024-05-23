class_name ItemSlotUI extends CenterContainer

@onready var item_display: Sprite2D = $Panel/ItemDisplay
@onready var amount_label: Label = $Panel/AmountLabel

func update(slot: ItemSlot) -> void:
	print("Item slot UI update", slot.amount if slot.has_item() else "")
	if slot.item:
		item_display.visible = true
		item_display.texture = slot.item.texture
	else:
		item_display.visible = false
	if slot.item == null or slot.amount < 2:
		amount_label.text = ""
	else:
		amount_label.text = str(slot.amount)
