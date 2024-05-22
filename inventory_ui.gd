extends Control

@onready var  inventory: Inventory = preload("res://test_inventory.tres")
@onready var item_slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open: bool = visible

func _ready() -> void:
	update_item_slots()

func update_item_slots() -> void:
	for i: int in range(min(inventory.items.size(), item_slots.size())):
		item_slots[i].update(inventory.items[i])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		close() if is_open else open()

func open() -> void:
	visible = true
	is_open = true

func close() -> void:
	visible = false
	is_open = false
