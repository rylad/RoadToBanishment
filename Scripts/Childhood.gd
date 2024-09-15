extends Player

class_name Childhood


var stageActions = {
	"Try to Crawl" : try_to_crawl, 
	"Cry": cry, 
	"Poop": poop
	}

func try_to_crawl():
	if Strength <= 10:
		Strength += 1
	else:
		Strength += .1
		
	Hunger -= 1
	Thirst -= .5
		
func cry():
	Hunger += 5
	Thirst += 2
	Comfort -= 1
	

func poop():
	Comfort = 100.0
