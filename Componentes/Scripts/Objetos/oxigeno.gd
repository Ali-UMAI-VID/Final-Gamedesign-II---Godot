extends Area2D

var jugador_dentro: bool = false

func _on_body_entered(body):
	if body is Jugador:
		jugador_dentro = true


func _on_body_exited(body):
	jugador_dentro = false

func _process(delta):
	if jugador_dentro:
		if Input.is_action_pressed("Accion"):
			Globales.gana_oxigeno = true
		else:
			Globales.gana_oxigeno = false
