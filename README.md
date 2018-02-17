# testevelocidade

Script para executar um Speedtest para verificar a velocidade da internet com opção de enviar o relatório por e-mail.
Antes de executar o script de verificação da velocidade, execute o script que configura o servidor smtp para enviar o e-mail:

- Dê permissão de execução do script smtpserver.sh:

chmod +x smtpserver.sh

- Execute o scritp:

./smtpserver.sh

Sigua as instruções descritas nesse script.
Terminada a configuração do servidor smtp, execute o script de verificação da velocidade:

- Para executar o script dê permissão de execução:

chmod +x internet.sh

- Depois execute com o comando:

./internet.sh
