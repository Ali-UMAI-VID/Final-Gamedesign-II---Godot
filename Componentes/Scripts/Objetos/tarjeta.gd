extends Area2D


func _on_body_entered(body):
		if body is Jugador:
			Globales.tarjetas += 1
			print (Globales.tarjetas)
			queue_free()
