extends CanvasLayer
@onready var barra_oxigeno = $BarraOxigeno
@onready var barra_vida = $BarraVida
@onready var misiones = $Misiones

func _physics_process(delta):
	misiones.text = "Mision: 
		" +  str(Globales.tarjetas) + "/3 de tarjetas"
