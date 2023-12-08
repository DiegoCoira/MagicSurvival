extends CanvasLayer

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var text: Label = get_node("TextBox/Text")

var finished: bool = false

func _ready() -> void:
	animation_player.play("cinematic")

func _animation_end() -> void:
	assert(get_tree().change_scene("res://Scenes/FirstTown/InitialTownWorld.tscn") == OK)
	
