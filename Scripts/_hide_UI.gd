extends Node

#Feature that will iterate through the group and hide all other menus, requires a consistent group

func _hide_menus(groupName):
	for each in get_tree().get_nodes_in_group(groupName):
		if each.find_child:
			each.hide()
		else:
			each.show()

func _hide_UI_panels(groupName):
	for each in get_tree().get_nodes_in_group(groupName):
		if each.find_child:
			each.hide()
		else:
			each.show()

func _highlight_active_UI(active_pane):
	pass
	
func _hide_UI_element(element):
	pass
