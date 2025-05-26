*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /register
Library          RequestsLibrary
Library          String
Library          Collections
Resource         ../resources/variables.resource

*** Keywords ***
###Cenário 01: POST Creates a user 200:
POST Endpoint /register
    &{payload}    Create Dictionary  
    ...  email=${email}
    ...  password=${password}
     
    Iniciar sessão

    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/register  
    ...    json=&{payload}
    ...    headers=${headers}
    Log To Console    Response: ${response.json()}
    Set Test Variable    ${response}
    Set Global Variable    ${ID_USER}    ${response.json()["id"]}

Validar se o usuário foi criado corretamente
    Dictionary Should Contain Key    ${response.json()}   id
    Dictionary Should Contain Key    ${response.json()}   token
    ${id}    Get From Dictionary     ${response.json()}   id
    ${token}  Get From Dictionary    ${response.json()}   token
    Log    id: ${id}
    Log    token: ${token}

Validar Status Code 200
    Should Be True    ${response.status_code} == 200
    Log    Status code: ${response.status_code}



###Cenário 02: POST Creates a user 400:
POST Endpoint /register 400
    ${status_code_desejado}  Set Variable    400
    Iniciar sessão
    &{payload}    Create Dictionary  
    ...  email=${email}

    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/register  
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}

    Log    Response: ${response.json()}
    Set Test Variable    ${response}

Validar se criar usuário foi mal sucedido
    Dictionary Should Contain Item    
    ...    ${response.json()}    
    ...    error    
    ...    Missing password
    ${mensagem_de_erro}    Get From Dictionary    ${response.json()}    error
    Log    error: ${mensagem_de_erro}
Validar Status Code 400
    Should Be True    ${response.status_code} == 400
    Log    Status code: ${response.status_code}