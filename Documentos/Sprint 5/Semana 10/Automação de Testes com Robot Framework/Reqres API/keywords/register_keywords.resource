*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /register
Resource         ../support/base.robot

*** Keywords ***
###Cenário 01: POST Creates a user 200:
POST Endpoint /register
    [Arguments]    ${payload}=${payload_register_200}
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/register
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
    Set Global Variable    ${ID_USER}    ${response.json()["id"]}
Validar se o usuário foi criado corretamente
    [Documentation]    Verifica se a resposta contém as chaves 'id' e 'token' e registra seus valores
    Dictionary Should Contain Key    ${response.json()}   id
    Dictionary Should Contain Key    ${response.json()}   token
    Log    id: ${response.json()["id"]}
    Log    token: ${response.json()["token"]}
    Validar Esquema JSON    ${response}    register_success_schema.json

###Cenário 02: POST Creates a user 400:
POST Endpoint /register 400
    [Arguments]    ${payload}=${payload_register_400}    ${status_code_desejado}=400
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/register 
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se criar usuário foi mal sucedido
    [Documentation]    Verifica se a resposta contém a chave 'error' e seu valor 'missing password' e registra seus valores
    Dictionary Should Contain Item  ${response.json()}  
    ...  error  Missing password
    Log    error: ${response.json()["error"]}
    Validar Esquema JSON    ${response}    register_error_schema.json