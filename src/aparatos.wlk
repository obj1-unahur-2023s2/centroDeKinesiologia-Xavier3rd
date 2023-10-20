import pacientes.*


class Aparato {
	
	const property color = "blanco"
	
	method puedeUsarlo(paciente) = true 
	method efectoSobrePaciente(paciente)
	
	// metodos para el mantenimiento de aparatos
	
	method efectoDelUso(unPaciente)
	method necesitaMantenimiento() = false
	method hacerMantenimiento()
}

class Magneto inherits Aparato {
	
	var imantacion = 800
	 
	override method efectoSobrePaciente(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1)
	}
	
	// metodos para el mantenimiento del aparato
	
	override method efectoDelUso(unPaciente) {
		imantacion = 0.max(imantacion - 1)
	}
	
	override method necesitaMantenimiento() = imantacion < 100

	
	override method hacerMantenimiento() {
		imantacion = 800.min(imantacion + 500) 
	}
}

class Bicicleta inherits Aparato {
	
	// atributos para el mantenimiento de los aparatos
	var property vecesQueSeDesajustanTornillos = 0
	var property vecesQueSePierdeAceite = 0
	
	override method puedeUsarlo(paciente) = paciente.edad() > 8
	
	override method efectoSobrePaciente(paciente) {
		paciente.nivelDeDolor(4)
		paciente.nivelDeFortaleza(3)
	}
	
	// metodos para el mantenimiento del aparato
	override method necesitaMantenimiento()= self.vecesQueSeDesajustanTornillos() >= 10 or self.vecesQueSePierdeAceite() >= 5
	 
	override method efectoDelUso(unPaciente){
		if (unPaciente.nivelDeDolor() > 30){
			vecesQueSeDesajustanTornillos += 1
		}
		if (unPaciente.edad().between(30,50)){
			vecesQueSePierdeAceite += 1
		}
	}
	
	override method hacerMantenimiento() {
		
		vecesQueSeDesajustanTornillos = 0
		vecesQueSePierdeAceite = 0
	}
		

}

class Minitramp inherits Aparato {
	
	override method puedeUsarlo(paciente) = paciente.nivelDeDolor() < 20
	override method efectoSobrePaciente(paciente){
		paciente.nivelDeFortaleza(paciente.edad() * 0.1)
	}
	// metodos para el mantenimiento del aparato
	override method efectoDelUso(unPaciente){}
	
	
	override method hacerMantenimiento(){}
}