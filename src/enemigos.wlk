object erethia {

	var property enemigos = #{ archibaldo, caterina, astra }

	method vencibles(capo) {
		return enemigos.filter({ enemigo => capo.vencible(enemigo) })
	// return  enemigos.filter({enemigo => enemigo.poderPelea() < capo.poderPelea()})
	}

	method hogaresConquistables(capo) {
		return self.vencibles(capo).map({ enemigo => enemigo.hogar() }).asSet()
	}

	method esPoderoso(capo) {
		return enemigos.all({ enemigo => capo.vencible(enemigo) })
	}

}

// ENEMIGOS
object archibaldo {

	var property hogar = palacioDeMarmol

	method poderPelea() {
		return 16
	}

}

object caterina {

	var property hogar = fortalezaDeAcero

	method poderPelea() {
		return 28
	}

}

object astra {

	var property hogar = torreDeMarfil

	method poderPelea() {
		return 14
	}

}

// HOGARES DE ENEMIGOS
object palacioDeMarmol {

}

object fortalezaDeAcero {

}

object torreDeMarfil {

}

