import wollok.game.*
import hector.*
import estados.*

class Planta {
	var property position
	
	method cosechate(granjero) {
		if ( self.esCosechable() ) {
			granjero.cosecho(self)
			granjero.acumularOro(self.oro())
			game.removeVisual(self)
		} else throw new Exception ("Aún no cosechable")
	}
	
//	method vendete(granjero) {
//		granjero.sumarOro(self.oro())
//	}

}

class Maiz inherits Planta {
	var property estado = baby
	var property oro = estado.oro()
	
	method image() = estado.imagen()
	
	method crecer() {estado = adult}
	
	method esCosechable() = estado == adult
}

class Trigo inherits Planta {
	var property etapa = cero
	var property oro = etapa.oro()

	method image() = etapa.imagen(self)
	method imagenCero() = "wheat_0.png"
	method imagenUno() = "wheat_1.png"
	method imagenDos() = "wheat_2.png"
	method imagenTres() = "wheat_3.png"
	
	method crecer() {etapa.crecer(self)}
	
	method esCosechable() = etapa == dos || etapa == tres
}

class Tomaco inherits Planta {
	var property oro = 80
	
	method image() = "tomaco.png"
	
	method crecer() { if (self.position().y() == game.height() ) self.position().y(0)
		else self.position().up(1)
	}
	
	method esCosechable() = true
}