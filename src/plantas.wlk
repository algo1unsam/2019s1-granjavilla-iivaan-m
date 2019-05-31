import wollok.game.*
import hector.*

class Planta {
	var property position
	
	var property etapa = cero
	
	method crecer() { etapa.crecer(self)}
	method image() = etapa.imagen(self)
}

class Maiz inherits Planta {
	
	method imagenCero() = "corn_baby.png"
	method imagenUno() = "corn_adult.png"
	method imagenDos() = "corn_adult.png"
	method imagenTres() = "corn_adult.png"
}

class Trigo inherits Planta {
	method imagenCero() = "wheat_0.png"
	method imagenUno() = "wheat_1.png"
	method imagenDos() = "wheat_2.png"
	method imagenTres() = "wheat_3.png"
}

class Tomaco inherits Planta {
	method imagenCero() = "tomaco.png"
	method imagenUno() = "tomaco.png"
	method imagenDos() = "tomaco.png"
	method imagenTres() = "tomaco.png"
	
	override method crecer() { if (self.position().y() == game.height() ) self.position().y(0)
		else self.position().up(1)
	}
}

object cero {
	method crecer(planta) { planta.etapa(uno)}
	method imagen(planta) = planta.imagenCero()
}

object uno {
	method crecer(planta) { planta.etapa(dos)}
	method imagen(planta) = planta.imagenUno()
}

object dos {
	method crecer(planta) { planta.etapa(tres)}
	method imagen(planta) = planta.imagenDos()
}

object tres {
	method crecer(planta) { planta.etapa(cero)}
	method imagen(planta) = planta.imagenTres()
}