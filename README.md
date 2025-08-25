# 2D Meal Delivery Game - Godot Project

## Project Overview
This is a **2D delivery game** built in **Godot Engine 4.x**.  
The player takes on the role of a delivery person tasked with **picking up meals from a restaurant and delivering them to homes**.  

The game features an **AI assistant** implemented with the **NobodyWho node**, which provides motivational and guidance messages to the player throughout the game.

## NOTE: This game is still under development and not yet complete.

## Gameplay

- **Objective:** Deliver meals from the restaurant to homes as quickly as possible.  
- **AI Assistant:** The AI sends messages to encourage the player and guide them on where to go next.  
- **Levels:**  
  - **Level 1:** 1 restaurant, 3 homes  
  - **Level 2:** 1 restaurant, 5 homes  

The game progresses dynamically, with the AI updating the player whenever they reach the restaurant or a home.

## Project Structure

```
world (Node2D) # Root node
├─ Camera2D # Main camera
├─ TileMap # Game map (restaurant, houses, roads)
├─ Resturant (Area2D) # Restaurant pickup area
│ └─ CollisionShape2D
├─ Home1..Home5 (Area2D) # Delivery locations (houses)
│ └─ CollisionShape2D
├─ DeliveryMan (characterBody2D) # The player character
├─ BackgroundMusic2D (AudioStream) # Background music
├─ MapBorders (StaticBody2D) # Prevents player from leaving map
├─ CanvasLayer # UI elements (score, timer, etc.)
└─ AI (Control) # AI system (NobodyWho)
    ├─ RichTextLabel # Displays AI messages
    ├─ NobodyWhoModel # AI model for logic
    └─ NobodyWhoChat # Chat/message handler
```

## Features

- **Dynamic AI messages:** Encourages the player and guides them during deliveries.  
- **Randomized delivery homes:** Each time the player picks up a meal, the delivery home is randomly chosen.  
- **Multiple levels:** Level difficulty increases by adding more homes.  
- **Responsive UI:** The `RichTextLabel` dynamically displays AI messages in real-time.

## How to Play

1. Start the game.  
2. Move the player to the **restaurant** to pick up a meal.  
3. Follow the AI assistant’s messages to deliver the meal to a home.  
4. Repeat until all deliveries for the level are completed.  
5. Proceed to the next level to face more homes.

## Requirements

- **Godot Engine 4.x**  
- The project uses **Area2D** nodes for triggers and a **RichTextLabel** for AI messages.

## Notes

- Ensure the `RichTextLabel` node is correctly assigned in the AI Control node.  
- The AI messages are managed by a `NobodyWho` model that is integrated in `NobodyWhoChat`.  
- Adjust the number of homes or AI messages by editing the corresponding arrays in the scripts.


## Video 

-  https://drive.google.com/drive/folders/1GuWwQ7Te1peuWvZn_-JbOMWIdjA2H36b?usp=sharing