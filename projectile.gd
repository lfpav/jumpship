extends Area2D
var dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(300,300)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_viewport().get_mouse_position()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	scale=Vector2(5,5)
	pass # Replace with function body.


func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	scale=Vector2(1,1)
	pass # Replace with function body.
