import aparatos.*

class Paciente {
	
	const property edad 
	var nivelDeFortaleza
	var nivelDeDolor
	
	const property rutinaAsignada = []
	
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
			unAparato.efectoDelUso(self)
			unAparato.efectoSobrePaciente(self)
			
		}	
	}
	
	method asignarRutina(unaRutina) {
		rutinaAsignada.addAll(unaRutina) 
	}
	
	method puedeHacerLaRutina() = rutinaAsignada.all({aparato => self.puedeUsar(aparato)
	})
	
	method realizarRutina() {
		if (!self.puedeHacerLaRutina()){
			self.error("El paciente no puede realizar la rutina")	
		}
		rutinaAsignada.forEach({aparato => self.usar(aparato)})
	}
	
	method cantidadDeAparatoEnLaRutina() = rutinaAsignada.size()
}


// Test 3: 

class PacienteResistente inherits Paciente {
		override method realizarRutina() {
			super()
			self.nivelDeFortaleza(self.cantidadDeAparatoEnLaRutina())
		} 
}

class PacienteCaprichoso inherits Paciente {
	
	method hayAlgunAparatoColor(color) =
		rutinaAsignada.any({aparato =>aparato.color() == color})
	
	override method puedeHacerLaRutina() =
		super()and self.hayAlgunAparatoColor("rojo")
	
	override method realizarRutina() {
		if (self.puedeHacerLaRutina()){
			super()
			super()
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










