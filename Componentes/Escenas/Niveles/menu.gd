extends Control

func _on_jugar_boton_pressed():
	get_tree().change_scene_to_file("res://Componentes/Escenas/Niveles/nivel.tscn")
