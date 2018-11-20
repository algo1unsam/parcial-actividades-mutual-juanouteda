import Socios.*

class Viaje{
	
	  var property idiomas = []
	  var tipoActividad //Mal usada esta variable, los tipos de actividades son subclases
	  
	  method hacerViajeImplicaEsfuerzo(){
	  return tipoActividad.implicaEsfuerzo()
	  }
	  
	  method sirveParaBroncearse(){
	  return tipoActividad.seBronceara()
	  }
	  
	  method diasQuellevaLaActividad(){
      return tipoActividad.tiempoViaje()
	}
	
	method esInteresante(){
	return idiomas.size()>1
		
	}
	 
	 method destinoEsInteresante(){
	 	tipoActividad.ciudadInteresante()
	 }
	 
	 method actividadEsAtractivaPara(unSocio){
	 return	unSocio.actividadEsAtractiva() and !unSocio.yaHiceEstaActividad()
	 }
}

class ViajePlaya inherits Viaje{
	var largoPlaya
	
	method tiempoViaje(){
		return largoPlaya / 500
	}
	
	 method implicaEsfuerzo(){
		return largoPlaya > 1200
	}
	
	 method seBronceara(){
		return true
	}
		
}



class Ciudad inherits Viaje{
	
	var atraccionesAVisitar 
	
	method tiempoViaje(){
		return atraccionesAVisitar / 2
	}
	
	 method implicaEsfuerzo(){
		 return  (atraccionesAVisitar >= 5)
	}
	
	 method seBronceara(){
		return false
	}
	
	override method esInteresante(){
		return (super() or atraccionesAVisitar == 5)
	}
	
}

class CiudadTropical inherits Ciudad{
	
	override method tiempoViaje(){
		return super()+1
	}
	
	
	
	 override method seBronceara(){
		return true
	}
	
}

class SalidaTrekking inherits Viaje{
	var kmSenderos
	var diasDeSol
	
	method tiempoViaje()= kmSenderos / 50
	method implicaEsfuerzo()= kmSenderos > 80
	method seBronceara()= (((diasDeSol > 200) or (diasDeSol.between(100,200))) and kmSenderos > 120)
	override method esInteresante()= (super() and diasDeSol > 140)

}

class ClaseGimnasia inherits Viaje{
		
		method seManejaUnSoloIdioma(){ //Confunde efecto con devolución
			idiomas = ["espaniol"]
			return idiomas
		}
		
	 	method tiempoViaje(){
		return 1
	}
	
	 	method implicaEsfuerzo(){
		return  true
	}
	
		method seBronceara(){
		return false
	}
		
		override method actividadEsAtractivaPara(unSocio){
	 	return	unSocio.edad().between(20,30)
	 }
	
}
	 
