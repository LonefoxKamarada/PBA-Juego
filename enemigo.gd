extends Node2D
##extends Sprite2D

@export var player: Node2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var speed = 100

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			meFui()
			print("You selected:", self.name)
	

func _ready():
	##("/root/World/player")) 
	player = get_node("/root/World/Player")  # Asegurate de que la ruta sea correcta

func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		var velocity = direction * speed
		position += velocity * delta  # Mueve el zombie hacia el jugador

func meFui():
	##print("ME FUI" )
	position.y = 0
	randomize()
	var result = randi_range(0, 4)
	
	match result:
		0:
			position.x = randi_range(0, get_viewport_rect().size.x)
			position.y = 0
		1:
			position.y = randi_range(0, get_viewport_rect().size.y)
			position.x = 0
		2:
			position.x = randi_range(0, get_viewport_rect().size.x)
			position.y = get_viewport_rect().size.y
		3:
			position.y = randi_range(0, get_viewport_rect().size.y)
			position.x = get_viewport_rect().size.x
	
	##position.y = randi_range(0, get_viewport_rect().size.y)
	##world.score += 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	##func _on_area_2d_area_entered(area):
	##print(area.name)
	if area.name == "Area2D":  # Asegúrate de que el nodo del jugador tenga el script Player.gd adjunto
		print("Fin del juego")
		animation_player.play("game_over")
		
	##elif area.name == "MousePointer":  # Suponiendo que tienes un nodo para el puntero del mouse
	##	print("El puntero del mouse ha entrado en el área")
	##else:
	##	print(area.name)


	
	##if area.get_parent().is_in_group("player"):
		##print ("ASDA")
		##meFui()
		##animation_player.play("game_over")
		
	##pass # Replace with function body.
