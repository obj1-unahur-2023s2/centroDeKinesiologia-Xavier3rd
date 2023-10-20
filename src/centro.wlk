import aparatos.*
import pacientes.*


object centro {
	const property pacientes = #{}
	const property aparatos = []
	
	method agregarPaciente(listaPacientes) {pacientes.addAll(listaPacientes)} 
	method agregarAparato(listaAparatos) {pacientes.addAll(listaAparatos)}
	
	method coloresDeLosAparatos() = aparatos.map({ap => ap.color()}).asSet()
	method pacientesMenoresDe8Anios() = pacientes.filter({p => p.edad() < 8})
	method cantidadDePacientesQueNoPuedenHacerRutina() = pacientes.count({p => !p.puedeHacerLaRutina()})
	
	method cantidadDeAparatosEnCentro() = aparatos.size()
	
	method estaEnOptimasCondiciones() = aparatos.all({a => !a.necesitaMantenimiento()}) 
	method aparatosParaMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()}) 
	method cantidadDeAparatosParaMantenimiento() = aparatos.count({a => a.necesitaMantenimiento()}) 
	method estaComplicado() = self.cantidadDeAparatosParaMantenimiento() > (self.cantidadDeAparatosEnCentro()/2)
	
	method visitaDelTecnico() {
		self.aparatosParaMantenimiento().forEach({a=>a.hacerMantenimiento()})
	}
}
