extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	

func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")#hacemos que ocurra esto primero y despues pasa todo lo demas
	$BotonPlay.show()
	$Mensaje.text = "Asteroids"
	$Mensaje.show()
	
func update_score(Puntos):
	$ScoreLable.text = str(Puntos)#transforma un int en un string
	
	


func _on_MensajeTimer_timeout():
	$Mensaje.hide()
	


func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")
