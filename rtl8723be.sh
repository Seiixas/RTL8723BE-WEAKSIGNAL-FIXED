#!/bin/bash

Main () {
    clear
    if [ "$(id -u)" != "0" ]; 
    then
        echo -e "\033[41;1;37m######################## ERRO ########################"
        echo -e "# Por favor, execute esse script em modo root (sudo) #"
        echo -e -n "######################################################"
        read key
        echo -e "\033[0m"
    else
        echo -e "\033[5;30m \033[1;32m
\t  _____      _                 _____             
\t / ____|    (_)               |  __ \            
\t| (___   ___ ___  ____ _ ___  | |  | | _____   __
\t \\___ \\ / _ \\ \\ \\/ / _\` / __| | |  | |/ _ \ \ / /
\t ____) |  __/ |>  < (_| \__ \ | |__| |  __/\ V / 
\t|_____/ \___|_/_/\_\__,_|___/ |_____/ \___| \_/  
\t          \033[0m" 
        echo -e "\033[43;1;37m#################### CORRIGINDO INTERFACE RTL8723BE ###################"
        echo -e "# Antes de continuar, tenha certeza de que sua interface de rede wifi #\n# é a Realtek RTL8723BE por meio do comando 'lscpci | grep Network'   #"
        echo -e "\033[43;1;37m#######################################################################"
        echo -e -n "\n\033[0m\t  Pressione qualquer tecla para entrar no menu"
        read key
        Menu
    fi
}

Menu () {
    clear
    while [ true ]
    do
        echo -e "\033[1;36mm############################## MENU ###############################\n"
        echo -e "#\t\t   1. Solucionar (1ª maneira)\t\t\t   #\n#\t\t   2. Solucionar (2ª maneira)\t\t\t   #\n#\t\t   3. Desfazer alterações\t\t\t   #\n# \t\t   4. Explicando o problema\t\t\t   #\n#\t\t   5. Sobre\t\t\t\t\t   #\n#\t\t   6. Sair\t\t\t\t\t   #\n"
        echo -e "####################################################################"
        echo -e -n "\n\t> Digite o índice da operação desejada: "
        read op
        case $op in
            1) Solucionar1; break;;
            2) Solucionar2; break;;
            3) Desfazer; break;;
            4) Problema; break;;
            5) Sobre; break;;
            6) clear; echo "Obrigado! :)"; exit;;
            *) clear; echo -e "\033[41;1;37m                    Erro: Operação inexistente                      \033[0m";;
        esac 
    done
}

Solucionar1() {
    clear
    echo -e "\033[1;37m############################ SOLUÇÃO 1 ##############################\n"
    echo -e "\033[1;36m# Sobre: \t\t\t\t\t\t\t    #\n# A primeira solução consiste em modificar o arquivo rtl8723be.conf #\n# de forma que o valor de ant_sel seja igual a 1.\t\t    #"
    echo -e "\033[1;33m\n# Aviso: \t\t\t\t\t\t\t    #\n# Ao final da configuração seu sistema será reinciado, portanto,    #\n# salve todos os seus arquivos e projetos abertos.\t\t    #"
    echo -e "\033[1;37m\n#####################################################################\n"
    echo -e -n "\033[1;37m\t> Deseja continuar? (y/n) "
    read key
    case $key in
        y) Solucionar 1;;
        Y) Solucionar 1;;
        *) Menu;;
    esac
}

Solucionar2() {
    clear
    echo -e "\033[1;37m############################ SOLUÇÃO 2 ##############################\n"
    echo -e "\033[1;36m# Sobre: \t\t\t\t\t\t\t    #\n# A segunda solução consiste em modificar o arquivo rtl8723be.conf  #\n# de forma que o valor de ant_sel seja igual a 2.\t\t    #"
    echo -e "\033[1;33m\n# Aviso: \t\t\t\t\t\t\t    #\n# Ao final da configuração seu sistema será reinciado, portanto,    #\n# salve todos os seus arquivos e projetos abertos.\t\t    #"
    echo -e "\033[1;37m\n#####################################################################\n"
    echo -e -n "\033[1;37m\t> Deseja continuar? (y/n) "
    read key
    case $key in
        y) Solucionar 2;;
        Y) Solucionar 2;;
        *) Menu;;
    esac
}

Desfazer() {
    clear
    echo -e "\033[1;37m############################ DESFAZER ###############################\n#\t\t\t\t\t\t\t\t    #"
    DIRETORIO=/etc/modprobe.d/rtl8723beS.conf
    if [ -e $DIRETORIO ]; then
            sudo rm $DIRETORIO
            echo -e "#     ARQUIVO $DIRETORIO APAGADO COM SUCESSO!   #\t\t \n#\t\t\t\t\t\t\t\t    #"
        else
            echo -e "#     ERRO: ARQUIVO $DIRETORIO NÃO INSTALADO!  #\t\t \n#\t\t\t\t\t\t\t\t    #"
    fi
    echo -e -n "\033[1;37m#####################################################################\n"
    read key
    Main
}

Problema() {
    clear
    echo -e "\033[1;32m######################### EXPLICANDO O PROBLEMA ###########################\n"
    echo -e "O adaptador WiFi Realtek RTL8723BE possui dois conectores para antenas e \no fabricante resolveu conectar apenas uma delas. Desse modo, o sinal WiFi\ndo dispositivo fica fraco pois o sistema operacional está configurado para\nusar a antena que não está conectada devidamente. Por não estar conectada,\nessa antena caba por captar um sinal fraco de wifi."
    echo -e "\nPara resolver esse problema, há duas soluções\n\n1. HARDWARE\nAbrindo o notebook e alterando o fio da antena 1 para a antena 2.\n\n2. SOFTWARE\nConfigurando o arquivo rtl8723be.conf para usar a outra antena."
    echo -e "\nIsso explica o porquê de termos duas opções de solucionar, a primeira é \ncaso o seu dispositivo esteja com a antena 1 sem estar conectada, e o \nsegundo caso for a antena 2 que estiver sem conexão.\n"
    echo -e -n "###########################################################################\n"
    read key
    Menu
}

Sobre() {
    clear
    echo -e "\033[1;37m##################### SOBRE ########################\n"
    echo "
  _____      _                 _____             
 / ____|    (_)               |  __ \            
| (___   ___ ___  ____ _ ___  | |  | | _____   __
 \\___ \\ / _ \\ \\ \\/ / _\` / __| | |  | |/ _ \ \ / /
 ____) |  __/ |>  < (_| \__ \ | |__| |  __/\ V / 
|_____/ \___|_/_/\_\__,_|___/ |_____/ \___| \_/  
          "                                        
    
    echo -e "\n\tProgrammer: Mateus Silva Seixas\n\tNacionality: Brazil\n\tLast update: 11-18-2018\n\tE-mail: thseiixas@gmail.com\n\tFont: https://goo.gl/8MDtFC"
    echo -e -n "\n####################################################\n"
    read key
    Menu
}
Sair () {
     clear
    echo "1"
}

Solucionar() {
    clear
    if [ $1 -eq 1 ]
    then
        echo -e "\033[42;1;37m###################### EXECUTANDO MÉTODO 1 #########################"
        sudo echo "options rtl8723be ant_sel=1" > /etc/modprobe.d/rtl8723be.conf
        echo -e "#                Arquivo modificado com sucesso!                   #"
        echo -e -n "#         Pressione qualquer tecla para reiniciar o sistema.       #\n"
        echo "####################################################################"
        read key
        sudo reboot
    fi
    if [ $1 -eq 2 ]
    then
        echo -e "\033[42;1;37m###################### EXECUTANDO MÉTODO 2 #########################"
        sudo echo "options rtl8723be ant_sel=2" > /etc/modprobe.d/rtl8723be.conf
        echo -e "#                 Arquivo modificado com sucesso!                  #"
        echo -e -n "#         Pressione qualquer tecla para reiniciar o sistema.       #\n"
        echo "####################################################################"
        read key
        sudo reboot
    fi
}
Main