extends Node
class_name Estado
@onready var maquina : MaquinaEstado = get_parent()
func entrada():
	pass
	
func salida():
	pass

func proceso(_delta):
	pass

#Estado -> entrada() -> salida() -> process()
