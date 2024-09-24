extends Control

@export var science_panel: Panel
@export var debate_panel: Panel
@export var school_panel: Panel
@export var home_panel: Panel
@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hide_menus("SchoolAgeOptionsPanels")
	for each in get_tree().get_nodes_in_group("SchoolAgeActionButtons"):
		print(each)
		if each is Button:
			each.connect("pressed", Callable(self, "_on_button_pressed").bind(each))


func _on_button_pressed(button):
	_hide_menus("SchoolAgeOptionsPanels")
	_show_children(button)

func _hide_menus(groupName):
	for each in get_tree().get_nodes_in_group(groupName):
		if each.find_child:
			each.hide()
		else:
			each.show()

func _show_children(button):
	for each in button.get_children():
		print(each)
		each.show()
