extends Sprite

var velocitat := 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)
	rotation_degrees = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direccio = Vector2.ZERO
	if Input.is_action_pressed("ves_dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("ves_esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("ves_amunt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("ves_abaix"):
		direccio += Vector2.DOWN
	direccio = direccio.normalized()
	position += direccio * velocitat * delta
