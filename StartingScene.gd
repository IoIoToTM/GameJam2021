extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var randomBrickRemove = load("res://Transparency.cs")
	#var brickScript = randomBrickRemove.new()
	#brickScript.makeRandomBrickFall()
	print("wow")
	rng.randomize()
	pass # Replace with function body.


var isShaking = false

var rng = RandomNumberGenerator.new()
func shakeWindow():
	
	
	
	var xOffset = rng.randi_range(-2,2)
	var yOffset = rng.randi_range(-2,2)
	
	
	
	var position = OS.get_window_position()
	var xPos = position.x
	var yPos = position.y
	
	
	var newXPos = xPos+xOffset
	var newYPos = yPos+yOffset
	
	OS.set_window_position(Vector2(newXPos,newYPos))
	#print ("new position is " + str(newXPos) + " " + str(newYPos) + "random is " + str(xOffset) + " " + str(yOffset))
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isShaking:
		shakeWindow()
	
	pass
