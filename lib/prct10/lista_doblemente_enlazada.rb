module Prct10
  class Lista_enlazada
    
    include Enumerable
    attr_accessor :cabeza,:valor, :siguiente,:antes,:nodo1, :lista_reverse
    
    # create a Struct with :value and :next
    Nodo = Struct.new(:valor, :antes,:siguiente )
    def initialize()
   	@cabeza=nil
	#@ultelem=b
    end
 
    def push(preg)
       if @cabeza == nil
	 @nodo1=Nodo.new(preg,nil,nil)
	 @cabeza=@nodo1
	else
	  @nodo1=Nodo.new(preg,nil,nil)
	  @cabeza.antes=@nodo1
	  @nodo1.siguiente=@cabeza
	  @cabeza=@nodo1
	end  
    end
    
    def to_tex
    end
    
    def pop()
      if @cabeza== nil
	#puts "lista vacia"
      else
	@nodo1=@cabeza
	@cabeza=@cabeza.siguiente
	#@cabeza.antes=nil
	@nodo1.siguiente=nil
	a=@nodo1.valor
	#puts "sacando valor"
      end
    end
    
    def empty
      if @cabeza==nil
	a=true
      else 
	a=false 
      end
      a
    end
    
     def reverse
	@lista_reverse = Prct10::Lista_enlazada.new
	self.each_with_index do |n|
	   yield @lista_reverse.push(n)
	  
	end
	return @lista_reverse
     end
      
      
    def each
      if(@cabeza!=nil)
	  @aux =@cabeza
	  while( @aux!=nil )
	    yield @aux.valor
	    @aux=@aux.siguiente
	  end
      end
    
    end
end
end