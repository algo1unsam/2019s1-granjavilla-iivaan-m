import wollok.game.*
import plantas.*

object hector {
	var property position = game.at(0,0)
	method image() = "player.png"
	
	method sembrarMaiz() {
		self.sembrar(new Maiz())
	}

	method sembrarTrigo() {
		self.sembrar(new Trigo())
	
	}
	method sembrarTomaco() {
		self.sembrar(new Tomaco())
	}

	method sembrar(planta) {
//		game.addVisualIn( planta, self.position() )
		if (game.colliders(self).isEmpty()) position.clone().drawElement(planta)
			else throw new Exception ("Ya hay una planta aquí")
	}
	
	method regar() {
		var planta = game.colliders(self)
		
		if (planta.isEmpty()) throw new Exception ("No tengo nada que regar")
			else planta.crecer()
//			else plantasEnMiLugar.foreach { planta => planta.crecer() }
	}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
}