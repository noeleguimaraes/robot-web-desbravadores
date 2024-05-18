*** Settings ***
Resource     ../resources/main.robot
Test Teardown    Fechar navegador

*** Test Cases ***
CT01 - Login com sucesso
    [Tags]    CT01
    [Setup]    Criar Novo usuario

    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando digitar username  ${user_name}
    E digitar senha  ${password}
    E clicar em entrar
    Então o sistema exibe a tela "home" e menu lateral com a opção "Cadastros"
    Screenshot    Login com sucesso

CT02 - Login com email inválido
    [Tags]    CT02

    ${PASSWORD}    Gerador senha
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando digitar username  usernameinvalido
    E digitar senha   ${PASSWORD}
    E clicar em entrar
    Então o sistema exibe a mensagem de erro "Digite um email válido"
    Screenshot    Login email invalido

CT03 - Login com senha inválida
    [Tags]    CT03
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando digitar username  ${SYSADMIN.USER}
    E digitar senha  senhainvalida
    E clicar em entrar
    Então o sistema exibe a mensagem de erro senha "E"
    Screenshot    Login senha invalida

CT04 - Login com email em branco
    [Tags]    CT04
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando não digitar username
    E digitar senha  ${SYSADMIN.PASSWORD}
    E clicar em entrar
    Então o sistema exibe a mensagem de erro "O email é obrigatório"
    Screenshot    Login email vazio

CT05 - Login com senha em branco
    [Tags]    CT05
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando digitar username  ${SYSADMIN.USER}
    E não digitar senha
    E clicar em entrar
    Então o sistema exibe a mensagem de erro "A senha é obrigatória"
    Screenshot    Login senha vazio

CT06 - Login com email e senha em branco
    [Tags]    CT06
    Dado que o usuário está na tela de login do Qa.Coders Academy
    Quando não digitar username
    E não digitar senha
    E clicar em entrar
    Então o sistema exibe as mensagens de erro "O email é obrigatório" e "A senha é obrigatória"
    Screenshot    Login email e senha vazios