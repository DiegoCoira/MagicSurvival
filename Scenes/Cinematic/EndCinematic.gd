extends Control

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var text: Label = get_node("TextBox/Text")

func end_cinematic() -> void:
	animation_player.play("end_cinematic") 

func close_game() -> void:
	get_tree().quit()
