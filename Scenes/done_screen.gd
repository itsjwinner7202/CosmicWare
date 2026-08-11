extends Node2D

@onready var lives: HBoxContainer = $LivesContainer
@onready var life: TextureRect = $LivesContainer/Life
@onready var life2: TextureRect = $LivesContainer/Life2
@onready var life3: TextureRect = $LivesContainer/Life3
@onready var life4: TextureRect = $LivesContainer/Life4
@onready var life5: TextureRect = $LivesContainer/Life5
@onready var splashtext: RichTextLabel = $splash
@onready var toasttext: RichTextLabel = $toast
@onready var btntext: RichTextLabel = $RichTextLabel
@onready var btncolor: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

		4:
			life.hide()
		3:
			life.hide()
			life2.hide()
		2:
			life.hide()
			life2.hide()
			life3.hide()
		1:
			life.hide()
			life2.hide()
			life3.hide()
			life4.hide()
		0:
			lives.hide() # just hides everything
			splashtext.text = "Game Over!"
			toasttext.text = "Insert coin to start over :)"
			btntext.text = "Insert Coin"
			btncolor.color = Color(0.965, 0.745, 0.0, 1.0)
			


func mainpressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
