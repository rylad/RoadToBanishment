extends CharacterBody2D

class_name Player

##Stats
var Strength = 2
var Intelligence = 2
var Charisma = 10

##Vitals
var Hunger = 100.0
var Thirst = 100.0
var Social = 100.0
var Comfort = 100.0

##Misc
var Money = 0.00

## Integer Representing Acension level
"""
Game Stages (0.X)
0.0 - Birth
0.1 - Childhood
0.2 - School Age
0.3 - Teenage Years
0.4 - Development
0.5 - Pre-Release
1.0 - 1.0
"""

var Game_Stage = 0.0


func get_stats():
	return [Strength, Intelligence, Charisma]

func get_vitals():
	return[Hunger, Thirst, Social, Comfort]
