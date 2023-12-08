extends Control

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var text: Label = get_node("TextBox/Text")



func end_transition() -> void:
	animation_player.play("EndCinematic")



func close_game() -> void:
	get_tree().quit()
