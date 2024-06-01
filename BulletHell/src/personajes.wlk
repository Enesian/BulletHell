import wollok.game.*

object hell{
	
	var vida = 3
	var property position
	
	method image() = "hellFrente.png"
	
	method chocar(){
		game.say(self,"aaaaaaah")
		vida -=1
		if (vida == 0){game.stop()}
	}
	
}

class Torreta{
	
	var property position
	var property direccion
	
	method image() = "torreta.png"
	
	method disparar(){
		const bala = new Bala(position = game.at(self.position().x()-1,self.position().y()),direccion = self.direccion())
		game.addVisual(bala)
		bala.mover()
	}
}

class Bala{
	
	var position
	const direccion
	
	method position() = position
	
	method image() = "balaDerecha.png"
	
	method mover(){
		game.onTick(200, "movimiento bala",{=> position = game.at(self.position().x()-1, self.position().y() )})
	}
	method chocar(){
		hell.chocar()
	}
	
}