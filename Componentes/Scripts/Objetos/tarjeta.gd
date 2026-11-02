extends Area2D

@export var num_tarjeta : int = 1
var posiciones_x_tj2 = [-84.0, 43.0]
var posiciones_y_tj2 = [63.0, 260.0, 387.0,528.0, 590.0]

var posiciones_y_tj1 = [-26, 63, 271, 464,591]
var posiciones_x_tj1 = [111.0,220.0,337.0]

var posiciones_y_tj3 = [-29, 62, 140, 262, 381, 527]
var posiciones_x_tj3 = [525, 396]
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
