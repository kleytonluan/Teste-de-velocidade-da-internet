#!/bin/bash
#DESENVOLVIDO POR: LUAN KLEYTON

echo "__________________________________"
echo "- SISTEMA INICIADO"
sleep 2
echo -e " -> VERIFICANDO VELOCIDADE"
sleep 2

prog="/usr/bin/speedtest-cli"

if [ -e "$prog" ]; then
	echo -e " -> TESTANDO"
	sudo speedtest-cli > /var/log/velocidade.log
else
	echo -e " -> SPEEDTEST NÃO ESTÁ INSTALADO. INSTALANDO"
	sleep 2
	sudo apt-get install speedtest-cli -y
	echo -e " -> TESTANDO AGORA"
	sudo speedtest-cli > /var/log/velocidade.log
fi

relatorio="/var/log/velocidade.log"
erro="erro.txt"

echo -e " -> VERIFICAÇÃO FINALIZADA"
sleep 2
while :
do
echo -e "================MENU================"
echo "------------------------------------"
echo -e "ESCOLHA UMA OPÇÃO PARA PROSSEGUIR:"
echo -e "[0] VISUALIZAR RELATÓRIO"
echo -e "[1] ENVIAR RELATÓRIO POR E-MAIL"
echo -e "[2] EXECUTAR VERIFICAÇÃO NOVAMENTE"
echo -e "[3] SAIR DO SISTEMA"
echo "------------------------------------"

read resposta
case "$resposta" in
	0|"")
        echo -e "OPÇÃO $resposta -> VISUALIZANDO RELATÓRIO:"
	sleep 2
	cat /var/log/velocidade.log
	sleep 3
	echo -e " -> VOLTAR PARA O MENU? [s] / [n]"
	read resp
	if [ $resp == s ]; then
		sleep 2
		clear
	else
		echo -e " -> SAINDO DO SISTEMA"
		sleep 2
		echo -e "SISTEMA FINALIZADO!"
		echo "__________________________________"
		exit
	fi
	;;
	1)
        echo -e "OPÇÃO $resposta -> ENVIANDO RELATÓRIO POR E-MAIL:"
	echo -e " -> DIGITE PARA QUAL E-MAIL ENVIAR, DEPOIS [ENTER]:"
	read email
	if [ -f "$relatorio" ]; then
        	sudo cat "$relatorio" | mail -s "Relatório de velocidade de internet" $email
        	echo -e " -> RELATÓRIO ENVIADO PARA O E-MAIL $email COM SUCESSO"
        	sleep 2
	else
        	sudo cat "$erro" | mail -s "Relatório de velocidade de internet - Erro" $email
        	echo -e " -> FALHA AO ENVIAR O RELATÓRIO PARA $email"
        	sleep 2
	fi
        clear
	;;
	2)
        echo -e "OPÇÃO $resposta -> EXECUTANDO A VERIFICAÇÃO NOVAMENTE:"
	sleep 2
	echo -e " -> EXECUTANDO"
        sudo speedtest-cli > /var/log/velocidade.log
	echo -e " -> VERIFICAÇÃO FINALIZADA!"
	sleep 2
	clear
    	;;
	3)
	echo -e "OPÇÃO $resposta -> SAINDO DO SISTEMA:"
	sleep 2
	echo -e "SISTEMA FINALIZADO!"
	echo "__________________________________"

	exit
	;;
	*)
	echo " -> OPÇÃO $resposta -> OPÇÃO INVALIDA"
	sleep 2
	clear
;;
esac
done

