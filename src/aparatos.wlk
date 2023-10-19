import pacientes.*


class Aparato {
	
	var property color = "blanco"
	
	method puedeUsarlo(paciente) = true 
	method efectoSobrePaciente(paciente)
}

class Magneto inherits Aparato {
	
	override method efectoSobrePaciente(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1)
	}

}

class Bicicleta inherits Aparato {
	
	override method puedeUsarlo(paciente) = paciente.edad() > 8
	
	override method efectoSobrePaciente(paciente) {
		paciente.nivelDeDolor(4)
		paciente.nivelDeFortaleza(3)
	}
	
}

class Minitramp inherits Aparato {
	
	override method puedeUsarlo(paciente) = paciente.nivelDeDolor() < 20
	override method efectoSobrePaciente(paciente){
		paciente.nivelDeFortaleza(paciente.edad() * 0.1)
	}
}