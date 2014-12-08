module Prct10
  class Examen
    attr_accessor :lista_enlazada, :opcion_correcta
      
      def initialize(lista)
	#lista en initialize
	#nodo = Struct.new(:valor, :antes,:siguiente )
	@lista_enlazada=lista
	#@opcion_marcada = []
	@opcion_correcta = []
      end

end
end