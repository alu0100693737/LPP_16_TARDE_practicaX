module Prct10
    class Interfaz
	attr_accessor :examen, :lista, :correctas, :incorrectas, :opcion_marcadas_usuario
	def initialize(lista)
	
	  @examen = Prct06::Examen.new(lista)
	  
	  @opcion_marcadas_usuario = []
	  
	  @correctas=0
	  @incorrectas=0
	end
	
	def calcular_nota(respuestas, usuario)
	    aux = @examen.lista_enlazada.cabeza
	    cont = 0
	    @resp_usuario = []
	    @resp_usuario = respuestas[usuario]
	    while (aux != nil)
		aux.valor.to_s
		#puts "#{aux.valor.to_s}"
		#puts "#{respuestas[cont]}"
		#puts "*************************"
		if (@resp_usuario[cont] == aux.valor.op_correcta)
		    @correctas = @correctas+2
		else
		    @incorrectas=@incorrectas+2
		end
		aux= aux.siguiente
		cont = cont +1
	    end
	    if (@correctas !=0 || @incorrectas !=0)
		return true
	    else
		return false
	    end
	end #calcular_nota
	
	def mostrar_resultado
	  puts "\nSu nota es #{@correctas}\n"
	  if (@correctas> @incorrectas)
	      puts "Ha aprobado. Felicidades"
	      return true
	  else
	      puts "Ha suspendido. Intentelo de nuevo"
	      return false
	  end
	  
	  @correctas=0
	  @incorrectas=0
	end
    end
end