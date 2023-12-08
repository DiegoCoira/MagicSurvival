extends Enemy

onready var hitbox: Area2D = get_node("Hitbox")

func end_game():
	EndCinematic.close_game()

func _process(_delta: float) -> void:
	hitbox.knockback_direction = velocity.normalized()

