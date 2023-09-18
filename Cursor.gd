extends Area2D
var redcursor = preload("res://crosshair.png")
var greencursor = preload("res://crosshairgreen.png")
@onready var sprite = get_node("Sprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture=redcursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_viewport().get_mouse_position()
	
