*** Settings ***
Documentation    Arquivo que contem todas as variaveis da page de login

Resource    ../main.robot

*** Variables ***
${usernameInput}                id=email
${senhaInput}                   id=password
${entrarButton}                 id=login
${BUTTON_CADASTRO}              id=Cadastros
${BUTTON_LOGOUT}                //button[@class='css-1nvbq2d']
${MSG_ERROR}                    //p[@class='css-18xtib3']
${MSG_ERRO_SENHA}               //div[@class='MuiAlert-message css-1xsto0d']
${MSG_EMAIL_OBRIGATORIO}        //p[@class='css-18xtib3'][text()='O email é obrigatório']
${MSG_SENHA_OBRIGATORIO}        //p[@class='css-18xtib3'][text()='A senha é obrigatória']
