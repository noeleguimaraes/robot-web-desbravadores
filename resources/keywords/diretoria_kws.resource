*** Settings ***
Documentation    Arquivo de Keywords da suite de login

Resource    ../main.robot


*** Keywords ***
Dado que usuario acesse o menu Diretorias
    Login com sucesso
    Clicar    ${MENU_CADASTROS}
    Clicar    ${MENU_DIRETORIAS}   

Quando clicar no botao novo Cadastro
    Clicar    ${BOTAO_NOVO_CADASTRO_DIRETORIA}

E preencher o campo Nome da Diretoria
    [Arguments]    ${NOME_DIRETORIA}
    Preencher    ${CAMPO_BOARD_NAME}    ${NOME_DIRETORIA}
    Clicar    ${BOTAO_SALVAR}


Então o sistema devera cadastrar uma nova diretoria com sucesso
    Clicar    ${BOTAO_ULTIMA_PAGINA}
    Validar tela contem texto    ${NOME_DIRETORIA}
    Scroll Pagina    //ul[@class="css-18psgb0"]/li[p/text()="${NOME_DIRETORIA}"]

Então o sistema devera exibir o alerta "${msg}"
    Validar mensagem    ${ALERTA_MSG_DIRETORIA}    ${msg}

Quando selecionar uma diretoria
    Validar tela contem elemento  ${CAMPO_NOME_PRIMEIRA_DIRETORIA}
    ${NOME_ANTIGO}    Get Text    ${CAMPO_NOME_PRIMEIRA_DIRETORIA}
    Set Test Variable    ${NOME_ANTIGO}    ${NOME_ANTIGO}
    Clicar    ${BOTAO_EDITAR_PRIMEIRA_DIRETORIA}
    Limpar campo    ${CAMPO_BOARD_NAME}  

Então o sistema devera exibir o novo nome da diretoria
    Validar tela contem texto    ${NOME_DIRETORIA}   
    ${NOVO_NOME_DIRETORIA}    Get Text    ${CAMPO_NOME_PRIMEIRA_DIRETORIA}
    Should Be Equal      ${NOVO_NOME_DIRETORIA}    ${NOME_DIRETORIA}