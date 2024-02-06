extends CharacterBody2D

const SPEED = 3000
# zmienne do ataku 
# zrobimy 4 area2d dla 4 stron 
# zeby nie bawic sie w obracanie
var is_left = false
var is_right = false
var is_up = false
var is_down = false

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


func _ready():
	pass
	
	
func _physics_process(delta):
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED * delta
	# pewnie zmienimy to na katy wiec poki co zostawiam zeby bylo do demo
	if velocity.x > 0 and (velocity.y > 0 or velocity.y == 0 or velocity.y < 0):
		# $Sprite.play("move_right")
		is_right = true
		is_left = false
		is_up = false
		is_down	= false
		
	if velocity.x < 0 and (velocity.y > 0 or velocity.y == 0 or velocity.y < 0):
		# $Sprite.play("move_left")
		is_right = false
		is_left = true
		is_up = false
		is_down	= false
	
	if velocity.x == 0 and velocity.y > 0:
		# $Sprite.play("move_down")
		is_right = true
		is_left = false
		is_up = false
		is_down	= true
		
	if velocity.x == 0 and velocity.y < 0:
		# $Sprite.play("move_up")
		is_right = false
		is_left = false
		is_up = true
		is_down	= false
		
	if velocity.x == 0 and velocity.y == 0:
		$Sprite.play("idle")
		is_right = false
		is_left = false
		is_up = false
		is_down	= false
		
	if Input.is_action_pressed("attack"):
		is_attacking = true
		# trzeba zmienic gdy skonczy sie animacja
		# przy ataku bedzie sie aktywowala animacja na atak
	if velocity.x != 0 or velocity.y != 0:
		var facing = get_angle_mouse()
		'''match facing:
			# poki co gore-lewo itd podpinam pod gore bo nie mamy gotowych sprite'ow
			[0, 1, 7]:
				$Spite.play("move_up")
			2:
				$Sprite.play("move_right")
			[3, 4, 5]:
				$Sprite.play("move_down")
			6:
				$Sprite.play("move_left")
				# tu trzeba ogarnac facing a nie animacje ale to juz rano
		'''
	
	move_and_slide()

