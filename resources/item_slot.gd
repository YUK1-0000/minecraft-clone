class_name ItemSlot extends Resource

@export var item: Item
@export var amount: int

func has_item() -> bool:
	return item != null

func is_full() -> bool:
	return amount == item.max_amount
