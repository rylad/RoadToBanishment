extends HBoxContainer

@export var stat_name: String
@export var stat_value: int
@export var stat_name_label: Label
@export var stat_value_label: Label



func _ready() -> void:
	stat_name_label.text = stat_name
	stat_value = randi_range(3,18)
	stat_value_label.text = str(stat_value)
