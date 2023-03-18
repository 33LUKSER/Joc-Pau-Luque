extends KinematicBody2D

var velocitat := 200
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN*500
var direccio = Vector2.ZERO
var salt := 400
var punts := 0
var position_de_plataforma = Vector2(300,150)

# Called when the node enters the scene tree for the first time.
func _ready():
#	position = Vector2(0,0)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moviment.x = 0
	direccio.x = 0
	if Input.is_action_pressed("ves_dreta"):
		direccio += Vector2.RIGHT
		$Label.text = "DRETA"
	if Input.is_action_pressed("ves_esquerra"):
		direccio += Vector2.LEFT
		$Label.text = "ESQUERRA"
	if Input.is_action_just_pressed("ves_amunt") and is_on_floor():
		$Label.text = "SALTA"
		moviment.y = -salt
		
	moviment += direccio.normalized() * velocitat
	moviment += gravetat*delta
	moviment = move_and_slide(moviment,Vector2.UP)
	
	if direccio.x == 0:
		$anim.stop()
		$Sprite.frame = 0
	elif direccio.x != 0:
		if $anim.is_playing() == false:
			$anim.play("movpersonatge")
func _punt_tocat(body):
	punts += 1
	$Label2.text = "Count: %d" % [punts]


		


func _on_Area2D_body_exited(body):
	body.global_position = position_de_plataforma
