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
		position.clone().drawElement(planta)
	}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
}