extends RigidBody2D
export(int) var velocidad_min
export(int) var velocidad_max
var tipo_enemigo = ["Enemigo", "Variante1"]



func _ready():
	$AnimatedSprite.animation = tipo_enemigo[randi() % tipo_enemigo.size()]
	
		


func _on_Visibilidad_screen_exited():
	queue_free() #elimina al enemigo
	
