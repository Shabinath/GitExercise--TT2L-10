extends TileMap

func _on_MazeBlock_body_entered(body):
	if body.is_in_group("Player"):
		body.block_collision()

func _on_MazeBlock_body_exited(body):
	if body.is_in_group("Player"):
		body.block_exit()
