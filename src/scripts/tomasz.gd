extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("base")

func _physics_process(delta):
	pass


func _on_interaction_area_area_exited(area):
	pass # Replace with function body.


func _on_interaction_area_area_entered(area):
	pass # Replace with function body.
