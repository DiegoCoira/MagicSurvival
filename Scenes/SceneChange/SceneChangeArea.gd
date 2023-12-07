extends Area2D

onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")



func _on_SceneChangeArea_body_entered(_body: KinematicBody2D) -> void:
	collision_shape.set_deferred("disbled", true)
	SceneTransitor.start_transition_to("res://Scenes/Cave/CaveWorld.tscn")
