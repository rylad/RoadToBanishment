extends Panel
@onready var main: Button = $ButtonBar/Main
@onready var inventory: Button = $ButtonBar/Inventory
@onready var schooling: Button = $ButtonBar/Schooling
@onready var development: Button = $ButtonBar/Development
@onready var acheivements: Button = $ButtonBar/Acheivements

@onready var main_ui: CanvasGroup = $"../UICenter/MainUI"
@onready var inventory_ui: CanvasGroup = $"../UICenter/Inventory"
@onready var school_age_ui: CanvasGroup = $"../UICenter/SchoolAge"


func _ready() -> void:
	setup_connections()
	on_button_pressed(main)
	
func setup_connections():
	var ui_buttons = get_tree().get_nodes_in_group("MainUIPanelButtons")
	for button in ui_buttons:
		button.connect("pressed", Callable(self,"on_button_pressed").bind(button))


func on_button_pressed(button):
	print(button.name)
	for a_button in get_tree().get_nodes_in_group("MainUIPanelButtons"):
		a_button.modulate = Color.WHITE
		a_button.modulate.a = 0.25
	
	button.modulate = Color.YELLOW
	
	main_ui.hide()
	inventory_ui.hide()
	school_age_ui.hide()
	
	match button.name:
		"Main":
			main_ui.show()
		"Inventory": 
			inventory_ui.show()
		"Schooling":
			school_age_ui.show()
		_:
			print("landed in null - button match in tab pressed")
