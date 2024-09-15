extends Node2D

@export var pipe_scene: PackedScene

var game_running: bool
var game_over: bool
var scroll
var score
const SCROLL_SPEED: int = 6
var screen_size : Vector2i
var ground_height: int
var ceiling_height: int
var pipes : Array
var miracle : int = 10
const PIPE_DELAY: int = 100
const PIPE_RANGE : int = 300
var to_win: int = 9


func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Ground").texture.get_height()
	ceiling_height = $Ceiling.get_node("Ceiling").texture.get_height()
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	miracle = 10
	$ScoreLabel.text = "Time Until Miracles: " + str(miracle)
	scroll = 0
	$GameOver.hide()
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()
	generate_pipes()
	$Sperm.reset()
	
	
func start_game():
	game_running = true
	$Sperm.flying = true
	$Sperm.flap()
	$PipeTimer.start()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Sperm.flying:
						$Sperm.flap()
						check_top()

func _physics_process(delta):
	if game_running:
		scroll += SCROLL_SPEED
		if scroll > screen_size.x:
			scroll = 0
		$Ground.position.x = -scroll
		$Ceiling.position.x = -scroll
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED


func check_top():
	if $Sperm.position.y < 0:
		$Sperm.falling = true
		stop_game()
		
func stop_game():
	$PipeTimer.stop()
	$GameOver.show()
	$Sperm.flying = false
	game_running = false
	game_over = true

func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipe.hit.connect(sperm_hit)
	pipe.scored.connect(scored)
	add_child(pipe)
	pipes.append(pipe)
	

func scored():
	miracle -= 1
	if miracle == to_win:
		SignalBus.birth.emit()
	$ScoreLabel.text = "Time Until Miracles: " + str(miracle)

func sperm_hit():
	$Sperm.falling = true
	stop_game()

func _on_ground_hit():
	$Sperm.falling = true
	stop_game() 
	
func _on_pipe_timer_timeout():
	generate_pipes()

func _on_game_over_restart():
	new_game()


func _on_ground_body_entered(body):
	_on_ground_hit()
