extends Control

@export var aiText: RichTextLabel

var messages = [
	"Good job, keep going!",
	"Hurry, the time is running out!",
	"You must go fast!",
	"Lets go, don't waste time!",
	"You’re not just delivering packages, you’re delivering trust",
	"Keep rolling, you’re doing something amazing",
	"You’re the heartbeat of the hustle—keep going strong"
]

var task_count: int = 0
var max_tasks: int = 6

func _ready():
	if aiText == null:
		print(":warning: RichTextLabel not assigned in Inspector!")
		return

	randomize()
	send_pickup_message()

func _process(delta):
	if aiText:
		
		var new_size = int(aiText.size.x / 8) 
		aiText.add_theme_font_size_override("normal_font_size", new_size)

func send_pickup_message():
	aiText.text = "\nAI: Go to the restaurant and pick up the order!"
	task_count += 1

	await get_tree().create_timer(5.0).timeout
	send_next_message()

func send_next_message():
	if task_count >= max_tasks:
		aiText.text = "\nAI: :tada: Great job! You completed all deliveries!"
		return

	task_count += 1
	var message = messages[randi() % messages.size()]
	aiText.text = "\nAI: " + message

	var wait_time = randi_range(5, 10)
	await get_tree().create_timer(wait_time).timeout
	send_next_message()
