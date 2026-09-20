extends Node
class_name MaquinaEstado

@onready var enemigo : EnemigoIA = get_parent()
@export var estado_inicial : Estado
@onready var estado : Estado = estado_inicial


func transcicionar(nombre_estado : String):
	var nuevo_estado : Estado = get_node(nombre_estado)
	estado.salida()
	estado = nuevo_estado
	estado.entrada()
