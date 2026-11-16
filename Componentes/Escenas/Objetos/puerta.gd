extends Node2D
class_name puerta

@onready var animacion_puerta = $AnimacionPuerta
@onready var colision_puerta = $StaticBody2D/ColisionPuerta

var dentro: bool = false

func _physics_process(delta):
	if dentro == false:
		animacion_puerta.frame = 0
		colision_puerta.disabled = false
	if dentro == true:
		animacion_puerta.frame = 1
		colision_puerta.disabled = true

func _on_area_2d_body_entered(body):
	if body is Jugador|| body is EnemigoIA:
		dentro = true

func _on_area_2d_body_exited(body):
	if body is Jugador|| body is EnemigoIA:
		dentro = false
