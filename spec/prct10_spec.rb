require 'spec_helper'
require 'prct10'

describe Prct10 do

	describe Prct10::Preg do
		  before :each do
		    @preg1=Prct10::Preg.new(
 			:pregunta => "salida de : 
 			class Xyz \n def pots\n
 			@nice\n end\nend\n")
		  end
		  context "La Pregunta tiene que tener un enunciado" do
		      it "tiene que tener un enunciado" do
			  expect(@preg1.pregunta) == 'salida de : 
				class Xyz \n def pots\n
				  @nice\n end\nend\n'
		      end
		  
		 end
	end		
	
	describe Prct10::EleccionSimple do
	  before :each do 
		@preg1=Prct10::EleccionSimple.new(
 			    :pregunta => "salida de :
			    class Array \n 
			    def say_hi \n HEY!end end \n
			    p[1,, bob].say_hi", 
 			    :op_correcta => "Ninguna de las anteriores",
 			    :op_incorrecta => ['1', 'bob', 'HEY!'])
		@preg2=Prct10::EleccionSimple.new(
			  :pregunta => "salida de :
 			  class Objeto \n
 			  end", :op_correcta => "Una instancia de la clase Class",
 			  :op_incorrecta => ['una constante', 'un objeto', 'ninguna de las anteriores'])
	  end
	  context "Clase EleccionSimple" do
		it "Es de la clase SeleccionSimple" do
		    expect(@preg1.class) ==  Prct10::EleccionSimple      
		end
	        
		it "Debe tener una respuesta correcta y varias incorrecta" do
		      expect(@preg1.op_correcta) == 'Ninguna de las anteriores'	       
		      expect(@preg1.op_incorrecta) == ['1', 'bob', 'HEY!']       
		end	
	    
		it "tiene que tener un metodo to_s" do
		      expect(@preg1).to respond_to :to_s       
		end	
		it "Comparando preguntas" do
		      expect(@preg2==@preg1).to eq(false)
		      expect(@preg1 < @preg2).to eq(true)
		  
	    
		end
	  end	    
		  
	end

	describe Prct10::Verdadero_Falso do
	  before :each do 
	    @preg1=Prct10::Verdadero_Falso.new(
 		:pregunta => "Es apropiado que una clase tablero herede de la clase juego? ",
 		:op_verdadera => "Falso", :op_falsa => "Cierto")
	    @preg2=Prct10::Verdadero_Falso.new(
		:pregunta => "salida de :
		hash_raro ={ \n
		[1, 2, 3] => Object.new(), \n
 		Hash.new => :toto
 		}", :op_verdadera => "Cierto", 
		:op_falsa => "Falso" )
	  end
		  
	  context "Clase EleccionSimple" do
	    it "Es de la clase SeleccionSimple" do
	      expect(@preg1.class) ==  Prct10::Verdadero_Falso    
	    end
	    it "Debe tener una respuesta correcta y varias incorrecta" do
	      expect(@preg1.op_verdadera) == 'Cierto'	       
	      expect(@preg1.op_falsa) == 'Falso'      
	    end	
	    it "tiene que tener un metodo to_s" do
	      expect(@preg1).to respond_to :to_s       
	    end	
	    it "Comparando preguntas" do
		       #expect(@preg2==@preg1).to eq(false)
	      expect(@preg2 > @preg1).to eq(true)
	    end
	    it "son el mismo objeto" do
	      expect(@preg1.object_id == @preg2.object_id).to eq(false)
	    end
	    it "responde a metodos de clase" do
		class << Prct10::Verdadero_Falso
		     def hola
		     "hola mundo"
		     end
		   end
		expect(Prct10::Verdadero_Falso).to respond_to :hola 
		  
	    end
	  end
		end

	describe Prct10::Lista_enlazada do
		before :each do
			nodo = Struct.new(:valor, :antes, :siguiente)
			@lista_enlazada=Prct10::Lista_enlazada.new
			@preg1=Prct10::EleccionSimple.new(
				:pregunta => "salida de : 
				class Xyz \n def pots\n
				@nice\n end\nend\n",:op_correcta => "nil",
			 	:op_incorrecta => ['#<Xyz:0x00000002bf0ed0>','0', "ninguna de las anteriores" ])
			@preg2=Prct10::EleccionSimple.new(
			      :pregunta => "salida de :
			      hash_raro ={ \n
			      [1, 2, 3] => Object.new(), \n
			      Hash.new => :toto
			      }", :op_correcta => "Cierto", 
			      :op_incorrecta => ['Falso'] )
			@preg3=Prct10::EleccionSimple.new(
			      :pregunta => "salida de :
			      class Array \n 
			      def say_hi \n
			      HEY! 
			      end
			      end \n
			      p[1,, bob].say_hi", 
			      :op_correcta => "Ninguna de las anteriores",
			      :op_incorrecta => ['1', 'bob', 'HEY!'])
			@preg4=Prct10::EleccionSimple.new(
			      :pregunta => "salida de :
			      class Objeto \n
			      end", :op_correcta => "Una instancia de la clase Class",
			      :op_incorrecta => ['una constante', 'un objeto', 'ninguna de las anteriores'])
			@preg5=Prct10::EleccionSimple.new(
			      :pregunta => "es apropiado que una clase tablero herede de la clase juego? ",
			      :op_correcta => "Falso", :op_incorrecta=> ['Cierto'])
			@lista_enlazada.push(@preg1)
			@lista_enlazada.push(@preg2)
			@lista_enlazada.push(@preg3)
			@lista_enlazada.push(@preg4)
			@lista_enlazada.push(@preg5) 
							
 		end
		context "Comprobacion de existencia de metodos" do
 			it "existe un metodo pop" do
 				expect(@lista_enlazada).to respond_to :pop
 			end
  			it "existe un metodo push" do
 				expect(@lista_enlazada).to respond_to :to_tex
 			end
 		end
		context "Clase Lista_enlazada " do 
		  it "Pertenece a la clase lista_enlazada"do
		         expect(@lista_enlazada.class) ==  Prct10::Lista_enlazada       
		  end
		  it "se debe poder introducir un elemento en cualquier lugar "do
			 expect(@lista_enlazada.cabeza.valor).to eq(@preg5)
		  end
		  it " se puede hacer un max preguntas" do
		    expect(@lista_enlazada.max) == (@preg5)
		  end
		  it "se debe poder sacar un elemento en cualquier lugar "do
			@lista_enlazada.pop()
			@lista_enlazada.pop()
			@lista_enlazada.pop()
			@lista_enlazada.pop()
			expect(@lista_enlazada.cabeza.valor).to eq(@preg1)
		  end
		  it "Se puede hacer un find" do
		    @lista_enlazada.find{ |i| i }
		  end
		end

      end 	

	describe Prct10::Examen do
	  describe Prct10::Interfaz do
	    before :each do
		@lista = Prct10::Lista_enlazada.new
	        @preg1=Prct10::EleccionSimple.new(
					      :pregunta => "salida de : 
					      class Xyz \n def pots\n
					      @nice\n end\nend\n",:op_correcta => "nil",
					      :op_incorrecta => ['#<Xyz:0x00000002bf0ed0>','0', "ninguna de las anteriores" ])
							      
	        @preg2=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    hash_raro ={ \n
					    [1, 2, 3] => Object.new(), \n
					    Hash.new => :toto
					    }", :op_correcta => "Cierto", 
					    :op_incorrecta => ['Falso'] )
												      
	        @preg3=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    class Array \n 
					    def say_hi \n
					    HEY! 
					    end
					    end \n
					    p[1,, bob].say_hi", 
					    :op_correcta => "Ninguna de las anteriores",
					    :op_incorrecta => ['1', 'bob', 'HEY!'])
								      
	        @preg4=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    class Objeto \n
					    end", :op_correcta => "Una instancia de la clase Class",
					    :op_incorrecta => ['una constante', 'un objeto', 'ninguna de las anteriores'])
								      
		@preg5=Prct10::EleccionSimple.new(
					    :pregunta => "es apropiado que una clase tablero herede de la clase juego? ",
					    :op_correcta => "Falso", :op_incorrecta=> ['Cierto'])
		@lista.push(@preg1)
		@lista.push(@preg2)
		@lista.push(@preg3)
		@lista.push(@preg4)
		@lista.push(@preg5) 
		#Lista de prueba para el reverse				    
		@listaprueba = Prct10::Lista_enlazada.new
		@listaprueba.push(@preg5)
		@listaprueba.push(@preg4)
		@listaprueba.push(@preg3)
		@listaprueba.push(@preg2)
		@listaprueba.push(@preg1)
		
		@examen = Prct10::Examen.new(@lista)
		
		@examen.opcion_correcta = ["Falso","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
		@exameninterfaz = Prct10::Interfaz.new(@lista)
		#opcion para sacar un 10
		@exameninterfaz.examen.opcion_correcta = ["Falso","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
		@exameninterfaz.opcion_marcadas_usuario[1] = ["Falso","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
		@exameninterfaz.opcion_marcadas_usuario[2]= ["Verdadero","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
		@exameninterfaz.opcion_marcadas_usuario[3]= ["2","3", "1", "@preg4.op_correcta", "Cierto"]
		
	 end 
	      
	      #pruebas para la clase interfaz y examen
	   context "Pruebas de examen e interfaz" do
	      it "Existe una clase examen" do
		expect(@examen.class).to eq Prct10::Examen
	      end
	      
	      it "La clase examen tiene una lista de preguntas" do
		expect(@examen.lista_enlazada.class).to eq Prct10::Lista_enlazada
	      end
		                                          
	      it "La clase examen tiene ademas las respuestas validas del examen" do
		expect(@examen.opcion_correcta).to eq ["Falso","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
	      end
	      
	       it "el reverse funcional sera" do
	      expect(@exameninterfaz.examen.lista_enlazada.reverse{}).not_to eq (@exameninterfaz.examen.lista_enlazada )
	      end
	      
	      it "ademas, sera justo el reverse" do
		@a = Prct10::Lista_enlazada.new
		@a = @exameninterfaz.examen.lista_enlazada.reverse{}
		
 		expect(@listaprueba.pop).to eq (@a.pop)
 		expect(@listaprueba.pop).to eq (@a.pop)
 		expect(@listaprueba.pop).to eq (@a.pop)
 		expect(@listaprueba.pop).to eq (@a.pop)
 		expect(@listaprueba.pop).to eq (@a.pop)
	      end
		  
	      it "La clase interfaz tendra un atributo de la clase examen" do
		expect(@exameninterfaz.examen.class) == Prct10::Examen
	      end
	      
	      it "Y esa clase examen tiene un atributo de tipo Lista Enlazada" do
		expect(@exameninterfaz.examen.lista_enlazada.class) == Prct10::Lista_enlazada
	      end
		       
	      it "Ademas, la clase grafico tendra dos contadores de tipo entero" do
		expect(@exameninterfaz.correctas.is_a?Integer).to eq (true)
		expect(@exameninterfaz.incorrectas.is_a?Integer).to eq (true)
	      end
	      
	      it "La clase grafico tendra datos para diferentes usuarios" do
		expect(@exameninterfaz.opcion_marcadas_usuario[1]).not_to eql(@exameninterfaz.opcion_marcadas_usuario[2])
	      end
	      #nota =10
	      it "La clase examen te dice si estas aprobado" do
		@exameninterfaz.calcular_nota(@exameninterfaz.opcion_marcadas_usuario, 1)
		expect(@exameninterfaz.mostrar_resultado)== (true)
	      end
	      
	      #nota = 8
	      it "La clase examen te dice si estas aprobado" do
		#@exameninterfaz.opcion_marcadas_usuario = ["Verdadero","Una instancia de la clase Class", "Ninguna de las anteriores", "Cierto", "nil"]
		@exameninterfaz.calcular_nota(@exameninterfaz.opcion_marcadas_usuario, 2)
		expect(@exameninterfaz.mostrar_resultado)== (true)
	      end
	     
	      #nota = 0
	      it "La clase examen te dice si estas suspendido" do
		#@exameninterfaz.opcion_marcadas_usuario = ["2","3", "1", "@preg4.op_correcta", "Cierto"]
		@exameninterfaz.calcular_nota(@exameninterfaz.opcion_marcadas_usuario, 3)
		expect(@exameninterfaz.mostrar_resultado).to eq (false)
	      end
  
	
	    it "Pertenece a la clase lista_enlazada " do
	      expect(@examen.class.ancestors) == Kernel
	    end
	    it "Donde pertenece" do
	      expect(@examen.class.superclass) == Object
	    end  
	    
	   
	end
	  
	
	
  end
      end

	describe Prct10::Quiz do
	   before :each do
		  @title="cuestionario LPP 14/15"
		  @cuestionario= Prct10::Quiz.new(title)
		 	  
		 @preg1=Prct10::EleccionSimple.new(:pregunta => "salida de : 
					      class Xyz \n def pots\n
					      @nice\n end\nend\n",:op_correcta => "nil",
					      :op_incorrecta => ['#<Xyz:0x00000002bf0ed0>','0', "ninguna de las anteriores" ])
							      
	        @preg2=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    hash_raro ={ \n
					    [1, 2, 3] => Object.new(), \n
					    Hash.new => :toto
					    }", :op_correcta => "Cierto", 
					    :op_incorrecta => ['Falso'] )
												      
	        @preg3=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    class Array \n 
					    def say_hi \n
					    HEY! 
					    end
					    end \n
					    p[1,, bob].say_hi", 
					    :op_correcta => "Ninguna de las anteriores",
					    :op_incorrecta => ['1', 'bob', 'HEY!'])
								      
	        @preg4=Prct10::EleccionSimple.new(
					    :pregunta => "salida de :
					    class Objeto \n
					    end", :op_correcta => "Una instancia de la clase Class",
					    :op_incorrecta => ['una constante', 'un objeto', 'ninguna de las anteriores'])
								      
		@preg5=Prct10::EleccionSimple.new(
					    :pregunta => "es apropiado que una clase tablero herede de la clase juego? ",
					    :op_correcta => "Falso", :op_incorrecta=> ['Cierto'])
		
		@cuestionario.recibiendo_datos{@preg1,@preg2,@preg3,@preg4,@preg5} 
		
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("0")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("Cierto")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("Ninguna de las anteriores")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("una constante")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("Falso")
		@cuestionario.exameninterfaz.examen.opcion_correcta.push("nil")
		@cuestionario.exameninterfaz.examen.opcion_correcta.push("Cierto")
		@cuestionario.exameninterfaz.examen.opcion_correcta.push("Ninguna de las anteriores")
		@cuestionario.exameninterfaz.examen.opcion_correcta.push("Una instancia de la clase Class")
		@cuestionario.exameninterfaz.examen.opcion_correcta.push("Falso")
		  
		  	  
	   end
	  context "mierdas varias"
	     it "La clase examen te dice si estas aprobado" do
		@cuestionario.exameninterfaz.calcular_nota(@cuestionario.exameninterfaz.opciones_marcadas_usuario)
		expect(@exameninterfaz.mostrar_resultado)== (true)
	      end
	      
	       
	      #nota = 0
	      it "La clase examen te dice si tienes 10" do
		#@exameninterfaz.opcion_marcadas_usuario = ["2","3", "1", "@preg4.op_correcta", "Cierto"]
		@cuestionario.exameninterfaz.calcular_nota(@cuestionario.exameninterfaz.examen.opcion_correcta)
		expect(@cuestionario.exameninterfaz.mostrar_resultado).to eq (true)
	      end
	       it "La clase examen te dice si estas suspenso" do
		 @cuestionario.exameninterfaz.opciones_marcadas_usuario.push("0")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("falso")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("bob")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("una constante")
		@cuestionario.exameninterfaz.opciones_marcadas_usuario.push("Cierto")
		@cuestionario.exameninterfaz.calcular_nota(@cuestionario.exameninterfaz.opciones_marcadas_usuario)
		expect(@cuestionario.exameninterfaz.mostrar_resultado)== (false)
	      end
	   
	   
	   
	end
	  
	end
    
      
      
end	

  
  
  
  
  
  
  
  
  
  