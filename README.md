# RTL8723BE-WEAKSIGNAL-FIXED

## Sobre o script

#### Como faço para executar o arquivo?
Primeiro torne-o um arquivo executável utilizando o comando: `sudo chmod +x rtl8723be.sh`. Depois, basta executá-lo por meio do comando: `./rtl8723be.sh`

#### Por que tenho que executar o script com privilégios de administrador (root)?
O script precisa criar e editar um arquivo em um diretório que necessita de privilégios de administrador para editar

#### Não quero executar o script, posso resolver o problema sem executá-lo?
Perfeitamente! O script serve somente para facilitar a instalação. Caso queria fazer por conta própria, basta seguir o seguinte tutorial: [Very weak WIFI signal with rtl8723be Wifi card on Linux (and Windows)](https://ckirbach.wordpress.com/2017/06/16/very-weak-wifi-signal-with-rtl8723be-wifi-card-on-linux-and-windows/)

#### Essa solução já foi testada antes?
Sim. Sou dono de um Notebook HP AC141BR que possui essa placa de rede. Essa solução foi testada nas distribuições Deepin 15.7 e Mint Cinnamon 19.

## OBJETIVO

Esse script foi criado para auxiliar os usuários de computadores portáteis (notebooks, netbooks, etc.)
que possuem a placa de rede Realtek RTL8723BE. Nesse sentido, por ter apenas uma de suas antenas 
conectadas, essa placa acaba por causar uma conexão muito fraca com sinais wifi e, por conseguinte, não 
conectando à sinais distantes.

## O QUE CAUSA ESSE PROBLEMA?

O adaptador WiFi Realtek RTL8723BE possui dois conectores para antenas e o fabricante resolveu conectar 
apenas uma delas. Desse modo, o sinal WiFi\ndo dispositivo fica fraco pois o sistema operacional está 
configurado para usar a antena que não está conectada devidamente. Por não estar conectada,essa antena 
acaba por captar um sinal fraco de wifi.

Para resolver esse problema, há duas soluções
### 1. HARDWARE: 
Abrindo o notebook e alterando o fio da antena 1 para a antena 2.
### 2. SOFTWARE: 
Configurando o arquivo rtl8723be.conf para usar a outra antena.

## FUNÇÃO DO SCRIPT

O script criará um arquivo chamado 'rtl8723be.conf' no diretório '/etc/modprobe.d' e o preencherá com a
seguinte configuração:

Solução 1: options rtl8723be ant_sel=1
Solução 2: options rtl8723be ant_sel=2

Dessa forma, sempre que o sistema iniciar ele carregará esse arquivo e configurará a interface de rede de
modo com que ela funcione corretamente.

## DESENVOLVIMENTO

Esse script foi 'codado' na madrugada do dia 18 de novembro de 2018 com término às 5:45 AM pelo programador
Mateus Silva Seixas. Foi utilizado o code editor Visual Studio Code para o desenvolvimento e testado no
Linux Mint. 
