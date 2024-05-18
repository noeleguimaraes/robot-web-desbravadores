*** Settings ***
Documentation    Arquivo de Keywords da suite de usuarios

Resource    ../main.robot


*** Keywords ***
usuario esteja na tela de Cadastro
    Login com sucesso
    Clicar    ${MENU_CADASTROS}
    Clicar    ${MENU_USUARIOS}
    Clicar    ${NOVO_CADASTRO}

realizar o preenchimento dos campos de cadastro

    ${user}    Gerador de usuarios

    Preencher    ${CAMPO_NOME_USUARIO}         Aaaa AAAA AAAaa
    Preencher    ${CAMPO_EMAIL_USUARIO}        ${user.mail}
    Preencher    ${CAMPO_ACESSO_USUARIO}       ${user.accessProfile}
    Preencher    ${CAMPO_CPF_USUARIO}          ${user.accessProfile}
    Preencher    ${CAMPO_CPF_USUARIO}          ${user.cpf}
    Preencher    ${CAMPO_SENHA}                ${user.password}
    Preencher    ${CAMPO_CONFIRMAR_SENHA}      ${user.confirmPassword} 
    
    Set Test Variable    ${NOME}    ${user.fullName}

    
clicar em SALVAR NOVO
    Clicar       ${BOTAO_SALVAR}

o cadastro será realizado com sucesso
    Page Should Contain    Aaaa AAAA AAAaa