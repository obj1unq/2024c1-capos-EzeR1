import artefactos.*
import castillo.*

object rolando {

	var capacidad = 2
	const property artefactos = #{}  //esto es un getter. Aunque sea const, puedo seguir agregando y sacando cosas, porque modifico el tamaño, no que es una coleccion
	var hogar = castilloDePiedra
	const property historialDeArtefactos = []
	
	method agarrar(artefacto) {
		if (self.puedeAgregar()) {
			artefactos.add(artefacto)
		}
		self.encontrar(artefacto)
	}
	
	method encontrar(artefacto) {
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

	

}