
class Viaje{
	const idiomas = #{}
	
	method idiomas() = idiomas
	method implicaEsfuerzo()
	method bronceado()
	method dias()
	
	method esInteresante() = idiomas.size()>=2
	
	method recomendadaPara(socio){
		return self.esInteresante() and socio.leGusta(self) and socio.noHizo(self)
	}
}

class ViajeDePlaya inherits Viaje{
	var largo
	
	override method dias() = largo / 500
	override method implicaEsfuerzo() = largo > 1200
	override method bronceado() = true
}

class ExcursionACiudad inherits Viaje{
	var cantAtracciones
	
	override method dias() = cantAtracciones / 2
	override method implicaEsfuerzo() = cantAtracciones.between(5,8)
	override method bronceado() = false
	override method esInteresante() = super() or cantAtracciones==5
}

class CiudadTropical inherits ExcursionACiudad{
	override method dias() = super() + 1
	override method bronceado() = true
}

class SalidaDeTrekking inherits Viaje{
	var kms
	var diasDeSolAlAnio
	
	override method dias() = kms / 50
	override method implicaEsfuerzo() = kms > 80
	override method bronceado() =  diasDeSolAlAnio > 200 or (diasDeSolAlAnio.between(100,200) and kms > 120)
	override method esInteresante() = super() and diasDeSolAlAnio>140
}

object claseGimnasia inherits Viaje{
	
	override method idiomas() = ["español"]
	override method dias() = 1
	override method implicaEsfuerzo() = true
	override method bronceado() = false
	override method recomendadaPara(socio) = socio.edad().between(20,30)
}

object tallerLiterario inherits Viaje{
	const libros = []
	
	override method idiomas() = libros.map({l => l.idioma()}).asSet()
	override method dias() = libros.size()+1
	override method implicaEsfuerzo() = libros.any({ l => l.paginas() > 500 }) or self.autores() == 1
	override method bronceado() = false
	
	method autores() = libros.map({l => l.autor()}).asSet()
	
/*
	method autores(){
		const autores = #{}
		return libros.forEach({ l=> autores.add(l.autor()) })
	}
*/
}

class Libro{
	const property idioma
	const property paginas
	const property autor
}
