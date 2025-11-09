import aparatos.*
import pacientesEspeciales.*

class Paciente {
	var edad
	var property nivelDeDolor
	var property nivelDeFortaleza
	const rutina = []
	
	method edad() = edad 
	method agregarEjercicio(unAparato) {
	  rutina.add(unAparato)
	}
	method puedeUsar(unAparato) {
		return unAparato.puedeSerUsadoPor(self)
	}
	
	method usar(unAparato) {
		if (self.puedeUsar(unAparato)) {
			unAparato.aplicarA(self)
		} else {
			self.error("No puede usar el aparato")
		}
	}
	
	method puedeHacerLaRutina() {
		return rutina.all({ aparato => self.puedeUsar(aparato) })
	}
	
	method hacerRutina() {
		if (self.puedeHacerLaRutina()) {
			rutina.forEach({ aparato => self.usar(aparato) })
		} else {
			self.error("No puede realizar la rutina")
		}
	}
	
}
