extends TextureButton

const SFX_COIN_2 = preload("res://Assets/coin_2.wav")

@onready var parent = $".."
@onready var player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

func _on_pressed() -> void:
	hide()
	parent.buttons_pressed += 1
	player.stream = SFX_COIN_2
	player.play()
