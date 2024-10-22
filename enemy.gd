extends Node2D
@onready var world: Node = $".."
##@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@export var speed = 500

var player

##func _physics_process(delta):
	##position.y += speed * delta

##func meFui():
##	position.y = 0
##	randomize()
##	position.x = randi_range(0, get_viewport_rect().size.x)
##	world.score += 1

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("player"):
		print ("ASDA")
		##animation_player.play("game_over")

func _ready():
	player = get_node("/root/Player")  # Asegúrate de que el nodo del jugador esté accesible

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			meFui()
			print("You selected:", self.name)


func meFui():
	print("ME FUI" )
	position.y = 0
	randomize()
	position.x = randi_range(0, get_viewport_rect().size.x)
	world.score += 1



func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		var velocity = direction * speed
		position += velocity * delta  # Mueve el zombie hacia el jugador
	##if is_mouse_over():
		##print("Yasdasdsad:", self.name)
		##queue_free()

func is_mouse_over() -> bool:
	var collision_shape = $CollisionShape2D
	if collision_shape != null:
		var mouse_position = get_global_mouse_position()
		return collision_shape.shape and collision_shape.shape.point_inside(mouse_position)
	return false
