extends Node


var goldCoins = 0

signal playerHit
signal playerHit2





func change_scene_to_dead_level():
	reset_collectibles()
	get_tree().change_scene_to_file("res://Levels/DeadLevel.tscn")

func change_scene_to_dead_level2():
	reset_collectibles()
	get_tree().change_scene_to_file("res://Levels/DeadLevel2.tscn")

func reset_collectibles():
	
	goldCoins = 0

func debugShowValues():
	print( " Gold: " + str(goldCoins))





func addGoldCoins():
	goldCoins += 1

func removeGoldCoins():
	goldCoins -= 1
