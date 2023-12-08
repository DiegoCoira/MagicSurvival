extends Node2D

const ENEMY_SCENES: Dictionary = {
	"BOSS": preload("res://Scenes/Characters/Enemies/Boss/Boss.tscn")
}

onready var tilemap: TileMap = get_node("BossPlatform")
onready var player_detector: Area2D = get_node("PlayerDetector")
onready var Top1: Position2D = get_node("CloseEntrance/Top1")
onready var Top2: Position2D = get_node("CloseEntrance/Top2")
onready var Top3: Position2D = get_node("CloseEntrance/Top3")
onready var Bottom1: Position2D = get_node("CloseEntrance/Bottom1")
onready var Bottom2: Position2D = get_node("CloseEntrance/Bottom2")
onready var Bottom3: Position2D = get_node("CloseEntrance/Bottom3")
onready var boss_position_container: Node2D = get_node("Boss")
onready var enemy_position_container: Node2D = get_node("Ranged")



func _spawn_enemies(boss_container, enemy_container) -> void:
	for boss_position in boss_container.get_children():
		var enemy: KinematicBody2D = ENEMY_SCENES.BOSS.instance()
		enemy.global_position = boss_position.global_position
		call_deferred("add_child", enemy)
	


func _close_entrance() -> void:
	for entry_position in player_detector.get_children():
		tilemap.set_cellv(tilemap.world_to_map(Top1.global_position), 42)
		tilemap.set_cellv(tilemap.world_to_map(Top2.global_position), 42)
		tilemap.set_cellv(tilemap.world_to_map(Top3.global_position), 42)
		tilemap.set_cellv(tilemap.world_to_map(Bottom1.global_position), 43)
		tilemap.set_cellv(tilemap.world_to_map(Bottom2.global_position), 43)
		tilemap.set_cellv(tilemap.world_to_map(Bottom3.global_position), 43)
		

func _on_PlayerDetector_body_entered(_body: KinematicBody2D) -> void:
	player_detector.queue_free()
	_spawn_enemies(boss_position_container, enemy_position_container)
	_close_entrance()
