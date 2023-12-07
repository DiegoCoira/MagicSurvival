extends Node2D

const ENEMY_SCENES: Dictionary = {
	"MAGE": preload("res://Scenes/Characters/Enemies/Mage/Mage.tscn")
}

var num_enemies:  int 
onready var tilemap: TileMap = get_node("Background")
onready var first_player_detector: Area2D = get_node("FirstPlayerDetector")
onready var second_player_detector: Area2D = get_node("SecondPlayerDetector")
onready var third_player_detector: Area2D = get_node("ThirdPlayerDetector")
onready var fourth_player_detector: Area2D = get_node("ForthPlayerDetector")
onready var first_enemys_position_container: Node2D = get_node("FirstEnemys")
onready var second_enemys_position_container: Node2D = get_node("SecondEnemys")
onready var third_enemys_position_container: Node2D = get_node("ThirdEnemys")
onready var fourth_enemys_position_container: Node2D = get_node("FourthEnemys")


func _spawn_enemies(enemy_container) -> void:
	for enemy_position in enemy_container.get_children():
		var enemy: KinematicBody2D = ENEMY_SCENES.MAGE.instance()
		enemy.global_position = enemy_position.global_position
		call_deferred("add_child", enemy)

func _on_FirstPlayerDetector_body_entered(body: KinematicBody2D) -> void:
	first_player_detector.queue_free()
	_spawn_enemies(first_enemys_position_container)


func _on_SecondPlayerDetector_body_entered(body: KinematicBody2D) -> void:
	second_player_detector.queue_free()
	_spawn_enemies(second_enemys_position_container)


func _on_ThirdPlayerDetector_body_entered(body: KinematicBody2D) -> void:
	third_player_detector.queue_free()
	_spawn_enemies(third_enemys_position_container)


func _on_ForthPlayerDetector_body_entered(body: KinematicBody2D) -> void:
	fourth_player_detector.queue_free()
	_spawn_enemies(fourth_enemys_position_container)
