extends CharacterBody2D

const SPEED = 2500

# generalnie wzrok bedize mozna tez zrobic z ray castem ale narazie mysle
# ze to bedzie lepsza opcja
# ai zrobimy z animation tree

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detection_area_area_entered(area):
	# tutaj zaczynamy poscig
	pass # Replace with function body.


func _on_detection_area_area_exited(area):
	# tutaj konczymy poscig 
	# zaczynamy patrolowanie(albo jakies ruszanie sie ciul wie jak)
	pass # Replace with function body.
