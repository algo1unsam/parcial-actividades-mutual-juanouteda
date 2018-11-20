import Mutuales.*
object exceptionSeSuperoElMaximoDeActividadesPosibles inherits Exception {}
class Socio{
		var property actividades =[]	
		const cantMaximaDeActividades
		var property edad
		var idiomas=[]
		var tipoSocio // No se usa
		
		method registrarActividad(unaActividad){
			if (actividades.size()<cantMaximaDeActividades)
			actividades.add(unaActividad)
			else throw exceptionSeSuperoElMaximoDeActividadesPosibles
		}
		
		method esAdoradorDelSol(){
		return	actividades.all{unaActividad=>unaActividad.seBronceara()}
		}
		
		method actividadesConEsfuerzo(){
	 	return actividades.filter{unaActividad => unaActividad.implicaEsfuerzo()}
		}
		
		
		method actividadEsAtractiva(){
		return tipoSocio.esAtractiva()
		}
		
		method yaHiceEstaActiviadad(unaActividad){
		return actividades.contains(unaActividad)
		}
		

}	 

object tranquilo inherits Socio{ // Deberian ser clase. hay muchos socios tranquilos, cada uno con sus actividades
	
		method esAtractiva(){ //Falta recibir la actividad. 
		return actividades.any{unaActividad => unaActividad.tiempoViaje() > 4}
		}
}

object coherente inherits Socio{
		method esAtractiva(){
		return	self.esAdoradorDelSol() or actividades.any{unaActividad => unaActividad.implicaEsfuerzo()}
			
		}
}

object relajado inherits Socio{
		method esAtractiva(){
		return	idiomas.any{unIdioma => actividades.forEach{unaActividad=> unaActividad.idioma().contains(unIdioma)}}
		//Mal usado el foreach
		}
}

