extends Node

@onready var perdiste: Label = $Perdiste
@onready var labelScore: Label = $Score
var score = 0

func _process(delta):
	labelScore.text = str(score)

func gameOver():
	get_tree().change_scene_to_file("res://menu.tscn")
