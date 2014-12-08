module Prct10
  class Quiz
    attr_accessor :title, :pregunta, :entrada_usuario, :exameninterfaz
    
    def initialize(a)
      @title=a
      @lista_enlazada = Prct10::Lista_enlazada.new
      @exameninterfaz=nil
      @entrada_usuario = Prct10::Lista_enlazada.new
      
     end 
     
     def recibiendo_datos 
       self.each_with_index do |n|
	yield @lista_enlazada.push(n)
       end
       @exameninterfaz = Prct10::Interfaz.new(@lista_enlazada)
       @aux = @lista_enlazada
       while (@aux.cabeza != nil) #meter en examen las respuestas correctas
	  @exameninterfaz.examen.opcion_correcta.push(@aux.pop.op_correcta)
	end
     end
      
         
    
    def run
      @a = Prct10::Lista_enlazada.new
      @entrada_usuario = @lista_enlazada
      
      while (@entrada_usuario.cabeza != nil)
	@valor = @entrada_usuario.pop
	puts @valor.to_s
	puts "Respuesta :"
	STDOUT.flush
	ciudad = gets.chomp
	@a.push(ciudad)
      end
      
      @entrada_usuario = @a.reverse
      
      #tener en cuentaaa en el spec
      @exameninterfaz.opciones_marcadas_usuario = @entrada_usuario
      #@exameninterfaz.examen.opcion_correcta = @entrada_usuario #inicializado examen completo
      
    end
    
 end
end     
