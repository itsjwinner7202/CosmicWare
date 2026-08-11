extends Area2D
@onready var player: CharacterBody2D = $"../Player" # grabs the parent node
@onready var player_area = $"../Player/Area2D"
@onready var fire: Area2D = $"../Player/Area2D2"

# make a signal
signal meteor_bump
signal ship_bumped

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if fire.overlaps_area(self) and fire.visible == true: # checks if overlapping
		if self.visible:
			emit_signal("meteor_bump") #signal broadcast
			self.hide() #removed from player sight; collected
	elif player_area.overlaps_area(self) and fire.visible == false:
		if self.visible:
			emit_signal("ship_bumped")
			
