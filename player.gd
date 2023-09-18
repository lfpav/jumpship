extends Node2D
var mainPlayer
var char2;var char3
var formation = {
	1: [Vector2(100,0),Vector2(-100,0)],
	2: [Vector2(0,100),Vector2(0,-100)]
}
@export var mainCharId = 1
@export var char2Id = 2
@export var char3Id = 3
@export var currentFormation = 1:
	get:
		return currentFormation
	set(value):
		_beginFormMovement()
		if value>2||value<1:
			currentFormation=1
		else:
			currentFormation=value


func _wasdMove(Char):
	Char.dir = Vector2.ZERO
	Char.dir.x = Input.get_axis("move_left","move_right")
	Char.dir.y = Input.get_axis("move_up","move_down")
	Char.position+=Char.dir.normalized()*mainPlayer.speed*get_process_delta_time()
	

func _beginFormMovement():
	if char2 is Node2D:
		char2.following = false
	if char3 is Node2D:
		char3.following = false
	
func _setCharDirtoForm(Char,form,CharID):
	Char.dir = Vector2.ZERO
	var tempdir =   mainPlayer.position + formation[form][CharID] - Char.position
	if abs(tempdir.x)>= 5 || abs(tempdir.y)>=5:
		Char.dir = tempdir
func _moveChartoPos(Char,being_followed):
	if abs(Char.dir.x)>=50 || abs(Char.dir.y)>=50:
		Char.position+=Char.dir.normalized()*Char.speed*get_process_delta_time()
	elif abs(Char.dir.x) >= 5 || abs(Char.dir.y)>=5:
		if Char.speed > being_followed.speed:
			Char.position+=Char.dir.normalized()*being_followed.speed*get_process_delta_time()
		else:
			Char.position+=Char.dir.normalized()*Char.speed*get_process_delta_time()
func _CharMatcher(CharId):
	match CharId:
		1:
			return preload("res://pyromancer.tscn").instantiate()
		2:
			return preload("res://gunslinger.tscn").instantiate()
		3:
			return preload("res://pirate.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	mainPlayer=_CharMatcher(mainCharId)
	char2=_CharMatcher(char2Id)
	char3=_CharMatcher(char3Id)
	add_child(mainPlayer)
	add_child(char2)
	add_child(char3)
	mainPlayer.position.x=300
	mainPlayer.position.y=300
	char2.position.x = 500
	char2.position.y = 500
	char3.position.x=800
	char3.position.y=150
			



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_wasdMove(mainPlayer)
	#if char2.following==false:
	_setCharDirtoForm(char2,currentFormation,0)
	_moveChartoPos(char2,mainPlayer)
	#else:
		#_wasdMove(char2)
	#if char3.following==false:
	_setCharDirtoForm(char3,currentFormation,1)
	_moveChartoPos(char3,mainPlayer)
	#else:
		#_wasdMove(char3)
		
	




func _on_cursor_area_entered(area):
	get_node("Cursor/Sprite").texture=get_node("Cursor").greencursor
	
	pass # Replace with function body.


func _on_cursor_area_exited(area):
	get_node("Cursor/Sprite").texture=get_node("Cursor").redcursor

