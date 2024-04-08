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
		} else {
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

	var property hechizos = []

	method poder(personaje) {
		return if (not hechizos.isEmpty()) hechizos.first().poder(personaje) else 0
	}

	method usar() {
		if (not hechizos.isEmpty()) {
			hechizos.remove(hechizos.first())
		}
	// hechizos = hechizos.drop(1) (a lo funcional)
	}

}

// HECHIZOS 

object bendicion {

	method poder(personaje) {
		return 4
	}
}

object invisibilidad {

	method poder(personaje) {
		return personaje.poderBase()
	}
}

object invocacion {

	method poder(personaje) {
		return personaje.poderInvocacion()
	}
}

