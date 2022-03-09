extends Node
export (PackedScene) var Enemigo
var Score 

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionDeInicio.position) #Posicion de inicio del pj
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)


func game_over():
	$ScoreTimer.stop()
	$EnemigoTimer.stop()
	$Interfaz.game_over()
	


func _on_InicioTimer_timeout():
	$ScoreTimer.start()
	$EnemigoTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)
	


func _on_EnemigoTimer_timeout():
	$Camino/EnemigoPosicion.set_offset(randi())	#Seleccionar un lugar aleatorio en el path
	
	var R = Enemigo.instance()
	add_child(R)
	
	var d = $Camino/EnemigoPosicion.rotation + PI/2#selecciona una direccion
	
	R.position = $Camino/EnemigoPosicion.position
	
	d += rand_range(-PI/4, PI/4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))
	
	
	
	
	
	
	
	
	
	
	
	
	
