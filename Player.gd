extends KinematicBody2D

export (int) var speed = 500
export (int) var jump_speed = -1000
export (int) var gravity = 3000

var velocity = Vector2.ZERO

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.10
export (bool) var canMove = false


onready var control = get_node("Control")
onready var controlPanel = get_node("Control/Panel")
onready var text = get_node("Control/Panel/TextInterfaceEngine")


var easy_mode = false

func _ready():
	control.visible = false
	
	toggleEasyMode()
	toggleEasyMode()
	pass
	
	
func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
	
		
	#if Input.is_action_just_pressed("ui_left"):
		
	#	control.visible = true
	#	text.reset()
	#	text.FONT.set_size(24)
	#	text.set_color(Color(20,20,20))
	#	text.buff_text("Finally, I’m almost at the oracle.\n",0.05)
	#	text.buff_silence(0.3)
	#	text.buff_text("I think I can see something.",0.08)
	#	text.set_state(text.STATE_OUTPUT)

var can_grab = false
var grabbed_offset = Vector2()
var grabbedPoint = Vector2()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		grabbedPoint = get_global_mouse_position()

func _process(delta):
	pass

export (int) var grabYMax = 250
export (int) var grabXMax = 250



var clickTimeLeft = 100.0

var recharging = false

var createdRadius = false




func getCamera():
	return get_node("Camera2D")


func toggleEasyMode():
	
	if easy_mode:
		get_node("../platforms2").visible = false
		get_node("../TextureRect2").visible = false
		get_node("../TextureRect4").visible = false
		get_node("../TextureRect5").visible = false
		get_node("../TextureRect7").visible = false
		get_node("../TextureRect10").visible = false
		easy_mode = false
		pass
	else:
		get_node("../platforms2").visible = true
		get_node("../TextureRect2").visible = true
		get_node("../TextureRect4").visible = true
		get_node("../TextureRect5").visible = true
		get_node("../TextureRect7").visible = true
		get_node("../TextureRect10").visible = true
		
		easy_mode = true
	
	pass

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ez_mode"):
		toggleEasyMode()
	
	if !canMove:
		return
		
	
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			$AudioStreamPlayer2D.play()
			velocity.y = jump_speed

