extends AudioStreamPlayer2D

func _ready():
	stream = preload("res://assets/Alex-Productions - Cooking Gypsy Jazz _ Cooking.mp3")
	autoplay = true
	volume_db = -15   # adjust volume
	attenuation = 0  # prevents volume drop with distance
	play()
