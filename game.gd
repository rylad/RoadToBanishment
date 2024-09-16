extends Node2D

@onready var ButtonStorage = $"Actions Panel/Actions Storage"
@onready var TimedButtonStorage = $"Timed Events Panel/TimedButtonStorage"
@onready var StatsStorage = $"Stats Storage"
@onready var VitalStorage =  $"Vitals Storage"
@onready var generation = ""

@export var TheBeginning : PackedScene
@export var player:CharacterBody2D

@export var strengthValueLabel: Label
@export var intelligenceValueLabel: Label
@export var charismaValueLabel: Label
@export var hungerValueLabel: Label
@export var thirstValueLabel: Label
@export var socialValueLabel: Label
@export var comfortValueLabel: Label




func _ready():
	SignalBus.generationChange.connect(generation_change)
	SignalBus.update.connect(update_button)
	SignalBus.becomeBorn.connect(become_born)
	SignalBus.birth.connect(birth)
	SignalBus.summonMom.connect(limited_event)
	$Develop.text = "Thrust"
	
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

func become_born():
	$BeingBorn.show()
	hide_main()
	
func hide_main():
	$Develop.hide()
	$Label.hide()
	ButtonStorage.hide()
	
func show_main():
	$Develop.show()
	$Label.show()
	ButtonStorage.show()
	
func new_button(name):
	var created_button = Button.new()
	created_button.text = name
	return created_button

func update_button(name):
	$Develop.text = name

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

func limited_event(name):
	print("Summoning Mom")
	add_new_button(name, generation, TimedButtonStorage)
