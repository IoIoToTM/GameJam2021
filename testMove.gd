extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var toAdd = Vector2(2,0)
	
	print(position.x)
	if position.x < 400 and toAdd.x > 0:
		toAdd = Vector2(2,0);
	elif position.x>800 and toAdd.x < 0:
		toAdd = Vector2(-2,0);
	
	position += toAdd
	pass
