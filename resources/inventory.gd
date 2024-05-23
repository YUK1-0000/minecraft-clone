class_name Inventory extends Resource

signal ui_update

@export var slots: Array[ItemSlot]

func insert(collected_item: Item, collected_amount: int) -> void:
	print("Collect ", collected_item.name)
	var slots_: Array[ItemSlot] = get_not_full_slots_of(collected_item)
	if not slots_.is_empty():
		slots_[0].amount += collected_amount
	#var same_item_slots: Array[ItemSlot] = get_slots_of(collected_item)
	#if not same_item_slots.is_empty():
		#for slot: ItemSlot in same_item_slots:
			#if slot.is_full():
				#continue
			#slot.amount += collected_amount
	else:
		var empty_slots: Array[ItemSlot] = get_slots_of(null)
		if not empty_slots .is_empty():
			empty_slots[0].item = collected_item
			empty_slots[0].amount = collected_amount
	ui_update.emit()

func get_slots_of(item: Item) -> Array[ItemSlot]:
	return slots.filter(
		func(slot):
			return slot.item == item
	)

func get_not_full_slots_of(item: Item) -> Array[ItemSlot]:
	return slots.filter(
		func(slot: ItemSlot):
			return slot.item == item and slot.amount != item.max_amount
	)
