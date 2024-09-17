extends Node2D

@export_category("UI Containers")
@export var MainUI:CanvasGroup
@export var ButtonStorage:VBoxContainer
@export var TimedButtonStorage:HBoxContainer
@export var StatsStorage:VBoxContainer
@export var VitalStorage:VBoxContainer
@onready var generation = ""

@export var TheBeginning : PackedScene
@export var player:CharacterBody2D

@export_category("Stat Labels")
@export var strengthValueLabel: Label
@export var intelligenceValueLabel: Label
@export var charismaValueLabel: Label
@export var hungerValueLabel: Label
@export var thirstValueLabel: Label
@export var socialValueLabel: Label
@export var comfortValueLabel: Label
@export var cleanlinessValueLabel: Label

@export var limitedEventButton: PackedScene

@export_category("Misc")
@export var mainButton:Button
@export var generationPower:float

func _ready():
	SignalBus.generationChange.connect(generation_change)
	SignalBus.update.connect(update_button)
	SignalBus.becomeBorn.connect(become_born)
	SignalBus.birth.connect(birth)
	SignalBus.summonMom.connect(limited_event)
	SignalBus.summonDad.connect(limited_event)
	
	mainButton.text = "Thrust"
	
func _physics_process(delta):
	update_ui()

func generation_change(generation):
	##TODO - Remove this Childhood Ref, why isnt player.generation passing / working correctly?
	print("The following was passed: " + generation)
	for each in player.Childhood:
		add_new_button(each, generation, ButtonStorage)

func add_new_button(name, generation, location):
	var new_Button = new_button(name)
	new_Button.pressed.connect(player.Childhood[name])
	location.add_child(new_Button)

func add_limited_event_button(name, starting_value, cost, callable):
	##TODO - Remove Bug, if you go under then over then under, it overwrites (adds a second mom)
	var new_limited_event = limitedEventButton.instantiate()
	new_limited_event.button_name_label.text = name
	new_limited_event.starting_value = starting_value
	new_limited_event.click_cost = cost
	new_limited_event.button.pressed.connect(callable)
	TimedButtonStorage.add_child(new_limited_event)

	

func become_born():
	hide_main()
	$BeingBorn.show()

	
func hide_main():
	MainUI.hide()
	
func show_main():
	MainUI.show()
	
func new_button(name):
	var created_button = Button.new()
	created_button.text = name
	return created_button

func update_button(name):
	mainButton.text = name

func birth():
	$BeingBorn.queue_free()
	show_main()

func update_ui():
	strengthValueLabel.text = str(player.Strength)
	intelligenceValueLabel.text = str(player.Intelligence)
	charismaValueLabel.text = str(player.Charisma)
	hungerValueLabel.text = str(player.Hunger)
	thirstValueLabel.text = str(player.Thirst)
	socialValueLabel.text = str(player.Social)
	comfortValueLabel.text = str(player.Comfort)
	cleanlinessValueLabel.text = str(player.Cleanliness)

func limited_event(name):
	print(name)
	if name == "Summon Mom":
		add_limited_event_button(name, 100, 10, player.summon_mom_use)
	elif name == "Summon Dad":
		add_limited_event_button(name, 100, 50, player.summon_dad_use)
