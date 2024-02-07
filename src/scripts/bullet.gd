extends Area2D
# w tym przypadku rozne animacje beda odpowiadaly za rozne typy pociskow

const BULLET_SPEED = 4000
const BULLET_COUNT = 4 # bedzie trzeba aktualizowac(ilosc rodzajow pociskow)
@export var direction = Vector2.ZERO # bedzie ustawiane w skrypcie gracza

# Called when the node enters the scene tree for the first time.
func _ready():
	var bullet_number = 1 + randi() % BULLET_COUNT
	$Sprite2D.play("bullet_%d" % bullet_number)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += BULLET_SPEED * delta * direction


func _on_visible_on_screen_notifier_2d_screen_exited():
	# usuwa jak wyjdzie za ekran
	# mozliwe ze bedize trzeba poprawic 
	queue_free()


func _on_area_entered(area):
	# usuwaj pocisk
	# i zadaj damage
	queue_free()
