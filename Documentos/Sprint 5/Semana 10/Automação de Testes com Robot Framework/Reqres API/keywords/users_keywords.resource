*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /users
Resource         ../support/base.robot

*** Keywords ***
###Cenário 01: GET Fetches a user 200
GET Endpoint /users/id
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o usuário foi encontrado corretamente
   Dictionary Should Contain Key    ${response.json()}    data
   Dictionary Should Contain Key    ${response.json()}    support
   Log    data: ${response.json()["data"]}
   Log    support: ${response.json()["support"]}


###Cenário 02: GET Fetches a user 404
GET Endpoint /users/id 404 
    ${status_code_desejado}  Set Variable    404
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/23
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    error: Usuário não encontrado.
    Set Test Variable    ${response}


###Cenário 03: PUT Updates a user 200
PUT Endpoint /users/id
    ${response}    PUT On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    json=&{payload_put}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se atualizar o usuário foi bem sucedido  
    Dictionary Should Contain Key    ${response.json()}    name    
    Dictionary Should Contain Key    ${response.json()}    job  
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    Log  Sucesso: ${response.json()["updatedAt"]} 


###Cenário 04: PATCH Updates a user 200
PATCH Endpoint /users/id
    ${response}    PATCH On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    json=&{payload_patch}
    ...    headers=${headers}
    Log    Response: ${response.json}
    Set Test Variable    ${response}
Validar se patch foi bem sucedido
    Dictionary Should Contain Key    ${response.json()}    name    
    Dictionary Should Contain Key    ${response.json()}    job  
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    Log  Sucesso: ${response.json()["updatedAt"]}  


###Cenário 05: Deletes a user 204
DELETE Endpoint /users/id
    ${response}    DELETE On Session    
    ...    alias=${alias_base}
    ...    url=/users/${ID_USER}
    ...    headers=${headers}
    #Log    Response: ${response.json()} Vou deixar essa linha comentada, pois vai dar erro, já que não encontra nada dentro do response, pois foi "deletado"
    Set Test Variable    ${response}
Validar se o usuário foi deletado com sucesso
    Should Be Empty    ${response.text}
    Log    Response: Corpo da resposta vazio, conforme esperado ao deletar o usuário