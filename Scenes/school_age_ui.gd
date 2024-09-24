extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hide_menus(self, "SchoolAgeToggle")
	for each in get_tree().get_nodes_in_group("SchoolAgeToggle"):
		print(each)
		if each is Button:
			each.connect("pressed", _on_button_pressed.bind(self))


func _on_button_pressed(clicked_button):
	print(clicked_button)
	_hide_menus(clicked_button, "SchoolAgeToggle")


func _hide_menus(exception, groupName):
	for each in get_tree().get_nodes_in_group("SchoolAgeToggle"):

		if each != exception:
			each.hide()
		else:
			each.show()
