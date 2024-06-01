import wollok.game.*
import personajes.*

object bulletHell {
	
	method play(){
	
	self.configurarPantallaLvl1()
	
	game.start()
	}
	
	method configurarPantallaLvl1(){
		game.title("Bullet Hell")
		game.width(32)
		game.height(18)
		game.addVisualCharacterIn(hell, game.at(1,1))
		self.posicionarEnemigosLvl1()
		self.posicionarObstaculosLvl1()
		game.onCollideDo(hell,{elemento => elemento.chocar()})
	}
	
	method posicionarEnemigosLvl1(){
		
		const torreta1 = new Torreta(position = new Position (x=5, y=10), direccion = "izquierda")
		const torreta2 = new Torreta(position = new Position (x=10, y=15), direccion = "izquierda")
		const torreta3 = new Torreta(position = new Position (x=12, y=5), direccion = "izquierda")
		const torretas = [torreta1, torreta2, torreta3]
		
		torretas.forEach{torreta => game.addVisual(torreta)}
		game.onTick(800, "disparar",{torretas.forEach{torreta => torreta.disparar()}})
		
	}
	
	method posicionarObstaculosLvl1(){}
}
