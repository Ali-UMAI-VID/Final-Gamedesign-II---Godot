extends Estado
class_name EstadoJugador

#@onready var navigation_agent_2d = $"../../NavigationAgent2D"
#@onready var player : Jugador
#var veloPerseguir: int = 200

func _ready():
	pass
	#player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
##	var direction = (player.global_position - global_position).normalized()
	#var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	#velocity = direction * veloPerseguir
	#move_and_slide()
	pass

#func _on_timerRastreo_timeout():
#	navigation_agent_2d.target_position = player.global_position
