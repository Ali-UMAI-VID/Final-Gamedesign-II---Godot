extends Node
class_name Estado


@onready var maquina : MaquinaEstado = get_parent()
@onready var enemigoIA : EnemigoIA = get_parent().get_parent()

func entrada():
	pass
	
func salida():
	pass

func proceso(_delta):
	pass

#Estado -> entrada() -> salida() -> process()
