*** Settings ***
Resource    ../main.robot


*** Test Cases ***
Login com Sysadmin
    [Tags]    API
    Criar Sessao     auth_session    ${AMBIENTE.API.URL}    
    Gerador Token    auth_session    ${SYSADMIN.USER}    ${SYSADMIN.PASSWORD}

Cadastro novo usuario via API
    [Tags]    create
    Criar Sessao     post_user    ${AMBIENTE.API.URL}    
    Gerador Token    post_user    ${SYSADMIN.USER}    ${SYSADMIN.PASSWORD}
    ${body}         Gerador de usuarios
    ${response}=    POST Novo Usuario    post_user    ${body}    
    Should Be Equal As Integers    ${response.status_code}    201
    Should Not Be Empty    ${response.json()}[user][_id]
    Set Test Variable    ${user_name}    ${response.json()}[user][mail]
    Set Test Variable    ${password}     ${body}[password]