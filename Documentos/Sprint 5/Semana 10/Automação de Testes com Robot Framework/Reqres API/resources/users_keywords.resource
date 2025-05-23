*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /users
Library          RequestsLibrary
Library          String
Library          Collections
Resource         ../resources/variables.resource
Resource         ../resources/register_keywords.resource

*** Keywords ***
###Cenário 01: GET Fetches a user 200
GET Endpoint /users/id
    Iniciar sessão
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o usuário foi encontrado corretamente
   Dictionary Should Contain Key    ${response.json()}    data
   Dictionary Should Contain Key    ${response.json()}    support
   &{user_data}    Get From Dictionary   ${response.json()}    data
   &{user_support}  Get From Dictionary  ${response.json()}    support
   Log    data: ${user_data}
   Log    support: ${user_support}

Validar se o status code é 200
    Should Be True    ${response.status_code} == 200
    Log    Status code: ${response.status_code}



###Cenário 02: GET Fetches a user 404
GET Endpoint /users/id 404 
    ${status_code_desejado}  Set Variable    404
    Iniciar sessão
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/23
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o status code é 404
    Should Be True    ${response.status_code} == 404
    Log    Status code: ${response.status_code}



###Cenário 03: PUT Updates a user 200
PUT Endpoint /users/id
    Iniciar sessão
    &{payload}    Create Dictionary    
    ...    name=morpheus    
    ...    job=zion resident
       
    ${response}    PUT On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

Validar se atualizar o usuário foi bem sucedido
    ${updated_At}    Get From Dictionary    ${response.json()}    updatedAt
    &{response_update_esperado}    Create Dictionary    
    ...    name=morpheus
    ...    job=zion resident
    ...    updatedAt=${updated_At}
    Dictionary Should Contain Sub Dictionary    
    ...    ${response.json()}    
    ...    ${response_update_esperado}
        
    Log    ${response_update_esperado}
Validar se o status code retornado é 200
    Should Be True    ${response.status_code} == 200
    Log    Status code: ${response.status_code}



###Cenário 04: Deletes a user 204
DELETE Endpoint /users/id
    Iniciar sessão
    ${response}    DELETE On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    headers=${headers}
    #Log    Response: ${response.json()} Vou deixar essa linha comentada, pois vai dar erro, já que não encontra nada dentro do response, pois foi "deletado"
    Set Test Variable    ${response}

Validar se o usuário foi deletado com sucesso
    Log    ${response}
    Should Be Empty    ${response.text}
    Log    Response: Corpo da resposta vazio, conforme esperado ao deletar o usuário

Validar se o status code é 204
    Should Be True    ${response.status_code} == 204
    Log    Status code: ${response.status_code}