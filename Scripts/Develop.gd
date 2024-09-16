extends Button

@onready var label = $"../Label"
@export var label_value:int
@export var player: CharacterBody2D
var generation = 0


func _on_pressed():
	label_value += 1
	label.text = str(label_value)
	
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

	
	return generation
