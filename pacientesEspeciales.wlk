import paciente.*

class Resistente inherits Paciente {
	override method hacerRutina() {
		super()
		self.nivelDeFortaleza(self.nivelDeFortaleza() + rutina.size())
	}
}

class Caprichoso inherits Paciente {
	override method puedeHacerLaRutina() {
		return super() and rutina.any({ aparato => aparato.color() == "rojo" })
	}
	
	override method hacerRutina() {
		if (self.puedeHacerLaRutina()) {
			super()
			super()
		} else {
			self.error("No puede realizar la rutina")
		}
	}
}

object rapidaRecuperacion {
	var property puntosDeDolorADisminuir = 3
}

class RapidaRecuperacion inherits Paciente {
	override method hacerRutina() {
		super()
		self.nivelDeDolor(self.nivelDeDolor() - rapidaRecuperacion.puntosDeDolorADisminuir())
	}
}
