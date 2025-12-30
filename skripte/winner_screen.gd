
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GoldValue.text = str(Global.goldCoins)



	





func _on_button_pressed():
	Global.reset_collectibles()
	get_tree().change_scene_to_file("res://Levels/StartMenu.tscn")
