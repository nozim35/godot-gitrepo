extends Node2D


func _ready():

	$AnimationPlayer .play("Black_in")
	get_tree().create_timer(3).timeout.connect(black_out)
func black_out():
	$AnimationPlayer .play("Black_out")
	get_tree().create_timer(3).timeout.connect(start_menu_scene)
	
func start_menu_scene():
	get_tree().change_scene_to_file("res://Levels/Start_menu.tscn")
