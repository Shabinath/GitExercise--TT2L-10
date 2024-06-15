extends Sprite2D

var collect = false 

func _on_area_2d_body_entered(body):
<<<<<<< HEAD
	if body.get("TYPE") == "res://player_2.tscn" && collect == false :
		collect = true 
		body.speed = 100000000000000
		$Timer.start()

func _on_timer_timeout():
	get_parent().get_node("res://player_2.tscn").speed = 100
	queue_free()



=======
	if body.get("TYPE") == "player" && collect == false :
		collect = true 
		body.speed = 180
		$disse.play("collect")
		$Timer.start()

func _on_timer_timeout():
	get_parent().get_node("player").speed = 100
	queue_free()
>>>>>>> da19ea1417fd3ee0c666de307ed784b2999b5fbd
