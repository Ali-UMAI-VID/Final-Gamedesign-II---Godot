extends Estado
class_name EstadoOxigeno

func entrada():
	print("entraaaaa")
	
func _process(delta):
	if Input.is_action_pressed("Accion"):
		maquina.jugador.movimiento_lateral_activado = false
	else:
		maquina.jugador.movimiento_lateral_activado = true


func _on_area_jugador_area_exited(area):
	if area.is_in_group("Carga_oxigeno"):
		maquina.transcicionar("Estado_Caminar")
		return
