extends Control

@export var stat_name : String
@export var stat_icon : AtlasTexture
@export var stat_value : float

@onready var stat_name_box =$Panel/VBoxContainer/Panel/MarginContainer/StatName
@onready var stat_icon_box = $Panel/VBoxContainer/Panel2/HBoxContainer/MarginContainer/StatTexture
@onready var value_label_box = $Panel/VBoxContainer/Panel2/HBoxContainer/Value/ValueLabel

func _ready() -> void:
	stat_name_box.text = stat_name
	stat_icon_box.texture = stat_icon
	value_label_box.text = str(stat_value)
