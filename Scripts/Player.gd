extends CharacterBody2D

class_name Player

##Stats
var Strength = 2
var Dexterity = 2
var Constitution = 2
var Intelligence = 2
var Charisma = 10
var Wisdom = 2


##Vitals
var Hunger = 30.0
var Thirst = 100.0
var Social = 100.0
var Comfort = 100.0
var Cleanliness = 100.0
var Energy = 100
var MAX_ENERGY = Energy * (1+(Constitution/100)) * Generation_Bonus

##Misc
var Money = 0.00
@export var Generation_Bonus = 1

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

## 0.1 - Childhood - functions

var Childhood = {
	"Try to Crawl" : try_to_crawl, 
	"Cry": cry, 
	"Poop": poop
	}

func try_to_crawl():
	if Strength <= 10:
		print(Strength)
		print(Player)
		Strength += 1
	else:
		Strength += .1
		
	Hunger -= 1
	Thirst -= .5
	
	if Hunger <= 20:
		summon_Mom("Summon Mom")
		
func cry():
	Hunger += 5
	Thirst += 2
	Comfort -= 1
	

func poop():
	Comfort = 100.0
	Cleanliness -= 30
	
	if Cleanliness <= 40:
		summon_Dad("Summon Dad")


func summon_Mom(name):
	print("Summoning Mom")
	SignalBus.summonMom.emit(name)

func summon_Dad(name):
	print("Summoning Dad")
	SignalBus.summonDad.emit(name)

func summon_mom_use():
	Social += 20
	if Hunger <= 80:
		Hunger += 20
	elif Hunger <= 99:
		Hunger +=1
	else:
		print("Full")

func summon_dad_use():
	Social += 20
	if Cleanliness < 100:
		Cleanliness = 100
