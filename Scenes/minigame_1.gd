extends Node2D

const SFX_COIN = preload("res://Assets/coin.wav")
const SFX_COIN_2 = preload("res://Assets/coin_2.wav")

@onready var themed_timer: Node2D = $ThemedTimer 

var garlic_collected = 0 
var timer_end = false 

func _ready() -> void:
	match Global.difficulty_index:
		0:
			await themed_timer.Timer(10.0) 
			timer_end = true 
				
		1:
			await themed_timer.Timer(7.0) 
			timer_end = true 
		
		2:
			await themed_timer.Timer(5.0) 
			timer_end = true 

func _process(delta: float) -> void: 
	if garlic_collected == 3: 
		if Global.minigames_done == 3: 
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn") 
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") 
	
	if timer_end: 
		Global.minigames_done -= 1 
		Global.lives -= 1 
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") 

func garlic_collect() -> void: 
	garlic_collected = garlic_collected + 1
	if garlic_collected <= 2 and garlic_collected >= 1:
		$AudioStreamPlayer2D.stream = SFX_COIN
		$AudioStreamPlayer2D.play()
	elif garlic_collected == 3:
		$AudioStreamPlayer2D.stream = SFX_COIN_2
		$AudioStreamPlayer2D.play()
	return
