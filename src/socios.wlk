import actividades.*

class Socio{
	const actividadesRealizadas = []
	const idiomas = #{}
	var edad
	var maxActividades
	

	method adoraElSol() =  actividadesRealizadas.all({ a => a.bronceado() })
	method actividadesRealizadas() = actividadesRealizadas
	method actividadesEsforzadas() = actividadesRealizadas.filter({ a => a.implicaEsfuerzo() })
	
	method edad() = edad
	method idiomas() = idiomas
	
	method registrar(actividad){
		if (maxActividades > actividadesRealizadas.size()){
			actividadesRealizadas.add(actividad)
		}else{
			self.error("Ya realizó el máximo de actividades posibles")
		}
	}
	
	method leGusta(actividad)
	
	method noHizo(actividad) = !actividadesRealizadas.contains(self)
}

class Tranquilo inherits Socio{
	override method leGusta(actividad) = actividad.dias() >= 4
}

class Coherente inherits Socio{
	override method leGusta(actividad) = (self.adoraElSol() and actividad.bronceado()) or actividad.implicaEsfuerzo() 
}

class Relajado inherits Socio{
	override method leGusta(actividad) = idiomas.any({ i => actividad.idiomas().contains(i) })
}