extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var colliding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var myPos
var otherPos

func map( x,  in_min,  in_max,  out_min,  out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min


var locationOfInt = Rect2()

func intersect(pos1, dim1, pos2, dim2):
	
	var lhsLeft = pos1.x
	var rhsLeft = pos2.x
	var lhsTop = pos1.y
	var rhsTop = pos2.y
	
	var lhsRight = pos1.x+dim1.x
	var rhsRight = pos2.x+dim2.x
	
	var lhsBottom = pos1.y+dim1.y
	var rhsBottom = pos2.y+dim2.y
	
	var left = max(lhsLeft,rhsLeft)
	var top = max(lhsTop,rhsTop)
	var right = min(lhsRight,rhsRight)
	var bottom = min(lhsBottom,rhsBottom)
	
	#locationOfInt = Vector2(left,top)
	var width
	var height
	
	if right>left:
		width = right-left
	else:
		width = 0
	
	if bottom>top:
		height = bottom-top
	else:
		height = 0
	
	locationOfInt = Rect2(Vector2(left,top),Vector2(width,height))
	
	return Vector2(width,height)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	myPos = rect_position
	otherPos = get_node("../platforms2")
	
	#print("My Position ")
	#print(myPos)
	#print("Other Position ")
	#print(otherPos.position)
	if colliding:
		
		
		#vec4 r1 = vec4(t1pos,t1dim);
		#vec4 r2 = vec4(t2pos,t2dim);
		#print(str(texture.get_size()) + " " + str(scale) +" " + str(texture.get_size()*scale))
		
		#material.set_shader_param("t1pos", global_position)
		#material.set_shader_param("t1dim", texture.get_size() * scale)
		#material.set_shader_param("t2pos", otherPos.global_position)
		#material.set_shader_param("t2dim", otherPos.texture.get_size()*otherPos.scale)
		
		var scaledTextureOther = otherPos.rect_size;
		var scaledTextureMine = rect_size;
		
		
		var plasWOKD = intersect(rect_position,scaledTextureMine,otherPos.rect_position,scaledTextureOther)
		

		#var leftX    = max( rect_position.x, otherPos.rect_position.x );
		#var rightX   = min( rect_position.x + (texture.get_size() *scale).x, otherPos.rect_position.x + (otherPos.texture.get_size() *scale).x)
		#var topY     = max( rect_position.y, otherPos.rect_position.y );
		#var bottomY  = max( rect_position.y + (texture.get_size() *scale).y, otherPos.rect_position.y + (otherPos.texture.get_size() *scale).y)
		#colidingArea.position = locationOfInt.position
		#colidingArea.scale = Vector2(plasWOKD.x/colidingArea.texture.get_size().x,plasWOKD.y/colidingArea.texture.get_size().y)
		
		
		#if leftX < rightX and topY < bottomY:
			
			
			#var ttttt= Vector2(leftX-global_position.x,topY-global_position.y)
			
		colidingArea.rect_position = locationOfInt.position
		colidingArea.rect_size = locationOfInt.size
		
		var areaOfInter = colidingArea.get_node("areaOfIntersection")
		var colShape2D = colidingArea.get_node("areaOfIntersection/collisionShapeOfIntersection")
		var rectShape = colShape2D.shape
		
		
		rectShape.set_extents(colidingArea.rect_size/2)
		colShape2D.position =colidingArea.rect_size/2
		
		
		
		#print(wow)
		#colShape2D = colidingArea.rect_size/2
			#var plsWork = rightX/scaledTextureMine.x
			#var test = min(rightX - global_position.x, leftX-global_position.y)
			#var newX = map(rightX - global_position.x,0.0,scaledTextureOther.x,0.0,1.0)
			#var newY = map(bottomY - global_position.y ,0.0,scaledTextureOther.y,0.0,1.0)
		#	pass
		
		#print(str(position) + " " +str(texture.get_size()* scale))
		#print(str(otherPos.position) + " " +str(otherPos.texture.get_size()*otherPos.scale))
	
	pass
	

var colidingArea


var rect = [Rect2(Vector2(50,50),Vector2(200,200)),Rect2(Vector2(150,200),Vector2(200,200))] 
var color = [Color(1.0,0.0,0.0),Color(0.0,0.0,1.0)] 

func _draw(): 
	pass
	#if colliding:
	#	draw_rect(locationOfInt,Color(255,0,255,255))
	#else
	
	#for i in range(rect.size()): 
	#	draw_rect(rect[i],color[i]) 
		


func _on_Area2D_area_entered(area):
	
	if colliding:
		return
	
	colliding = true
	
	
	colidingArea = TextureRect.new()
	colidingArea.texture = load("res://platforms.png")
	colidingArea.name = "texturePlatform"
	colidingArea.expand = true
	
	
	var staticBody = StaticBody2D.new()
	staticBody.name = "areaOfIntersection"
	
	
	
	var colShape = CollisionShape2D.new()
	colShape.name = "collisionShapeOfIntersection"
	
	var shape = RectangleShape2D.new()
	#shape.set_extents(Vector2(20,20))
	colShape.set_shape(shape)
	
	#shape.set_extents(Vector2(20,20))
	
	staticBody.add_child(colShape)
	
	colidingArea.add_child(staticBody)
	
	#colidingArea.centered = false
	#colidingArea.z_index = 128
	
	
	get_node("../").add_child(colidingArea)
	
	pass # Replace with function body.



func _on_Area2D_area_exited(area):
	colliding = false
	
	
	
	#update()
	colidingArea.queue_free()
	
	#material.set_shader_param("t1pos",Vector2(0,0))
	#material.set_shader_param("t1dim",Vector2(0,0))
	#material.set_shader_param("t2pos",Vector2(0,0))
	#material.set_shader_param("t2dim",Vector2(0,0))
	
	pass # Replace with function body.
