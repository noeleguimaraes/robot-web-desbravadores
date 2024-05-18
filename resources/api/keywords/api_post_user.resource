*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Criar Sessao
    [Arguments]    ${session_name}    ${URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    ${session_name}    url=${URL}    verify=${True}


Gerador Token
    [Arguments]    ${session_name}    ${USER}    ${PASSWORD}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=       Create Dictionary    mail=${USER}    password=${PASSWORD}
    
    ${response}=    POST On Session    ${session_name}    ${AMBIENTE.API.ENDPOINTS.AUTH.POST_LOGIN}    json=${body}    headers=${headers}
    Should Not Be Empty    ${response.json()}[token]
    Should Be Equal As Integers    ${response.status_code}    200
    Set Test Variable    ${token}    ${response.json()}[token]
    
POST Novo Usuario
    [Arguments]    ${session}    ${body}
    ${headers}=     Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${response}=    POST On Session   ${session}    ${AMBIENTE.API.ENDPOINTS.USERS.POST_USER}   json=${body}   headers=${headers}
    
    RETURN    ${response}

Criar Novo usuario
    Criar Sessao     user    ${AMBIENTE.API.URL}    
    Gerador Token    user    ${SYSADMIN.USER}    ${SYSADMIN.PASSWORD}
    ${body}         Gerador de usuarios
    ${response}=    POST Novo Usuario    user    ${body}    
    Should Be Equal As Integers    ${response.status_code}    201
    Should Not Be Empty    ${response.json()}[user][_id]
    Set Test Variable    ${user_name}    ${response.json()}[user][mail]
    Set Test Variable    ${password}     ${body}[password]