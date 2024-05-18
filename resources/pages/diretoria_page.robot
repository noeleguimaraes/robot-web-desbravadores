*** Settings ***
Documentation    Arquivo que contem todas as variaveis da page de login

Resource    ../main.robot

*** Variables ***
${MENU_DIRETORIAS}                      id=Diretorias
${BOTAO_NOVO_CADASTRO_DIRETORIA}        id=Novo Cadastro
${CAMPO_BOARD_NAME}                     id=boardName
${BOTAO_ULTIMA_PAGINA}                  (//button[@class='css-kab9pu'])[2]
${BOTAO_EDITAR}                         //button[@id='edit']
${ALERTA_MSG_DIRETORIA}                 css=.MuiAlert-message
${BOTAO_EDITAR_PRIMEIRA_DIRETORIA}      (//button[@id='edit'])[1]
${CAMPO_NOME_PRIMEIRA_DIRETORIA}        //ul[@class="css-18psgb0"]/li[1]/p