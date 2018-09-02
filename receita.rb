class Receita 
    attr_reader :id, :nome 
    attr_accessor :modo_preparo, :tipo
    
    def initialize(id, nome, modo_preparo=nil, tipo=nil)
        
        @id = id
        @nome = nome
        @modo_preparo = modo_preparo
        @tipo = tipo
    end 
    
end 