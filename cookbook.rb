=begin
def menu
    puts "Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!\n\n"

    puts "[1] Cadastrar uma receita"
    puts "[2] Ver todas as receitas"
    puts "[3] Sair\n\n"

    opcao = -1
    while opcao != 1 && opcao != 2 && opcao != 3
        print "Escolha uma opção: "
        opcao = gets.chomp.to_i
        
        puts "\n"

        if(opcao != 1 && opcao != 2 && opcao != 3)
            puts "Opção inválida. :(\n\n"
        end 
    end 

    opcao
end 
=end
require 'io/console'                                                                                                       

#Método usado para aguardar um input do teclado do usuário
#   Assim a rotina só continua, após uma tecla ser pressionada.
def pressione_para_continuar                                                                                                               
    print "\n\nPressione uma tecla para continuar..."                                                                                                    
    STDIN.getch                                                                                                                                                                                                                            
end  

#Método usado para pressionar o menu do Cookbook e retornar uma opção válida.
def menu
    system "clear"

    puts "Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!\n\n"

    puts "[1] Cadastrar uma receita"
    puts "[2] Ver todas as receitas"
    puts "[3] Sair\n\n"

    print "Escolha uma opção: "
    opcao_selecionada = gets.chomp.to_i
    
    if opcao_selecionada != 1 && opcao_selecionada != 2 && opcao_selecionada != 3
        
        puts "\n\nOpção inválida. :("

        pressione_para_continuar
        
        opcao_selecionada = menu
    end 

    opcao_selecionada
end 

receitas = []
opcao = -1

while opcao != 3
    opcao = menu

    case opcao 
    when 1
        print "\nDigite o nome da sua receita: "
        nome_receita = gets.chomp
        receitas << nome_receita
        puts "\nReceita de #{nome_receita} cadastrada com sucesso!"
    when 2
        puts "\n"
        receitas.each_with_index do |r, index|
            puts "##{index+1} " + r 
        end
    end

    if(opcao != 3)
        pressione_para_continuar
    end
end 

puts "\n\nSaindo...\nAté logo! ;)"
