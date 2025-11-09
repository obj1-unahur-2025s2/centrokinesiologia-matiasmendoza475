class Aparato {
	var property color = "blanco"
	method puedeSerUsadoPor(unPaciente)
	method aplicarA(unPaciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()
}

class Magneto inherits Aparato {
	var property puntosDeImantacion = 800
	
	override method puedeSerUsadoPor(unPaciente) {
		return true
	}
	override method aplicarA(unPaciente) {
		unPaciente.nivelDeDolor(unPaciente.nivelDeDolor() * 0.9)
		puntosDeImantacion -= 1
	}
	override method necesitaMantenimiento() {
		return puntosDeImantacion < 100
	}
	override method hacerMantenimiento() {
		puntosDeImantacion += 500
	}
}

class Bicicleta inherits Aparato {
	var property desajustesDeTornillos = 0
	var property perdidasDeAceite = 0
	
	override method puedeSerUsadoPor(unPaciente) {
		return unPaciente.edad() > 8
	}
	override method aplicarA(unPaciente) {
		if (unPaciente.nivelDeDolor() > 30) {
			desajustesDeTornillos += 1
		}
		if (unPaciente.edad().between(30, 50)) {
			perdidasDeAceite += 1
		}
		unPaciente.nivelDeDolor(unPaciente.nivelDeDolor() - 4)
		unPaciente.nivelDeFortaleza(unPaciente.nivelDeFortaleza() + 3)
	}
	override method necesitaMantenimiento() {
		return desajustesDeTornillos >= 10 or perdidasDeAceite >= 5
	}
	override method hacerMantenimiento() {
		desajustesDeTornillos = 0
		perdidasDeAceite = 0
	}
}

class Minitramp inherits Aparato {
	override method puedeSerUsadoPor(unPaciente) {
		return unPaciente.nivelDeDolor() < 20
	}
	override method aplicarA(unPaciente) {
		unPaciente.nivelDeFortaleza(unPaciente.nivelDeFortaleza() + unPaciente.edad() * 0.1)
	}
	override method necesitaMantenimiento() {
		return false
	}
	override method hacerMantenimiento() {
		
	}
}