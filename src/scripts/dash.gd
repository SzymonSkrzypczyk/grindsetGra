extends Node2D

@onready var timer = $Timer	
@onready var delay_timer = $DelayTimer
const DASH_DELAY = 0.5
var can_dash = true
# reszte feauture'ow dodamy potem poki co jest funkcjonalny dash :)


func start_dash(duration):
	timer.wait_time = duration
	delay_timer.wait_time = DASH_DELAY + duration
	timer.start()
	delay_timer.start()
	can_dash = false
	

func is_dashing():
	return !timer.is_stopped()


func _on_delay_timer_timeout():
	can_dash = true
