extends Control
@onready var tipo_muerte = $Tipo_muerte

func _physics_process(delta):
	if Globales.oxigeno == 0:
		tipo_muerte.frame = 0
	if Globales.vidas == 0:
		tipo_muerte.frame = 1

func _on_salir_boton_pressed():
	get_tree().quit()

func _on_reintentar_boton_pressed():
	Globales.tarjetas = 0
	Globales.oxigeno = 100
	Globales.vidas = 3
	get_tree().change_scene_to_file("res://Componentes/Escenas/Niveles/nivel.tscn")
