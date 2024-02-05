extends CharacterBody2D

const SPEED = 3000
# zmienne do ataku 
# zrobimy 4 area2d dla 4 stron 
# zeby nie bawic sie w obracanie
var is_left = false
var is_right = false
var is_up = false
var is_down = false


func _ready():
	pass
	
	
func _physics_process(delta):
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED * delta
	if velocity.x > 0 and (velocity.y > 0 or velocity.y == 0 or velocity.y < 0):
		$Sprite.play("move_right")
		is_right = true
		is_left = false
		is_up = false
		is_down	= false
		
	if velocity.x < 0 and (velocity.y > 0 or velocity.y == 0 or velocity.y < 0):
		$Sprite.play("move_left")
		is_right = false
		is_left = true
		is_up = false
		is_down	= false
	
	if velocity.x == 0 and velocity.y > 0:
		$Sprite.play("move_down")
		is_right = true
		is_left = false
		is_up = false
		is_down	= true
	if velocity.x == 0 and velocity.y < 0:
		$Sprite.play("move_up")
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
		
	# przy ataku bedzie sie aktywowala animacja na atak
	
		
	move_and_slide()
