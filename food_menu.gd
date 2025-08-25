extends Node2D

@onready var food_menu := $CanvasLayer/FoodMenu

func _ready():
	# Load and resize icons
	var pizza_icon = load_scaled_icon("res://assets/pizza.jpg", 32, 32)
	var burger_icon = load_scaled_icon("res://assets/burger.png", 32, 32)
	var sandwich_icon = load_scaled_icon("res://assets/sandwich.webp", 32, 32)

	# Add items to the OptionButton with scaled icons
	food_menu.clear()
	food_menu.add_icon_item(pizza_icon, "Pizza", 0)
	food_menu.add_icon_item(burger_icon, "Burger", 1)
	food_menu.add_icon_item(sandwich_icon, "Sandwich", 2)

	food_menu.connect("item_selected", Callable(self, "_on_food_selected"))

func load_scaled_icon(path: String, width: int, height: int) -> Texture2D:
	var img = load(path).get_image()
	img.resize(width, height, Image.INTERPOLATE_LANCZOS)
	var tex = ImageTexture.create_from_image(img)
	return tex

func _on_food_selected(index):
	match index:
		0: spawn_product("pizza")
		1: spawn_product("burger")
		2: spawn_product("sandwich")

func spawn_product(product_id: String):
	print("Spawn:", product_id)
