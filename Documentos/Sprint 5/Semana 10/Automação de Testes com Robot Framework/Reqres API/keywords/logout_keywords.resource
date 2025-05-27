*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /logout
Resource         ../support/base.robot


*** Keywords ***
###Cenário 01: POST Ends a session 200
POST Endpoint /logout
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/logout
    ...    headers=${headers}
    Log    Response: Sucesso! Usuário foi deslogado
    Set Test Variable    ${response}