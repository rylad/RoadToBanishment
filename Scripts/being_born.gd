extends Node2D

@export var pipe_scene: PackedScene
@export var score_label: Label
@export var game_over: CanvasLayer
@export var sperm: CharacterBody2D
@export var egg: RigidBody2D
@export var egg_start: Marker2D
@export var egg_end: Marker2D

var game_running: bool
var game_over_state: bool
var scroll
var score
const SCROLL_SPEED: int = 6
var screen_size : Vector2i
var ground_height: int
var ceiling_height: int
var pipes : Array
var miracle : int = 10
const PIPE_DELAY: int = 100
const PIPE_RANGE : int = 100
var to_win: int = 9


func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Ground").texture.get_height()
	ceiling_height = $Ceiling.get_node("Ceiling").texture.get_height()
	new_game()
	
func new_game():
	game_running = false
	game_over_state = false
	miracle = 10
	score_label.text = "Time Until Miracles: " + str(miracle)
	scroll = 0
	game_over.hide()
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()
	generate_pipes()
	sperm.reset()
	
	
func start_game():
	game_running = true
	sperm.flying = true
	sperm.flap()
	$PipeTimer.start()
	
func _input(event):
	if game_over_state == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if sperm.flying:
						sperm.flap()
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
	
		var direction = egg.global_position.direction_to(sperm.global_position)
		egg.linear_velocity = direction * 150



func check_top():
	if sperm.position.y < 0:
		sperm.falling = true
		stop_game()
		
func stop_game():
	egg.linear_velocity=Vector2(0,0)
	egg.position = egg_start.position
	$PipeTimer.stop()
	game_over.show()
	sperm.flying = false
	game_running = false
	game_over_state = true

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
	if miracle == 5:
		egg.moving = "go"
	score_label.text = "Time Until Miracles: " + str(miracle)

func sperm_hit():
	sperm.falling = true
	stop_game()

func _on_ground_hit():
	sperm.falling = true
	stop_game() 
	
func _on_pipe_timer_timeout():
	generate_pipes()

func _on_game_over_restart():
	new_game()


func _on_ground_body_entered(body):
	print(body)
	_on_ground_hit()

func _on_win():
	pass


func _on_egg_body_entered(body: Node) -> void:
	print("Birthing")
	SignalBus.birth.emit()
