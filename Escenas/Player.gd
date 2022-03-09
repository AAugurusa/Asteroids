extends Area2D

export (int) var Velocidad
var Movimiento = Vector2() #vacio es automaticamente 0
var limite
signal golpe 

func _ready(): # "evento create"
	hide()#ocultar pj
	limite = get_viewport_rect().size
	 

func _process(delta):
	Movimiento = Vector2() #reinicia la variable
	
	if Input.is_key_pressed(KEY_D):
			Movimiento.x += 1
	if Input.is_key_pressed(KEY_A):
			Movimiento.x -= 1
	if Input.is_key_pressed(KEY_W):
			Movimiento.y -= 1
	if Input.is_key_pressed(KEY_S):
			Movimiento.y += 1
		
	if Movimiento.length() > 0: #verifica si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad 
	
	position += Movimiento * delta #delta es la velocidad a la que se corre el juego (ACTUALIZA LOS MOVIMIENTOS)

	
	
	
	if Movimiento.x != 0:
		$Sprite_Player.animation = "Lado"
		$Sprite_Player.flip_h = Movimiento.x < 0
		$Sprite_Player.flip_v = false
	elif Movimiento.y != 0:
		$Sprite_Player.animation = "Frente"
		$Sprite_Player.flip_v = Movimiento.y > 0


	
	
	


func _on_Player_body_entered(body):#cuando haya una colision con un cuerpo
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true #desactiva la colicion de este objeto


func inicio(pos):
	position = pos
	show()#mostrar el pj
	$CollisionShape2D.disabled = false #activa la colicion de este objeto
	
	
	
	
	
	
	
	
	
	
