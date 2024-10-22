extends "res://enemy.gd"


##extends RigidBody2D
##extends Node2D

##func _process(delta):
##	position.y += 7

##var speed = 100
##var player = null

func _ready():
	player = get_node("/root/Player")  # Asegúrate de que el nodo del jugador esté accesible

func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		var velocity = direction * speed
		position += velocity * delta  # Mueve el zombie hacia el jugador

	if is_mouse_over():
		queue_free()

func is_mouse_over() -> bool:
	var mouse_position = get_global_mouse_position()
	var collision_shape = $CollisionShape2D.shape
	return collision_shape and collision_shape.point_inside(mouse_position)
