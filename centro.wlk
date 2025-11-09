import aparatos.*
import paciente.*

object centro {
	const aparatos = []
	const pacientes = []
	
	method coloresDeAparatos() {
		return aparatos.map({ aparato => aparato.color() }).asSet()
	}
	
	method pacientesMenoresDeOchoAnios() {
		return pacientes.filter({ paciente => paciente.edad() < 8 })
	}
	
	method cantidadDePacientesQueNoPuedenCumplirSuSesion() {
		return pacientes.count({ paciente => not paciente.puedeHacerLaRutina() })
	}
	
	method estaEnOptimasCondiciones() {
		return aparatos.all({ aparato => not aparato.necesitaMantenimiento() })
	}
	
	method estaComplicado() {
		return aparatos.count({ aparato => aparato.necesitaMantenimiento() }) >= aparatos.size() / 2
	}
	
	method registrarVisitaDeTecnico() {
		aparatos.filter({ aparato => aparato.necesitaMantenimiento() }).forEach({ aparato => aparato.hacerMantenimiento() })
	}
}
