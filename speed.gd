extends Sprite2D

var collect = false 

func _on_area_2d_body_entered(body):
	if body.get("TYPE") == "res://player_2.tscn" && collect == false :
		collect = true 
		body.speed = 100000000000000
		$Timer.start()

func _on_timer_timeout():
	get_parent().get_node("res://player_2.tscn").speed = 100
	queue_free()



