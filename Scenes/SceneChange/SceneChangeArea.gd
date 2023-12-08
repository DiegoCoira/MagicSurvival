extends Area2D

onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")



func _on_SceneChangeArea_body_entered(_body: KinematicBody2D) -> void:
	var current_scene_path = get_tree().current_scene.get_filename() 
	collision_shape.set_deferred("disbled", true)
	match current_scene_path:
		"res://Scenes/FirstTown/InitialTownWorld.tscn":
			SceneTransitor.start_transition_to("res://Scenes/Cave/CaveWorld.tscn")
		"res://Scenes/Cave/CaveWorld.tscn":
			SceneTransitor.start_transition_to("res://Scenes/OutsideWorld/OutsideWorld.tscn")
