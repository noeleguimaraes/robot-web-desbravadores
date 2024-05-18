*** Settings ***
Documentation    Arquivo que contem todas as variaveis da page de login

Resource    ../main.robot

*** Variables ***
${MENU_CADASTROS}                   id=Cadastros
${MENU_USUARIOS}                    id=Usuários
${NOVO_CADASTRO}                    id=Novo Cadastro
${CAMPO_NOME_USUARIO}               id=fullName
${CAMPO_EMAIL_USUARIO}              id=mail
${CAMPO_ACESSO_USUARIO}             id=accessProfile
${CAMPO_CPF_USUARIO}                id=cpf
${CAMPO_SENHA}                      id=password
${CAMPO_CONFIRMAR_SENHA}            id=confirmPassword
${BOTAO_SALVAR}                     id=save