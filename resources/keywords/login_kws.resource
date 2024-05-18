*** Settings ***
Documentation    Arquivo de Keywords da suite de login

Resource    ../main.robot


*** Keywords ***
Dado que o usuário está na tela de login do Qa.Coders Academy
    Acessar site

Quando digitar username
    [Arguments]       ${username}
    Preencher         ${usernameInput}     ${username}

E digitar senha
    [Arguments]      ${senha}
    Preencher        ${senhaInput}         ${senha}

Quando não digitar username
    Limpar campo    ${usernameInput}

E não digitar senha
    Limpar campo    ${senhaInput} 

E clicar em entrar
    Clicar    ${entrarButton}

Então o sistema exibe a tela "${caminho}" e menu lateral com a opção "${cadastro}"
    Validar tela contem elemento    ${BUTTON_CADASTRO}
    Validar caminho URL   ${caminho}

Então o sistema exibe a mensagem de erro "${msgEsperada}"
    Validar mensagem    ${MSG_ERROR}     ${msgEsperada}

Então o sistema exibe as mensagens de erro "${msg_erro_esperada}" e "${msg_error_esperada2}"
    Validar mensagem    ${MSG_EMAIL_OBRIGATORIO}    ${msg_erro_esperada}
    Validar mensagem    ${MSG_SENHA_OBRIGATORIO}    ${msg_error_esperada2}

Então o sistema exibe a mensagem de erro senha "${msg}"
    Validar mensagem    ${MSG_ERRO_SENHA}    ${msg}

Login com sucesso
    Criar Novo usuario
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando digitar username  ${user_name}
    E digitar senha  ${password}
    E clicar em entrar
    Então o sistema exibe a tela "home" e menu lateral com a opção "Cadastros"