extends Control

@export var science_panel: Panel
@export var debate_panel: Panel
@export var school_panel: Panel
@export var home_panel: Panel
@export var energy_tracker: ProgressBar
@export var task_timer: Timer
@export var task_progress_bar: ProgressBar
@export var debug_game_idea_progress_bar: ProgressBar
@export var debug_making_friends_progress_bar: ProgressBar
@export var friend_bp: PackedScene
@export var game_bp: PackedScene
@export var friend_container: VBoxContainer
@export var game_container: VBoxContainer

@export var debug_multi = 100

var task_duration = 0
var cost = 0

enum Activities{
	SCHOOL_PAY_ATTENTION,
	SCHOOL_MEET_PEOPLE,
	SCHOOL_AFTER_SCHOOL_SPORTS,
	SCHOOL_BRAINSTORM_IDEAS,
	HOME_SLEEP,
	HOME_WORK,
	HOME_DO_HOMEWORK,
	HOME_PLAY_VIDEO_GAMES,
	SCI_ATTEND,
	SCI_BUILD_ROCKET,
	SCI_GOOF_OFF,
	SCI_GO_SWIMMING,
	DEBATE_PRACTICE,
	DEBATE_STUDY,
	DEBATE_PREPARE,
	DEBATE_COMPETE,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HideMenus._hide_menus("SchoolAgeOptionsPanels")
	task_progress_bar.hide()
	for each in get_tree().get_nodes_in_group("SchoolAgeActionButtons"):
		print(each)
		if each is Button:
			each.connect("pressed", Callable(self, "_on_button_pressed").bind(each))
	
	for button in get_tree().get_nodes_in_group("SchoolAgeActivitiesButtons"):
		print(button.name)
		if button is Button:
			button.connect("pressed", Callable(self, "_task").bind(button))

func _physics_process(delta: float) -> void:
	## This controls the progress bar during actions
	var remaining_time = task_timer.time_left
	task_progress_bar.value = 100 * ((task_duration - remaining_time) / task_duration)
	if remaining_time <= 0:
		task_progress_bar.hide()
		for button in get_tree().get_nodes_in_group("SchoolAgeActivitiesButtons"):
			button.disabled = false
	else:
		task_progress_bar.show()
		for button in get_tree().get_nodes_in_group("SchoolAgeActivitiesButtons"):
			button.disabled = true
	
	debug_making_friends_progress_bar.value = PlayerData.Making_Friends
	debug_game_idea_progress_bar.value = PlayerData.Game_Idea
	
	## This controls the hidden values of games and friend creation	
	if PlayerData.Game_Idea >= 100:
		PlayerData.Game_Idea = 0
		var new_game = game_bp.instantiate()
		game_container.add_child(new_game)
	
	if PlayerData.Making_Friends >= 100:
		PlayerData.Making_Friends = 0
		var new_friend = friend_bp.instantiate()
		friend_container.add_child(new_friend)
		
	energy_tracker.value = PlayerData.Energy
	energy_tracker.max_value = PlayerData.MAX_ENERGY
		

func _on_button_pressed(button):
	HideMenus._hide_menus("SchoolAgeOptionsPanels")
	_show_children(button)


func _show_children(button):
	for each in button.get_children():
		print(each)
		each.show()

func _task(activity):
	print(activity.name)
	if activity.name == "SCHOOL_PAY_ATTENTION":
		cost = 10
		_task_timer_rules(cost)
		PlayerData.Intelligence += 1
	elif activity.name == "SCHOOL_MEET_PEOPLE":
		cost = 15
		_task_timer_rules(cost)
		PlayerData.Charisma += 1
		PlayerData.Making_Friends += 25
	elif activity.name == "SCHOOL_AFTER_SCHOOL_SPORTS":
		cost = 25
		PlayerData.Making_Friends += 10
		_task_timer_rules(cost)
		PlayerData.Strength += .5
		PlayerData.Dexterity += 1
	elif activity.name == "SCHOOL_BRAINSTORM_IDEAS":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Game_Idea += 40
	elif activity.name == "HOME_SLEEP":
		cost = 60
		_task_timer_rules(cost)
		PlayerData.Energy = 100
	elif activity.name == "HOME_WORK":
		cost = 20
		_task_timer_rules(cost)
		PlayerData.Money += 100
		PlayerData.Making_Friends += 20
	elif activity.name == "HOME_DO_HOMEWORK":
		cost = 20
		_task_timer_rules(cost)
		PlayerData.Intelligence += 1
	elif activity.name == "HOME_PLAY_VIDEO_GAMES":
		PlayerData.Game_Idea += 10
	elif activity.name == "SCI_ATTEND":
		cost = 60
		_task_timer_rules(cost)
		PlayerData.Intelligence += 5
	elif activity.name == "SCI_BUILD_ROCKET":
		cost = 60
		_task_timer_rules(cost)
		PlayerData.Making_Friends += 40
	elif activity.name == "SCI_GOOF_OFF":
		cost = 30
		PlayerData.Making_Friends += 25
		PlayerData.Game_Idea += 25
	elif activity.name == "SCI_GO_SWIMMING":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Strength += 1
	elif activity.name == "DEBATE_PRACTICE":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Wisdom += 1
	elif activity.name == "DEBATE_STUDY":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Intelligence += 1
	elif activity.name == "DEBATE_PREPARE":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Intelligence += 1
	elif activity.name == "DEBATE_COMPETE":
		cost = 30
		_task_timer_rules(cost)
		PlayerData.Charisma += 1
	else:
			print("No activity found")
	
func _task_timer_rules(duration):
	duration = duration * (100-PlayerData.Efficiency_Multiplier)
	task_duration = duration / debug_multi
	task_timer.one_shot = true
	task_timer.start(task_duration)
	PlayerData.Energy -= duration
	_hidden_increases(40)
	


func _hidden_increases(increased_stat_value):
	PlayerData.update_stat("Making_Friends", increased_stat_value)
	PlayerData.update_stat("Game_Idea", increased_stat_value)

func _sleep(duration):
	task_duration = duration / debug_multi
	task_timer.one_shot = true
	task_timer.start(task_duration)
	PlayerData.update_stat("Energy", 100)
	
