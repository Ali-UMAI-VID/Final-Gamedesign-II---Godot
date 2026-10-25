extends Area2D

var jugador_dentro: bool = false

func _physics_process(delta):
	if Globales.gana_oxigeno == false:
		Globales.oxigeno -= 1 * delta
	if Globales.gana_oxigeno == true:
		Globales.oxigeno += delta * 7

	if Globales.oxigeno >= 100:
		Globales.oxigeno = 100

func _process(delta):
	if jugador_dentro:
		if Input.is_action_pressed("Accion"):
			Globales.gana_oxigeno = true
		else:
			Globales.gana_oxigeno = false

func _on_body_entered(body):
	if body is Jugador:
		jugador_dentro = true

func _on_body_exited(body):
	if body is Jugador:
		jugador_dentro = false
