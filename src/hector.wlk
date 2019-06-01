import wollok.game.*
import plantas.*

object hector {
	var property position = game.origin()
//	var plantas = []
	var plantasCosechadas = []
	var property oro = 0
	var property oroAlVender = 0
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
		if (game.colliders(self).isEmpty()) {
			game.addVisualIn( planta, self.position() )	// position.clone().drawElement(planta)
//			plantas.add(planta) 
		}
			else throw new Exception ("Ya hay una planta aquí")
	}
	
	method regar() {
		var planta = game.colliders(self)
		
		if (planta.isEmpty()) throw new Exception ("No tengo nada que regar")
			else planta.anyOne().crecer()
//			else plantasEnMiLugar.foreach { planta => planta.crecer() }
	}
	
	method cosechar() {
		var planta = game.colliders(self)
		
		if (planta.isEmpty()) throw new Exception ("No tengo nada que cosechar")
			else planta.anyOne().cosechate(self)
	}
	
	method cosecho(planta) {
		plantasCosechadas.add(planta)
	}
	
	method vender() {
		if (plantasCosechadas.isEmpty()) throw new Exception ("No tengo nada que vender")
			else {self.sumarOro(oroAlVender)
			//plantasCosechadas.forEach{ p => self.sumarOro(p.oro()) }
				plantasCosechadas.clear()
				oroAlVender = 0
			}
	}
	
//	method cosecharTodo() {
//		plantas.forEach{c => c.cosechate(self)}
//		plantas.clear()
//	}
	method acumularOro(cantidad) { oroAlVender += cantidad }
	
	method sumarOro(cantidad) { oro += cantidad }
	
	method informe() {
		game.say(self, "Tengo " + self.oro() + " de oro, y " + plantasCosechadas.size() + " plantas para vender.")
	}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
}