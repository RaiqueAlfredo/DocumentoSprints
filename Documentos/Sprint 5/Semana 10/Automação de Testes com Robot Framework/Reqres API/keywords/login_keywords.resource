*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /login
Resource         ../support/base.robot

*** Keywords ***
#Cenário 01: POST Creates a session 200
POST Endpoint /login
    [Arguments]  ${payload}=${payload__login_200}
    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login  
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi bem sucedido
    [Documentation]    Verifica se a resposta contém a chave 'token' e registra seus valores
    Dictionary Should Contain Key    ${response.json()}  token
    ${token}  Get From Dictionary    ${response.json()}   token
    Log    token: ${token}
    Validar Esquema JSON    ${response}    login_success_schema.json


#Cenário 02: POST Creates a session 400
POST Endpoint /login 400
    [Arguments]  ${payload}=${payload__login_400}    ${status_code_desejado}=400
    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login    
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi mal sucedido
    [Documentation]    Verifica se a resposta contém a chave 'error' e seu valor 'Missing password' e registra seus valores
    Dictionary Should Contain Item    
    ...    ${response.json()}    
    ...    error    
    ...    Missing password
    Log    error: ${response.json()["error"]}
    Validar Esquema JSON    ${response}    login_error_schema.json