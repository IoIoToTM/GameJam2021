extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var textOther = get_node("Node2D/Control/TextInterfaceEngine")
onready var controlOther = get_node("Node2D/Control")

onready var textPlayer = get_node("../Player/Control/Panel/TextInterfaceEngine")
onready var controlPlayer = get_node("../Player/Control")
onready var controlPlayerPanel = get_node("../Player/Control/Panel")


var _timer = null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	controlOther.visible = false
	controlPlayer.visible = false

	pass # Replace with function body.


var currentDialog = 0

func playNextDialog():
	
	controlOther.visible = true
	controlPlayer.visible = true
	match currentDialog:
		0 :
			controlOther.visible = true
			textOther.reset()
			textOther.FONT.set_size(29)
			textOther.set_color(Color(20,20,20))
			textOther.buff_text("SIR! SIR! I HAVE BAD NEWS!?",0.05)
			textOther.set_state(textOther.STATE_OUTPUT)
		1 :
			controlPlayer.visible = true
			textPlayer.reset()
			textPlayer.FONT.set_size(29)
			textPlayer.set_color(Color(20,20,20))
			textPlayer.buff_text("Ok, calm down. What is it?",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		2 :
			textOther.reset()
			textOther.FONT.set_size(29)
			textOther.set_color(Color(20,20,20))
			textOther.buff_text("Well",0.05)
			textOther.buff_text("....",0.5)
			textOther.set_state(textOther.STATE_OUTPUT)
		3:
			textOther.reset()
			textOther.FONT.set_size(27)
			textOther.buff_text("You know how I was supposed to transfer the artifact safely",0.07)
			textOther.buff_text("...",0.3)
			textOther.set_state(textOther.STATE_OUTPUT)
		4:
			textPlayer.reset()
			textPlayer.buff_text("Oh no....\n",0.2)
			textPlayer.buff_text("What happened?",0.08)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		5:
			textOther.reset()
			textOther.FONT.set_size(27)
			textOther.buff_text("I lost it...\n",0.23)
			textOther.buff_text("....",0.3)
			textOther.set_state(textOther.STATE_OUTPUT)
		6:
			
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -5
			textPlayer.reset()
			textPlayer.buff_text("YOU WHAT?!?!\n",0.13)
			textPlayer.buff_text("HOW??",0.08)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		7:
			textOther.reset()
			
			textOther.buff_text("Well, I was carying it and I tripped\n",0.07)
			textOther.buff_text("....",0.3)
			textOther.set_state(textOther.STATE_OUTPUT)
		8:
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -2
			textPlayer.reset()
			textPlayer.buff_text("AND?",0.13)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		9:
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -20
			textOther.reset()
			textOther.buff_text("Well, the artifact fell down the hole in front of the altar\n",0.05)
			textOther.buff_text("....",0.3)
			textOther.buff_clear()
			textOther.buff_text("Now that I think about it, why do we even have a hole in front of the altar?!?! ",0.05)
			textOther.set_state(textOther.STATE_OUTPUT)
		10:
			textPlayer.reset()
			textPlayer.buff_text("Oh no... We NEED to get it back in place ASAP",0.07)
			textOther.buff_text("....",0.3)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		11:
			textPlayer.reset()
			textPlayer.buff_text("You do know what is going to happen if we don't return it in time, right?",0.05)
			textOther.buff_text(".....",0.3)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		12:
			textOther.reset()
			textOther.buff_text("What? The end of the world? Do you really believe in those tales?",0.05)
			textOther.buff_silence(1)
			textOther.set_state(textOther.STATE_OUTPUT)
		13:
			textPlayer.reset()
			textPlayer.buff_text("Those are NOT tales... I need to find it NOW",0.05)
			textOther.buff_silence(1)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		14:
			textOther.reset()
			#textOther.buff_text("Pfft, do you really believe the whole fate of the universe lies within this single artifact?",0.05)
			textOther.buff_text("Pfft, as if the \"WHOLE\" fate of the universe lies on this specific artifact",0.05)
			textOther.buff_silence(0.2)
			textOther.set_state(textOther.STATE_OUTPUT)
		15:
			textPlayer.reset()
			textPlayer.buff_text("YES! And if we don't return it, the fabric of space is going to destroy itself",0.05)
			#textOther.buff_silence(0.4)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
			
		16:
			
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -5
			textPlayer.reset()
			textPlayer.buff_text("OH NO.... WHAT IS THIS",0.15)
			textOther.buff_silence(1)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
			
			get_node("../Player/Music").play()

		17:
			
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -20
			textOther.reset()
			textOther.buff_text("!!!! An earthquake?!?!",0.1)
			textOther.buff_silence(1)
			textOther.set_state(textOther.STATE_OUTPUT)
		18:
			
			textPlayer.reset()
			textPlayer.buff_text("No.... This is the start....\n",0.12)
			textPlayer.buff_text("I'll get to the cave bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		19:
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -5
			textPlayer.reset()
			textPlayer.buff_text("WHAT THE!??!?!?!?",0.04)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
			
			textOther.reset()
			textOther.buff_silence(0.2)
			textOther.buff_text("WHAT?!?!?!",0.1)
			textOther.set_state(textOther.STATE_OUTPUT)
		20:
			textOther.reset()
			textOther.buff_silence(0.2)
			textOther.buff_text("THIS IS REAL?!?!",0.1)
			textOther.set_state(textOther.STATE_OUTPUT)
		21:
			textPlayer.reset()
			textPlayer.buff_text("IT ALREADY STARTED?!?! I NEED TO GO!",0.04)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		22:
			
			get_node("../Player/Control/Panel/TextInterfaceEngine/AudioStreamPlayer2D").volume_db = -20
			textPlayer.reset()
			textPlayer.buff_text("Move and jump with the WASD or arrow keys!",0.04)
			textPlayer.buff_silence(1.5)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		23:
			textPlayer.reset()
			textPlayer.buff_text("WHY DID I SAY THAT? WHAT IS HAPPENING? I need to find the artifact fast!",0.04)
			textPlayer.buff_silence(1)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		24:
			controlOther.visible = false
			controlPlayerPanel.visible = false
		25: 
			get_node("../Player").canMove = false
			controlPlayerPanel.visible = true
			textPlayer.reset()
			textPlayer.buff_text("Try to FIND the LOST platform on your desktop by moving the window around",0.04)
			textPlayer.buff_silence(2)
			textPlayer.buff_clear()
			textPlayer.buff_text("(to toggle easy mode on and off press h)",0.04)
			textPlayer.buff_silence(2)
			textPlayer.buff_clear()
			textPlayer.buff_text("WHAT IS HAPPENING? WHY AM I SAYING THIS",0.04)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
			get_node("../Area2D/CollisionShape2D").queue_free()
		26:
			controlPlayerPanel.visible = false
		27:
			get_node("../Player").canMove = false
			controlPlayerPanel.visible = true
			textPlayer.reset()
			textPlayer.buff_text("THE ARTIFACT!! Now I have to hurry back and return it",0.04)
			textPlayer.buff_silence(1)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
			get_node("../Area2D2/CollisionShape2D").queue_free()
		28:
			controlPlayerPanel.visible = false
		29:
			get_node("../Player").canMove = false
			controlPlayerPanel.visible = true
			textPlayer.reset()
			textPlayer.buff_text("FINALLY! Please work, please work!",0.04)
			textPlayer.buff_silence(1)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		30:
			#controlPlayerPanel.visible = false
			_timer.stop()
			
			get_node("../ParallaxBackground/Wall").visible = false
			get_node("../ParallaxBackground3/Wall").visible = true
			textPlayer.reset()
			textPlayer.buff_text("YES YES YES! I DID IT! The universe is saved!",0.04)
			textPlayer.buff_silence(1)
			#textPlayer.buff_text("I'll get to the ravine bef-",0.05)
			textPlayer.set_state(textPlayer.STATE_OUTPUT)
		31:
			controlPlayerPanel.visible = false
			get_node("../TheEnd").visible = true
	
	currentDialog = currentDialog+1
	pass

func setTextOfInterface(text,interfacePath):
	
	
	var interface
	if interfacePath == "player":
		interface = get_node("../KinematicBody2D/Control/Panel/TextInterfaceEngine")
		get_node("../KinematicBody2D/Control").visible = true
	else:
		interface = get_node("Node2D/Control/TextInterfaceEngine")
		get_node("Node2D/Control").visible = true
	
	interface.reset()
	interface.FONT.set_size(29)
	interface.set_color(Color(20,20,20))
	interface.buff_text(text,0.05)
	interface.set_state(interface.STATE_OUTPUT)
	
	pass

func startText():
	
	#control.visible = true
	#text1.reset()
	#text1.FONT.set_size(29)
	#text1.set_color(Color(20,20,20))
	#text1.buff_text("SIR! SIR! I HAVE BAD NEWS!?",0.05)
	#text1.set_state(text1.STATE_OUTPUT)
	
	
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var rng = RandomNumberGenerator.new()

func shakeAndDrop(random):
	
	rng.randomize()
	get_node("../").isShaking = true
	if random:
		var numOfBricks = rng.randi_range(1,4)
		
		while numOfBricks!=0:
			get_node("../ParallaxBackground/A").dropRandomBrick()
			numOfBricks = numOfBricks-1
		
		get_node("../Player/Breaking").pitch_scale = rng.randf_range(1.0,1.4)
		get_node("../Player/Breaking").play()
		
		pass
	else:
		get_node("../ParallaxBackground/A").dropFirstBrick()
		get_node("../Player/Breaking").pitch_scale = rng.randf_range(1.0,1.4)
		get_node("../Player/Breaking").play()
	yield(get_tree().create_timer(0.15), "timeout")
	
	get_node("../").isShaking = false
	
	pass

func _on_TextInterfaceEngine_buff_end():
	
	if currentDialog == 16:
		get_node("../").isShaking = true
	
	if currentDialog ==17:
		get_node("../").isShaking = false
	
	if currentDialog == 19:
		shakeAndDrop(false)
		
		
		pass
	
	if currentDialog == 20:
		return
		
	
		
	if currentDialog == 23:
		
		
		_timer = Timer.new()
		add_child(_timer)
		
		_timer.connect("timeout",self,"_on_timer_timeout")
		_timer.set_wait_time(5)
		_timer.set_one_shot(false)
		_timer.start()
		
		pass
	if currentDialog == 24 or currentDialog == 26 or currentDialog == 28 or currentDialog == 30:
		get_node("../Player").canMove = true
		
	if currentDialog == 28:
		get_node("../artefact").visible = false
		artifactTaken = true
		get_node("../platforms3/Area2D/CollisionShape2D").disabled = false
		
		
	if currentDialog == 30:
		get_node("../artefact2").visible = true
		
		
	yield(get_tree().create_timer(0.6), "timeout")
	playNextDialog()
	pass # Replace with function body.


func _on_timer_timeout():
	shakeAndDrop(true)
	pass

func _on_TextInterfaceEngine1_buff_end():
	yield(get_tree().create_timer(0.6), "timeout")
	playNextDialog()
	pass # Replace with function body.


var alreadySaid = false

var artifactTaken = false



func _on_Area2D_body_entered(body):
	
	if body.position.y>700 and body.name == "Player" and !artifactTaken:
		alreadySaid = false
	
	if body.position.y<500 and body.name == "Player" and artifactTaken:
		alreadySaid = false
	
	
	if (!alreadySaid) and body.name == "Player":
		playNextDialog()
		alreadySaid = true
	
	
	
	pass # Replace with function body.
