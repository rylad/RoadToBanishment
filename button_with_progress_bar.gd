extends Node2D


@export var button_name_label: Label
@export var progress: ProgressBar
@export var click_cost = 1
@export var starting_value = 10

func _ready() -> void:
	progress.step = click_cost
	progress.value = starting_value

func _on_click():
	progress.value -= progress.step
	print (progress.value)
	if progress.value <= 0:
		queue_free()
	return progress.value
	
