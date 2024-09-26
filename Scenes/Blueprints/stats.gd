extends Control

@export var stat_name : String
@export var stat_icon : AtlasTexture


@onready var stat_name_box =$Panel/VBoxContainer/Panel/MarginContainer/StatName
@onready var stat_icon_box = $Panel/VBoxContainer/Panel2/HBoxContainer/MarginContainer/StatTexture
@onready var value_label_box = $Panel/VBoxContainer/Panel2/HBoxContainer/Value/ValueLabel

func _ready() -> void:
	stat_name_box.text = stat_name
	stat_icon_box.texture = stat_icon
	_update_value()

func _process(delta: float) -> void:
	_update_value()
	
func _update_value():
	value_label_box.text = str(PlayerData.get(stat_name))
	
