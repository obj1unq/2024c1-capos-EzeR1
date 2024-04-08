object espadaDelDestino {

	var primeraVez = true

	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente()
	}

	method coeficiente() {
		return if (primeraVez) {
			1
		} else {
			0.5
		}
	}

	method usar() {
		primeraVez = false
	}

}

object collarDivino {

	var usos = 0

	method poder(personaje) {
		return 3 + self.extra(personaje)
	}

	method extra(personaje) {
		return if (personaje.poderBase() > 6) {
			usos
		} 
		else {
			0
		}
	}

	method usar() {
		usos += 1
	}

}

object armaduraDeAceroValyrio {

	const poder = 6
	
	method poder(personaje) {
		return poder
	}

	method usar() {
	}

}

object libroDeHechizos {

	method poder(personaje) {
	}

	method usar() {
	}

}

