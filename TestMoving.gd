extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var startingPos




var cameraPos
# Called when the node enters the scene tree for the first time.
func _ready():
	var globalPos = rect_position
	startingPos = rect_position
	
	

	#global_position.x = 100a
	#global_position.y = 100
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	
	cameraPos = get_node("../Player").position
	
	
		
	
	
	
	
	var windowPos = OS.get_window_position()
	rect_position.x = startingPos.x - windowPos.x  
	rect_position.y = startingPos.y - windowPos.y 
	#global_position.x = 100
	#global_position.y = 100
	pass




