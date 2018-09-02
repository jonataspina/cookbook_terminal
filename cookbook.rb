require_relative "receita.rb"

require 'io/console'                                                                                                       

#Método usado para aguardar um input do teclado do usuário
#   Assim a rotina só continua, após uma tecla ser pressionada.
def pressione_para_continuar                                                                                                               
    print "\n\nPressione uma tecla para continuar..."                                                                                                    
    STDIN.getch                                                                                                                                                                                                                            
end  

#Magic Numbers
CADASTRAR_RECEITA = 1
VER_RECEITAS = 2
BUSCAR_RECEITA = 3
REMOVER_RECEITA = 4
SAIR = 5

$receitas = []
$novo_id = 0

#Método usado para pressionar o menu do Cookbook e retornar uma opção válida.
def menu
    system "clear"

    puts "Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!\n\n"

    puts "[#{CADASTRAR_RECEITA}] Cadastrar uma receita"
    puts "[#{VER_RECEITAS}] Ver todas as receitas"
    puts "[#{BUSCAR_RECEITA}] Buscar receitas"
    puts "[#{REMOVER_RECEITA}] Remover receitas"
    puts "[#{SAIR}] Sair\n\n"

    print "Escolha uma opção: "
    opcao_selecionada = gets.chomp.to_i
    
    if opcao_selecionada < 1 || opcao_selecionada > 5
        
        puts "\n\nOpção inválida. :("

        pressione_para_continuar
        
        opcao_selecionada = menu
    end 

    opcao_selecionada
end 

#Métodos gerais
#Imprime uma receita
def imprime_receita(receita)
    puts "\n##{receita.id} #{receita.nome} - #{receita.tipo}" 
    puts "\t#{receita.modo_preparo}"     
end

#Busca uma receita pelo id
def busca_receita_por_id(id_busca)
    receita_encontrada = nil

    $receitas.each do |receita|
        if(receita.id == id_busca)
            receita_encontrada = receita 
        end
    end 

    receita_encontrada
end

#Busca uma receita pelo nome
def busca_receita_por_nome(nome_busca)
    receita_encontrada = nil

    $receitas.each do |receita|
        if(receita.nome.include? nome_busca)
            receita_encontrada = receita 
        end
    end 

    receita_encontrada
end

#Busca receitas pelo nome e retorna um array com as receitas encontradas
def busca_receitas_por_nome(nome_busca)
    nome_busca = nome_busca.upcase
    receitas_encontradas = []

    receitas_encontradas = $receitas.select do |receita|
        receita.nome.upcase.include? nome_busca    
    end

    receitas_encontradas
end 

#Métodos do Menu
def cadastra_receita
    puts "\n--------CADASTRO DE RECEITA--------"

    print "\nDigite o nome da sua receita: "
    nome_receita = gets.chomp
    
    print "Digite o modo de preparo: "
    modo_preparo = gets.chomp

    print "Digite o tipo da receita: "
    tipo_receita = gets.chomp

    $novo_id = $novo_id + 1 

    nova_receita = Receita.new($novo_id, nome_receita, modo_preparo, tipo_receita)
    $receitas << nova_receita
    puts "\nReceita de #{nova_receita.nome} cadastrada com sucesso!"  
    puts "\n----------------------------------"
end 

#Imprime todas as receitas do array.
    #Pode ser usado por outros métodos a fim de listar as receitas
    # (retorna true se encontrar receitas e false em caso oposto)
def imprime_receitas(receitas = nil) 
    if(receitas == nil)
        receitas = $receitas
    end 

    if(receitas.length != 0)
        puts "\n----RECEITAS----"
        receitas.each do |receita|
            imprime_receita(receita)
        end
        puts "\n----------------"

        return true
    else
        puts "\nNenhuma receita cadastrada."
        return false
    end
end 

def busca_receita
    puts "\n--------BUSCA DE RECEITA--------"
    print "\nDigite o nome da receita que deseja buscar: "
    nome_receita_buscar = gets.chomp

    receitas_encontradas = busca_receitas_por_nome(nome_receita_buscar)

    if(receitas_encontradas.length > 0)
        puts "\nReceitas encontradas pela palavra #{nome_receita_buscar}:"
        imprime_receitas(receitas_encontradas)        
    else
        puts "\nNenhuma receita encontrada."
    end
    puts "\n--------------------------------"
end 

#Método para remover receitas.
    #Lista as receitas e usa o id da receita que usuário digita
    # para buscar a receita e remove-la do array (remoção lógica)
def remove_receita
    puts "\n--------REMOÇÃO DE RECEITA--------"
    if(imprime_receitas)

        print "\nEscolha o número da receita que deseja apagar: "
        id_receita_apagar = gets.chomp.to_i

        receita_apagar = busca_receita_por_id(id_receita_apagar)

        $receitas.delete(receita_apagar)  
        
        puts "\nReceita de #{receita_apagar.nome} apagada com sucesso!"
    end
    puts "\n---------------------------------"
end 

opcao = -1

#Realiza loop até que o usuário digite a opção para sair
while opcao != SAIR   
    #Chama o menu e recebe uma opção válida
    opcao = menu

    case opcao 
    #Cadastro de receita
    when CADASTRAR_RECEITA
        cadastra_receita
    #Impressão de receitas
    when VER_RECEITAS
        imprime_receitas
    #Busca de receitas
    when BUSCAR_RECEITA
        busca_receita
    #Remoção de receitas
    when REMOVER_RECEITA
        remove_receita
    end

    #Se não for sair, aguarda o usuário pressionar uma tecla para continuar
    if(opcao != SAIR)
        pressione_para_continuar
    end
end 

puts "\n\nSaindo...\nAté logo! ;)"