object baby {
	var property oro = 0
	method imagen() = "corn_baby.png"
}

object adult {
	var property oro = 150
	method imagen() = "corn_adult.png"
}

object cero {
	var property oro = 0
	method crecer(planta) { planta.etapa(uno)}
	method imagen(planta) = planta.imagenCero()
}

object uno {
	var property oro = 0
	method crecer(planta) { planta.etapa(dos)}
	method imagen(planta) = planta.imagenUno()
}

object dos {
	var property oro = 100
	method crecer(planta) { planta.etapa(tres)}
	method imagen(planta) = planta.imagenDos()
}

object tres {
	var property oro = 200
	method crecer(planta) { planta.etapa(cero)}
	method imagen(planta) = planta.imagenTres()
}