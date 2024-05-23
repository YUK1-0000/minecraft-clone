extends Control

@onready var  inventory: Inventory = preload("res://test_inventory.tres")
@onready var item_slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open: bool = visible

func _ready() -> void:
	inventory.ui_update.connect(update)
	update()

func update() -> void:
	print("Inventory UI update")
	for i: int in range(min(inventory.slots.size(), item_slots.size())):
		item_slots[i].update(inventory.slots[i])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("e"):
		close() if is_open else open()
	if Input.is_action_just_pressed("q"):
		inventory.insert(preload("res://test_item.tres"), 1)

func open() -> void:
	visible = true
	is_open = true

func close() -> void:
	visible = false
	is_open = false
