extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bricks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	bricks = create_2d_array(18,31,false)
	
	for i in range(31):
		for j in range(18):
			var brick = get_node("../Wall/Row"+str(i)+"/brick"+str(j))
			brick.mode = 1
			bricks[i][j] = brick
	pass # Replace with function body.


func dropRandomBrick():
	var randBrick = random_brick()
	randBrick.mode = 0
	randBrick.mass = 0.3
	randBrick.gravity_scale = 5
	
	var xVelocity = rng.randi_range(-200,200)
	var yVelocity = rng.randi_range(-200,200)
	
	var rotationVel = rng.randi_range(-5,5)
	
	#var collisionShape = CollisionShape2D.new()
	#randBrick.add_child(collisionShape)
	
	#var rectangleShape = RectangleShape2D.new()
	#rectangleShape.set_extents(Vector2(70,70))
	#collisionShape.set_shape(rectangleShape)
	
	
	
	
	randBrick.apply_impulse (Vector2(0,0),Vector2(xVelocity,yVelocity))
	#randBrick.apply_torque_impulse (500)
	randBrick.set_angular_velocity(rotationVel)
	
	var particle = Particles2D.new()
	particle.one_shot = true
	particle.amount = 50
	particle.lifetime = 0.5
	particle.process_material = load("res://explosion.tres")
	particle.z_index = 5
	randBrick.z_index = 4
	
	var sprite = randBrick.get_node("brick")
	sprite.set_texture(load("res://brick2.png"))
	randBrick.add_child(particle)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if false:
		print("")
		var randBrick = random_brick()
		randBrick.mode = 0
		randBrick.mass = 0.3
		randBrick.gravity_scale = 5
		
		var xVelocity = rng.randi_range(-200,200)
		var yVelocity = rng.randi_range(-200,200)
		
		var rotationVel = rng.randi_range(-5,5)
		
		#var collisionShape = CollisionShape2D.new()
		#randBrick.add_child(collisionShape)
		
		#var rectangleShape = RectangleShape2D.new()
		#rectangleShape.set_extents(Vector2(70,70))
		#collisionShape.set_shape(rectangleShape)
		
		
		
		
		randBrick.apply_impulse (Vector2(0,0),Vector2(xVelocity,yVelocity))
		#randBrick.apply_torque_impulse (500)
		randBrick.set_angular_velocity(rotationVel)
		
		var particle = Particles2D.new()
		particle.one_shot = true
		particle.amount = 50
		particle.lifetime = 0.5
		particle.process_material = load("res://explosion.tres")
		particle.z_index = 5
		randBrick.z_index = 4
		
		var sprite = randBrick.get_node("brick")
		sprite.set_texture(load("res://brick2.png"))
		randBrick.add_child(particle)
	
	
	pass
	
var rng = RandomNumberGenerator.new()

func dropFirstBrick():
	
	var randBrick = bricks[10][10]
	
	randBrick.mode = 0
	randBrick.mass = 0.3
	randBrick.gravity_scale = 5
		
	var xVelocity = rng.randi_range(-200,200)
	var yVelocity = rng.randi_range(-200,200)
	
	var rotationVel = rng.randi_range(-5,5)
	
	#var collisionShape = CollisionShape2D.new()
	#randBrick.add_child(collisionShape)
	
	#var rectangleShape = RectangleShape2D.new()
	#rectangleShape.set_extents(Vector2(70,70))
	#collisionShape.set_shape(rectangleShape)
	
	
	
	
	randBrick.apply_impulse (Vector2(0,0),Vector2(xVelocity,yVelocity))
	#randBrick.apply_torque_impulse (500)
	randBrick.set_angular_velocity(rotationVel)
	
	var particle = Particles2D.new()
	particle.one_shot = true
	particle.amount = 50
	particle.lifetime = 0.5
	particle.process_material = load("res://explosion.tres")
	particle.z_index = 5
	randBrick.z_index = 4
	
	var sprite = randBrick.get_node("brick")
	sprite.set_texture(load("res://brick2.png"))
	randBrick.add_child(particle)

	pass
	
func random_brick():
	rng.randomize()
	var number2 = rng.randi_range(0,17)
	var number1 = rng.randi_range(0,30)
	
	while bricks[number1][number2].mode == 0:
		number2 = rng.randi_range(0,17)
		number1 = rng.randi_range(0,30)
	
	bricks[number1][number2].mode = 0
	#bricks[number1][number2] = true
		
	#var brick = get_node("../Wall/Row"+str(number1)+"/brick"+str(number2))
	
	
	
	return bricks[number1][number2]
	pass
	
func create_2d_array(width, height, value):
	var a = []

	for y in range(height):
		a.append([])
		a[y].resize(width)

		for x in range(width):
			a[y][x] = value

	return a
