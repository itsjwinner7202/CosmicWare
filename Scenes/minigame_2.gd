extends Node2D
@onready var themed_timer: Node2D = $timer_screen

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	match Global.difficulty_index:
		0:
			await themed_timer.Timer(4.0) #accessing a function from this node
			#after this is compeleted...
			timer_end = true # now we're saying "oh ye you ran out of time"
				
		1:
			await themed_timer.Timer(3.0) #accessing a function from this node
			#after this is compeleted...
			timer_end = true # now we're saying "oh ye you ran out of time"
		
		2:
			await themed_timer.Timer(2.0) #accessing a function from this node
			#after this is compeleted...
			timer_end = true # now we're saying "oh ye you ran out of time"


func _process(delta: float) -> void:
	if buttons_pressed == 8:
		if Global.minigames_done == 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
