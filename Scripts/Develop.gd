extends Button

@onready var label = $"../Label"
@export var label_value:int
@export var player: CharacterBody2D
var generation = 0


func _on_pressed():
	label_value += 1
	label.text = str(label_value)
	
	player.Hunger -= 10
	player.Thirst -= 10
	player.Social -= 10
	player.Comfort -= 10
	
	"""
	if label_value == 5:
		SignalBus.update.emit("Dream")
		SignalBus.becomeBorn.emit()
	"""
	
	if label_value == 10:
		print(label_value)
		generation = "Childhood"
		print("We are in the %s phase of life." %[generation])
		SignalBus.update.emit("Develop")
		SignalBus.generationChange.emit(generation)
	
	if label_value == 15:
		print("time to reset")
	
	return generation
