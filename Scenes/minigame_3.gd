extends Node2D
@onready var ships = 3
@onready var is_hit: bool = false
@onready var life1: TextureRect = $"HBoxContainer/Life1"
@onready var life2: TextureRect = $"HBoxContainer/Life2"
@onready var life3: TextureRect = $"HBoxContainer/Life3"
@onready var ship: CharacterBody2D = $"Player"
@onready var shot = 0
@onready var shotlabel: RichTextLabel = $"RichTextLabel"

@onready var meteors = [$Area2D, $Area2D2, $Area2D3, $Area2D4, $Area2D5, $Area2D6, $Area2D7, $Area2D8]
var meteor_speeds = {}
var meteor_speed_min = 220
var meteor_speed_max = 320
var spawn_x_min = -100
var spawn_x_max = 600
var spawn_y_min = -1900
var spawn_y_max = -880
var screen_size: Vector2
var spawning_active = false

func _ready() -> void:
	screen_size = get_viewport_rect().size
	for m in meteors:
		m.visible = false
		m.position.x = randf_range(spawn_x_min, spawn_x_max)
		m.position.y = randf_range(spawn_y_min, spawn_y_max)
		meteor_speeds[m] = randf_range(meteor_speed_min, meteor_speed_max)

	await get_tree().create_timer(3.0).timeout
	for m in meteors:
		m.visible = true
	spawning_active = true

func reset_meteor(m: Area2D) -> void:
	m.position.x = randf_range(spawn_x_min, spawn_x_max)
	m.position.y = randf_range(spawn_y_min, spawn_y_max)
	meteor_speeds[m] = randf_range(meteor_speed_min, meteor_speed_max) + shot * 10

func _process(delta: float) -> void:
	if spawning_active:
		for m in meteors:
			m.position.y += meteor_speeds[m] * delta
			if m.position.y > screen_size.y + 50:
				reset_meteor(m)

	if ships == 3:
		life1.visible = true
		life2.visible = true
		life3.visible = true

	elif ships == 2:
		life1.visible = true
		life2.visible = true
		life3.visible = false

	elif ships == 1:
		life1.visible = true
		life2.visible = false
		life3.visible = false

	elif ships == 0:
		life1.visible = false
		life2.visible = false
		life3.visible = false
		Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")

	if shot == 8:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")

	shotlabel.text = str(8 - shot)

func handle_bump() -> void:
	if is_hit:
		return

	is_hit = true
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_lose.ogg")
	$AudioStreamPlayer2D.play()
	ships -= 1
	shot = 0
	for m in meteors:
		reset_meteor(m)
	ship.position = Vector2(-452, 65)

	await get_tree().create_timer(0.2).timeout
	is_hit = false

func _on_area_2d_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_2_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_3_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_4_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_5_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_6_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_7_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_8_ship_bumped() -> void:
	handle_bump()

func _on_area_2d_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_2_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_3_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_4_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_5_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_6_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_7_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
func _on_area_2d_8_meteor_bump() -> void:
	shot += 1
	$AudioStreamPlayer2D.stream = AudioStreamOggVorbis.load_from_file("res://Assets/sfx_laser1.ogg")
	$AudioStreamPlayer2D.play()
