extends Node2D


var goldCoins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func reset_collectibles():
	# Setze die Werte der Sammlerstücke zurück
	goldCoins = 0

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		reset_collectibles()
		# Verzögere das Laden der neuen Szene
		await get_tree().create_timer(0.01).timeout
		get_tree().change_scene_to_file("res://Levels/DeadLevel.tscn")
