*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /logout
Library          RequestsLibrary
Resource         ../resources/variables.resource
Resource    register_keywords.resource


*** Keywords ***
###Cenário 01: POST Ends a session 200
POST Endpoint /logout
    Iniciar sessão
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/logout
    ...    headers=${headers}
    Log    Response: Success! Usuário foi deslogado
    Set Test Variable    ${response}
Validar se o status code é 200
    Should Be True     ${response.status_code} == 200
    Log    Status code: ${response.status_code}