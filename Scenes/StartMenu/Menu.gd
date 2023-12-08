extends Control



func _on_PLAY_pressed():
	get_tree().change_scene("res://Scenes/FirstTown/InitialTownWorld.tscn")


func _on_QUIT_pressed():
	get_tree().quit()
