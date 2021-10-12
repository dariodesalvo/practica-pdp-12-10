class SinEmpleadosException inherits Exception{}

class Persona inherits Exception {
	var property celulas = 100000
	var temperatura = 36
	const enfermedades =[] 
	
	method temperatura(grados){
		if((temperatura+grados)<=45)
			temperatura += grados
		else
			throw new Exception(message = "La persona entró en coma")
	}
	
	method temperatura(){
		return temperatura
	}
	
	method contraer(enfermedad){
		if(enfermedades.size()<5)
			enfermedades.add(enfermedad)
		else
			throw new Exception(message = "No se pueden contraer más de 5 enfermedades")
	}
	method pasarUnDia(){
		enfermedades.forEach({
			unaEnfermedad => unaEnfermedad.actua(self)})
	}
}
class EnfermedadAutoinmune {
	var celulasAmenazadas
	var property diasTranscurridos
	
	method actua(huesped){
		huesped.celulas(huesped.celulas()-celulasAmenazadas)
		diasTranscurridos += 1
	}
	
	method esAgresiva(huesped){
		return diasTranscurridos>30
	}
}
class EnfermedadInfecciosa {
	var celulasAmenazadas
	
	method actua(huesped){
		huesped.temperatura(celulasAmenazadas/1000)
	}
	
	method reproducir(){
		celulasAmenazadas += celulasAmenazadas
	}
	
	method esAgresiva(huesped){
		celulasAmenazadas > (huesped.celulas()*0.1)
	}
}

