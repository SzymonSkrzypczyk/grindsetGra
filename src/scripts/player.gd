extends CharacterBody2D

const SPEED = 3000
const DASH_SPEED = 12000
const DASH_DURATION = 0.2
@onready var bullet = preload("res://src/scenes/bullet.tscn")
@onready var dash = $Dash
# trzeba bedizie zrobic kolejne 4 zmienne zeby dobrze ustawiac pociski
# poki co beda sie tworzyly na pozycji gracza
# i bedzie trzeba zmienic facing 

# zmienne do ataku wrecz
# zrobimy 4 area2d dla 4 stron 
# zeby nie bawic sie w obracanie

var is_attacking = false

enum LookingPosition{
	UP,
	UP_RIGHT,
	RIGHT,
	BOTTOM_RIGHT,
	BOTTOM,
	BOTTOM_LEFT,
	LEFT,
	UP_LEFT
}


func get_angle_mouse():
	var position = get_global_mouse_position() - self.get_global_position()
	var degrees = rad_to_deg(atan2(position.y, position.x))
	if -125 < degrees and degrees< -50:
		return LookingPosition.UP
	elif -50 <= degrees and degrees < -25:
		return LookingPosition.UP_RIGHT
	elif -25 <= degrees and degrees < 15:
		return LookingPosition.RIGHT
	elif 15 <= degrees and degrees < 40:
		return LookingPosition.BOTTOM_RIGHT
	elif 40 <= degrees and degrees < 140:
		return LookingPosition.BOTTOM
	elif 140 <= degrees and degrees < 160:
		return LookingPosition.BOTTOM_LEFT
	elif -150 <= degrees and degrees < 160:
		return LookingPosition.UP_LEFT
	else:
		return LookingPosition.LEFT # nie pytajcie dziala XD
		# cos pokickalem z katami pozno bylo ale smiga 
		
func create_bullet():
	var direction = (get_global_mouse_position() - self.global_position).normalized()
	var new_bullet = bullet.instantiate()
	new_bullet.position = self.global_position
	new_bullet.direction = direction
	#var angle = atan2(direction.x, direction.y)
	# new_bullet.rotation= -angle
	# sprawdzanie
	get_parent().add_child(new_bullet)

func _ready():
	pass
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("dash") and dash.can_dash:
		# jesli przy dashu nie ma zmiany hp to sprawdzamy to
		# w przypadku gdy jest kolizja
		dash.start_dash(DASH_DURATION)
	
	var speed = DASH_SPEED if dash.is_dashing() else SPEED
	
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	# pewnie zmienimy to na katy wiec poki co zostawiam zeby bylo do demo
		
	if velocity.x == 0 and velocity.y == 0:
		$Sprite.play("idle")
		
	if Input.is_action_pressed("attack"):
		is_attacking = true
		# trzeba zmienic gdy skonczy sie animacja
		# przy ataku bedzie sie aktywowala animacja na atak
		
	if Input.is_action_just_pressed("shoot"):
		create_bullet()
		
	if velocity.x != 0 or velocity.y != 0:
		var facing = get_angle_mouse()
		# narazie bez gora-lewo itd bo nie ma animacji
		if facing in [0, 1, 7]:
			$Sprite.play("move_up")
		elif facing == 2:
			$Sprite.play("move_right")
		elif facing in [3, 4, 5]:
			$Sprite.play("move_down")
		else:
			$Sprite.play("move_left")
		
	
	move_and_slide()

