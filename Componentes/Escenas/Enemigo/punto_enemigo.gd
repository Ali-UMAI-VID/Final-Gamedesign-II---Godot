extends Area2D
@export var nro_punto: int = 0

func _physics_process(delta):
	if Globales.ene_sigue_a == nro_punto:
		print(Globales.ene_sigue_a)


func _on_area_entered(area):
	if area.is_in_group("Punto_enemigo"):
		Globales.ene_sigue_a = nro_punto
		print(Globales.ene_sigue_a)
