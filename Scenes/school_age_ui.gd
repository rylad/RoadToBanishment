extends Control

@export var science_panel: Panel
@export var debate_panel: Panel
@export var school_panel: Panel
@export var home_panel: Panel
@export var player: Player
@export var energy_tracker: ProgressBar
@export var task_timer: Timer
@export var task_progress_bar: ProgressBar
var task_duration = 0

enum Activities{
	SCHOOL_PAY_ATTENTION,
	SCHOOL_MEET_PEOPLE,
	SCHOOL_AFTER_SCHOOL_SPORTS,
	SCHOOL_BRAINSTORM_IDEAS,
	HOME_SLEEP,
	HOME_WORK,
	HOME_DO_HOMEWORK,
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
	_hide_menus("SchoolAgeOptionsPanels")
	task_progress_bar.hide()
	for each in get_tree().get_nodes_in_group("SchoolAgeActionButtons"):
		print(each)
		if each is Button:
			each.connect("pressed", Callable(self, "_on_button_pressed").bind(each))
	
	for button in get_tree().get_nodes_in_group("SchoolAgeActiviesButtons"):
		if button is Button:
			button.connect("pressed", Callable(self, "_task").bind(button))

func _physics_process(delta: float) -> void:
	var remaining_time = task_timer.time_left
	task_progress_bar.value = 100 * ((task_duration - remaining_time) / task_duration)
	if remaining_time <= 0:
		task_progress_bar.hide()
	else:
		task_progress_bar.show()

func _on_button_pressed(button):
	_hide_menus("SchoolAgeOptionsPanels")
	_show_children(button)

func _hide_menus(groupName):
	for each in get_tree().get_nodes_in_group(groupName):
		if each.find_child:
			each.hide()
		else:
			each.show()

func _show_children(button):
	for each in button.get_children():
		print(each)
		each.show()

func _task(activity):
	print(activity)
	match activity:
		Activities.SCHOOL_PAY_ATTENTION:
			pass
		Activities.SCHOOL_MEET_PEOPLE:
			pass
		Activities.SCHOOL_AFTER_SCHOOL_SPORTS:
			pass
		Activities.SCHOOL_BRAINSTORM_IDEAS:
			pass
		Activities.HOME_SLEEP:
			pass
		Activities.HOME_WORK:
			pass
		Activities.HOME_DO_HOMEWORK:
			pass
		Activities.SCI_ATTEND:
			pass
		Activities.SCI_BUILD_ROCKET:
			pass
		Activities.SCI_GOOF_OFF:
			pass
		Activities.SCI_GO_SWIMMING:
			pass
		Activities.DEBATE_PRACTICE:
			pass
		Activities.DEBATE_STUDY:
			pass
		Activities.DEBATE_PREPARE:
			pass
		Activities.DEBATE_COMPETE:
			pass
	
	task_duration = 10
	task_timer.one_shot = true
	task_timer.start(task_duration)
	
	
	
