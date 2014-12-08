#require 'pry'
module Prct10
  class Preg
  attr_accessor :pregunta
    
    include Comparable
  
    def initialize args
      @pregunta = args
	raise ArgumentError , 'Specify :pregunta , :op_correcta y :op_incorrecta' unless @pregunta
    end
    
#      def to_html
# 		opcion = @op_incorrecta+[@op_correcta]
# 		opcion = opcion.shuffle
# 		s= ''
# 		opcion.each do |opcion|
# 
# 			s += %Q{<input type="radio" value="#{opcion}" name = 0 > #{opcion}\n}
# 		end	
# 		
# 		#html <<= -"HTML"
# 		"#{@pregunta}<br/>\n#{s}\n"
#     end
    
    def <=>(other)
      pregunta <=> other.pregunta
      #pregunta == other.pregunta
    end
  
  end 

    class EleccionSimple <Preg 
    attr_accessor :op_correcta, :op_incorrecta
    
      
    def initialize args
     
    
      super(args[:pregunta])
      @op_correcta = args[:op_correcta]
	raise ArgumentError , 'Specify :pregunta , :op_correcta y :op_incorrecta' unless @op_correcta
      @op_incorrecta = args[:op_incorrecta]
        raise ArgumentError , 'Specify :pregunta , :op_correcta y :op_incorrecta' unless @op_incorrecta
      
	
    end
    

   def <=> (other)
   
    if other.instance_of? Verdadero_Falso
	op_correcta <=> other.op_verdadera && super
	  else 
	op_correcta <=> other.op_correcta && super
    end
    
    
   end
   
      def to_s
      opcion = @op_incorrecta+[@op_correcta]
      opcion = opcion.shuffle
      s= ''
      opcion.each do |opcion|
	
	s += %Q{-#{opcion}\n}
	
      end
	 "#{@pregunta} \n #{s}\n"

	
    end
		
  end
  
  
  class Verdadero_Falso < Preg
    
    attr_accessor :op_verdadera, :op_falsa
        
    def initialize args
      super(args[:pregunta])
      @Op_verdadera = args[:op_verdadera]
	raise ArgumentError , 'Specify :pregunta , :Op_verdadera y :op_falsa' unless @Op_verdadera
      @op_falsa = args[:op_falsa]
        raise ArgumentError , 'Specify :pregunta , :Op_verdadera y :op_falsa' unless @op_falsa

      
      
      
    end
    
   
    
      def to_s
	opcion = @op_falsa+[@op_verdadera]
	opcion = opcion.shuffle
	s= ''
	opcion.each do |opcion|
	  
	  s += %Q{-#{opcion}\n}
	
	end
	"#{@pregunta} \n #{s}\n"

	
      end#def to_s
   

	def <=>(other)
	  #super
	  if other.instance_of? EleccionSimple
	   op_verdadera <=> other.op_correcta && super
	  else 
	  op_verdadera <=> other.op_verdadera && super
	   #op_falsa == other.op_falsa
	  end
	end
    
  end
end