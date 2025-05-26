*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /login
Library          RequestsLibrary
Library          Collections
Resource         ../resources/variables.resource

*** Keywords ***
#Cenário 01: POST Creates a session 200
POST Endpoint /login
    Iniciar sessão
    &{payload}  Create Dictionary  
    ...  email=${email}
    ...  password=${password} 

    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login    
    ...    json=${payload}
    ...    headers=${headers}
    Log To Console    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi bem sucedido
    Dictionary Should Contain Key    ${response.json()}  token
    ${token}  Get From Dictionary    ${response.json()}   token
    Log    token: ${token}
Validar se o status code é 200
    Should Be True    ${response.status_code} == 200
    Log    Status code: ${response}


#Cenário 02: POST Creates a session 400
POST Endpoint /login 400
    ${status_code_desejado}    Set Variable    400
    Iniciar sessão
    &{payload}  Create Dictionary  
    ...  email=${email}

    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login    
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log To Console    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi mal sucedido
    Dictionary Should Contain Item    
    ...    ${response.json()}    
    ...    error    
    ...    Missing password
    ${mensagem_de_erro}    Get From Dictionary    ${response.json()}    error
    Log    error: ${mensagem_de_erro}
Validar se o status code é 400
    Should Be True    ${response.status_code} == 400
    Log    Status code: ${response.status_code}