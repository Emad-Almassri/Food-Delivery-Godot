extends Control

# Predefined instructions
var instructions = [
	"Pickup the pizza from the restaurant to home 1 or 2 or 3",
	"Pickup the burger from the restaurant to home 1 or 2 or 3",
	"Pickup the chicken from the restaurant to home 1 or 2 or 3"
]

@onready var vbox = $PanelContainer/ScrollContainer/VBoxContainer

var message_count = 0
var max_messages = 6
var timer: Timer

func _ready():
	# --- Add a green "Hello World" label ---
	var test_label = RichTextLabel.new()
	test_label.bbcode_enabled = true
	test_label.text = "[color=green]Hello World[/color]"
	test_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	test_label.custom_minimum_size = Vector2(0, 24)
	vbox.add_child(test_label)
	
	# --- Create timer for AI messages ---
	timer = Timer.new()
	timer.wait_time = 15
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	
	# Connect the timeout signal correctly
	timer.timeout.connect(Callable(self, "print_instruction"))
	
	# Show first AI message immediately
	print_instruction()


func print_instruction():
	if message_count >= max_messages:
		timer.stop()
		return
	
	# Pick a random instruction
	var message_text = instructions.pick_random()
	
	# Create a RichTextLabel for the AI message
	var message = RichTextLabel.new()
	message.bbcode_enabled = true
	message.text = "[color=yellow]AI:[/color] " + message_text
	message.scroll_active = true
	message.scroll_following = true
	message.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	message.custom_minimum_size = Vector2(0, 24)
	
	# Add message to VBoxContainer
	vbox.add_child(message)
	
	# Scroll to bottom
	var scroll = vbox.get_parent() as ScrollContainer
	scroll.scroll_vertical = scroll.get_v_scroll_bar().max_value
	
	message_count += 1
