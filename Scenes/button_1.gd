extends TextureButton
@onready var parent = $".."

@onready var player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

func _on_pressed() -> void: #YOU NEED TO CONNECT THIS SIGNAL FROM THE TAB NEXT TO INSPECTOR!!
	hide()
	parent.buttons_pressed += 1
	player.stream = AudioStreamWAV.load_from_file("res://Assets/coin_2.wav")
	player.play()
