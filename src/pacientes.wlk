import aparatos.*

class Paciente {
	
	const property edad 
	var nivelDeFortaleza
	var nivelDeDolor
	
	const rutinaAsignada = []
	
	method nivelDeFortaleza() = nivelDeFortaleza
	method nivelDeFortaleza(unValor) {
		nivelDeFortaleza += unValor
	} 
	method nivelDeDolor() = nivelDeDolor
	method nivelDeDolor(unValor) {
		nivelDeDolor = 0.max(nivelDeDolor - unValor)
	} 
	
	
	method puedeUsar(aparato) = aparato.puedeUsarlo(self)
	method usar(unAparato) {
		if (self.puedeUsar(unAparato)) {
			unAparato.efectoSobrePaciente(self)
		}	
	}
	
	method asignarRutina(unaRutina) {
		rutinaAsignada.addAll(unaRutina)
	}
	
	method puedeHacerLaRutina() = rutinaAsignada.all({aparato => self.puedeUsar(aparato)
	})
	
	method realizarRutina() {
		if (self.puedeHacerLaRutina()){
			rutinaAsignada.forEach({aparato => self.usar(aparato)})
		}
	}
	
	method cantidadDeRutinas() = rutinaAsignada.size()
}


// Test 3: 

class PacienteResistente inherits Paciente {
		override method realizarRutina() {
			super()
			self.nivelDeFortaleza(self.cantidadDeRutinas())
		} 
}

class PacienteCaprichoso inherits Paciente {
	
	method hayAlgunAparatoColor(color) =
		rutinaAsignada.any({aparato =>aparato.color() == color})
	
	
	override method realizarRutina() {
		if (self.puedeHacerLaRutina() and self.hayAlgunAparatoColor("rojo")){
			rutinaAsignada.forEach({aparato => self.usar(aparato)})
			rutinaAsignada.forEach({aparato => self.usar(aparato)})
		}
	}		
}

class PacienteRapidaRecuperacion inherits Paciente {
	override method realizarRutina() {
		super()
		self.nivelDeDolor(valorDeRecuperacion.valorDeRecuperacion())
	} 
}

object valorDeRecuperacion {
	var property valorDeRecuperacion = 3
}










