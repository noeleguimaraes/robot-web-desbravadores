language: pt-br
*** Settings ***

Resource    ../resources/main.robot

*** Test Cases ***
CT07 - Cadastro novo usuario com sucesso
    Dado usuario esteja na tela de Cadastro
    Quando realizar o preenchimento dos campos de cadastro
    E clicar em SALVAR NOVO
    Então o cadastro será realizado com sucesso
    Screenshot    Usuario Cadastrado com sucesso