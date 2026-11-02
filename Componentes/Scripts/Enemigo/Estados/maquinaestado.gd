extends Node
class_name MaquinaEstado

@export var estado_inicial : Estado
@onready var estado : Estado = estado_inicial
@onready var jugador: Jugador = get_parent()

func transcicionar(nombre_estado : String):
	var nuevo_estado : Estado = get_node(nombre_estado)
	estado.salida()
	estado = nuevo_estado
	estado.entrada()
