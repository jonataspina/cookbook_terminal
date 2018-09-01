class Receita 
    attr_reader :nome, :modo_preparo, :tipo
    attr_writer :modo_preparo, :tipo
    
    def initialize(nome, modo_preparo=nil, tipo=nil)
        @nome = nome
        @modo_preparo = modo_preparo
        @tipo = tipo
    end 
    
end 