extends Control

var first_name: String
var last_name: String
@export var name_label: Label

var first_name_choices = ['Violet', 'Paisley', 'Ella', 'Henry', 'Chloe', 'Amelia', 'Zoey', 'Noah', 'Daniel', 'William',
 'Grayson', 'Mason', 'Ezra', 'Ellie', 'Charlotte', 'Olivia', 'Christopher', 'Benjamin', 'Hazel',
 'Luke', 'Alexander', 'Sebastian', 'Anthony', 'David', 'Evelyn', 'Aria', 'Elizabeth', 'Jaxon', 
 'John', 'Abigail', 'Jack', 'Hunter', 'Ivy', 'Grace', 'Logan', 'Luna', 'Penelope', 'James', 
 'Victoria', 'Ryan', 'Nathan', 'Wyatt', 'Zoe', 'Jackson', 'Sophia', 'Camila', 'Charles', 'Jacob',
 'Samuel', 'Isaac', 'Sofia', 'Mia', 'Caleb', 'Levi', 'Carter', 'Nina', 'Leo', 'Savannah', 
 'Ethan', 'Stella', 'Scarlett', 'Mateo', 'Thomas', 'Harper', 'Ava', 'Eleanor', 'Aiden', 'Andrew',
 'Luna', 'Riley', 'Elijah', 'Maya', 'Nora', 'Mila', 'Gabriel', 'Asher', 'Isaiah', 'Joshua', 
 'Lily', 'Avery', 'Matthew', 'Alice', 'Lucas', 'Dylan', 'Eliana', 'Emily', 'Bella', 'Aurora', 
 'Owen', 'Levi', 'Willow', 'Leah', 'Lillian', 'Isabella', 'Madison', 'Addison', 'Josiah', 
 'Lucy', 'Michael', 'Emma']

var last_name_choices = ['Phillips', 'Reed', 'Jones', 'Sanders', 'Adams', 'James', 'Roberts', 'Gomez', 'Smith', 
 'Watson', 'Gutierrez', 'Campbell', 'Hall', 'Garcia', 'Rivera', 'Robinson', 'Cooper', 
 'Edwards', 'Castillo', 'Hughes', 'Anderson', 'Moore', 'Walker', 'White', 'Ramos', 'Thompson',
 'Wood', 'Green', 'Reyes', 'Carter', 'Turner', 'Wright', 'Davis', 'Morgan', 'Rodriguez', 
 'Young', 'Nguyen', 'Brown', 'Foster', 'Morris', 'Wilson', 'Torres', 'Perez', 'Howard', 
 'Williams', 'Morales', 'Sanchez', 'Taylor', 'Murphy', 'Thomas', 'Martin', 'Kelly', 'Clark', 
 'Bailey', 'Patel', 'Evans', 'Alvarez', 'Martinez', 'Ortiz', 'Long', 'Gonzalez', 'Harris', 
 'Stewart', 'Bennett', 'Lopez', 'Price', 'Nelson', 'Cruz', 'Gray', 'Hernandez', 'Richardson', 
 'Miller', 'Ward', 'Brooks', 'King', 'Chavez', 'Rogers', 'Collins', 'Mitchell', 'Lee', 
 'Lewis', 'Ross', 'Jackson', 'Diaz', 'Hill', 'Flores', 'Allen', 'Baker', 'Kim', 'Peterson', 
 'Ruiz', 'Ramirez', 'Parker', 'Myers', 'Mendoza', 'Cook', 'Cox', 'Johnson', 'Scott', 
 'Jimenez']


func _ready() -> void:
	var first_name_choice = first_name_choices.pick_random()
	var last_name_choice = last_name_choices.pick_random()
	var names = _get_name(first_name_choice, last_name_choice)
	first_name = names[0]
	last_name = names[1]
	name_label.text = first_name + " " + last_name
	
func _get_name(first, last):
	var first_name = first_name_choices[first]
	var last_name = last_name_choices[last]
	return [first_name, last_name]
