extends Area2D

@export var num_tarjeta : int = 1
var posiciones_x_tj2 = [-91.0, 116.0]
var posiciones_y_tj2 = [401.0, 148.0]

var posiciones_y_tj1 = [1058.0,148.0]
var posiciones_x_tj1 = [612.0,1128.0]

var posiciones_y_tj3 = [206.0, 461.0]
var posiciones_x_tj3 = [1699.0,1699.0]
func _ready():
	if num_tarjeta == 2:
		position.y = posiciones_y_tj2.pick_random()
		position.x = posiciones_x_tj2.pick_random()
	if num_tarjeta == 1:
		position.x = posiciones_x_tj1.pick_random()
		position.y = posiciones_y_tj1.pick_random()
	if num_tarjeta == 3:
		position.y = posiciones_y_tj3.pick_random()
		position.x = posiciones_x_tj3.pick_random()
func _on_body_entered(body):
		if body is Jugador:
			Globales.tarjetas += 1
			#print (Globales.tarjetas)
			queue_free()
