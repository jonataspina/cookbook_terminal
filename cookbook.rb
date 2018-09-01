require_relative "receita.rb"

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

#Realiza loop até que o usuário digite a opção para sair
while opcao != 3   
    #Chama o menu e recebe uma opção válida
    opcao = menu

    case opcao 
    #Cadastro de receita
    when 1
        print "\nDigite o nome da sua receita: "
        nome_receita = gets.chomp
        
        print "Digite o modo de preparo: "
        modo_preparo = gets.chomp

        print "Digite o tipo da receita: "
        tipo_receita = gets.chomp

        nova_receita = Receita.new(nome_receita, modo_preparo, tipo_receita)
        receitas << nova_receita
        puts "\nReceita de #{nova_receita.nome} cadastrada com sucesso!"
    
    #Impressão de receitas
    when 2
        puts "\n"
        receitas.each_with_index do |r, index|
            puts "##{index+1} #{r.nome} - #{r.tipo}" 
            puts "\t#{r.modo_preparo}" 
        end
    end

    #Se não for sair, aguarda o usuário pressionar uma tecla para continuar
    if(opcao != 3)
        pressione_para_continuar
    end
end 

puts "\n\nSaindo...\nAté logo! ;)"
