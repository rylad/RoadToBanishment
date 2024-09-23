extends Control


@export var vital_name : String
@export var vital_icon : AtlasTexture
@export var vital_value : float

@onready var vital_name_box =$Panel/VBoxContainer/Panel/MarginContainer/VitalName
@onready var vital_icon_box = $Panel/VBoxContainer/Panel2/HBoxContainer/MarginContainer/VitalTexture
@onready var value_label_box = $Panel/VBoxContainer/Panel2/HBoxContainer/MarginContainer2/VitalSatisfaction

func _ready() -> void:
	vital_name_box.text = vital_name
	vital_icon_box.texture = vital_icon
	value_label_box.value = vital_value
