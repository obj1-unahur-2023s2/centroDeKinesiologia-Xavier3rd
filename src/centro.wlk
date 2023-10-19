import aparatos.*
import pacientes.*


object centro {
	const property pacientes = []
	const property aparatos = []
	
	method coloresDeLosAparatos() = aparatos.map({ap => ap.color()}).asSet()
	method pacientesMenoresDe8Anios() = pacientes.filter({p => p.edad() < 8})
	method pacientesQueNoPuedenHacerRutina() = pacientes.count({p => !p.puedeHacerLaRutina()})
	
}
