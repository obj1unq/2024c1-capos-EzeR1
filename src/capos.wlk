import artefactos.*
import castillo.*

object rolando {

	var property capacidad = 2
	const property artefactos = #{} // esto es un getter. Aunque sea const, puedo seguir agregando y sacando cosas, porque modifico el tamaño, no que es una coleccion
	var hogar = castilloDePiedra
	const property historialDeArtefactos = []
	var property poderBase = 5

	method hogar(_hogar) {
		hogar = _hogar
	}

	method encontrar(artefacto) {
		if (self.puedeAgregar()) {
			artefactos.add(artefacto)
		}
		historialDeArtefactos.add(artefacto)
	}

	method puedeAgregar() {
		return artefactos.size() < capacidad
	}

	method irAlHogar() {
		self.guardarArtefactosEnHogar()
		self.liberarEspacio()
	}

	method guardarArtefactosEnHogar() {
		hogar.guardarTodosLosArtefactos(artefactos)
	}

	method liberarEspacio() {
		artefactos.clear()
	}

	method posee(artefacto) {
		return self.todasLasPosesiones().contains(artefacto)
	}

	method todasLasPosesiones() {
		return artefactos.union(hogar.baul()) // no modifica mi coleccion "artefactos", sino que genera una nueva juntando ambas
	}

	method poderPelea() {
		return self.poderBase() + self.poderArtefactos()
	}

	method poderArtefactos() {
		return artefactos.sum({ artefacto => artefacto.poder(self) })
	}

	method batalla() {
		artefactos.forEach({ artefacto => artefacto.usar()})
		poderBase += 1
	}

	method poderInvocacion() {
		return hogar.poderInvocacion(self)
	}

	method enemigosVencibles(tierra) {
		return tierra.vencibles(self)
	}

	method vencible(enemigo) {
		return enemigo.poderPelea() < self.poderPelea()
	}

	method tieneArmaFatal(enemigo) {
		return artefactos.any({ artefacto => self.esFatal(artefacto, enemigo) })
	}

	method esFatal(artefacto, enemigo) {
		return artefacto.poder(self) > enemigo.poderPelea()
	}
	
	method armaFatal(enemigo) {
		return artefactos.find({ artefacto => self.esFatal(artefacto, enemigo) })
	}
	
//	method cantidadArmasFatales(enemigo) {
//		return artefactos.count({ artefacto => self.esFatal(artefacto, enemigo) })
//	}
	
//	method todasArmasFatales(enemigo) {
//		return artefactos.filter({ artefacto => self.esFatal(artefacto, enemigo) })
//	}
	
}