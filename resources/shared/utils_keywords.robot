*** Settings ***
Resource    ../main.robot

*** Keywords ***
Gerador de usuarios
    ${FIRST}               FakerLibrary.First Name
    ${LAST}                FakerLibrary.Last Name
    ${FULLNAME}            Catenate    ${FIRST}      ${LAST}
    ${MAIL}                FakerLibrary.Email
    ${PASSWORD}            Gerador senha
    ${ACCESS_PROFILE}      Set Variable    ADMIN
    ${CPF}                 FakerLibrary.CPF
    ${CPF}                 Remove String    ${CPF}      .    -        
    
    &{DICT_USER}=    Create Dictionary 
    ...    fullName=${FULLNAME}
    ...    mail=${MAIL}    
    ...    password=${PASSWORD}
    ...    accessProfile=${ACCESS_PROFILE}
    ...    cpf=${CPF} 
    ...    confirmPassword=${PASSWORD}

    RETURN    ${DICT_USER}

Gerador de Diretorias
    ${palavra_randomica}    Generate Random String    length=10    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}    
    ${NOME_DIRETORIA}=    Catenate    Diretoria     ${palavra_randomica}
    Set Test Variable    ${NOME_DIRETORIA}

Acessar site
    Open Browser  ${AMBIENTE.WEB.URL}  ${AMBIENTE.WEB.BROWSER}
    Set Window Size    1920    1080
    Maximize Browser Window

Preencher
    [Arguments]    ${locator}       ${variavel}
    Wait Until Element Is Visible   ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Input text    ${locator}       ${variavel}

Clicar
    [Arguments]      ${locator}
    Wait Until Element Is Enabled    ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Click Element    ${locator}

Limpar campo
    [Arguments]      ${locator}
    Wait Until Element Is Visible   ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Click Element    ${locator}
    Clear Element Text    ${locator} 

Validar mensagem
    [Arguments]     ${locator}      ${texto} 
    Wait Until Element Is Visible   ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Element Text Should Be          ${locator}    ${texto}     

Validar caminho URL
    [Arguments]            ${caminho}
    Location Should Contain    ${caminho}

Validar mensagens
    [Arguments]     ${locator}    ${alerta1}    ${alerta2}
    Element Should Contain    ${locator}    ${alerta1} 
    Element Should Contain    ${locator}     ${alerta2} 

Validar tela contem elemento
    [Arguments]     ${locator} 
    Wait Until Element Is Visible   ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Page Should Contain Element     ${locator}

Validar tela contem texto
    [Arguments]    ${texto}
    Wait Until Page Contains    ${texto}    ${AMBIENTE.WEB.TIMEOUT}    

Fechar navegador
    Close Browser

Screenshot
    [Arguments]        ${name_print}
    Set Screenshot Directory    ./logs/${TEST NAME}
    Capture Page Screenshot   ${name_print}.png

Scroll Pagina
    [Arguments]        ${locator}
    Wait Until Element Is Visible   ${locator}      ${AMBIENTE.WEB.TIMEOUT}
    Scroll Element Into View        ${locator}

