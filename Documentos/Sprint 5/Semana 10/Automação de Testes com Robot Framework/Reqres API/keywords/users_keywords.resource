*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /users
Resource         ../support/base.robot

*** Keywords ***
###Cenário 01: GET Fetches a user 200
GET Endpoint /users/id
    [Arguments]    ${user_id}=${ID_USER}
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/${user_id}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o usuário foi encontrado corretamente
    [Documentation]    Verifica se a resposta contém as chaves 'data' e 'support' e registra seus valores
    Dictionary Should Contain Key    ${response.json()}            data
    Dictionary Should Contain Key    ${response.json()}            support
    Dictionary Should Contain Key    ${response.json()["data"]}    id
    Log    data: ${response.json()["data"]}
    Log    support: ${response.json()["support"]}
    Validar Esquema JSON    ${response}    user_schema.json


###Cenário 02: GET Fetches a user 404
GET Endpoint /users/id 404 
    [Arguments]    ${user_id}=23    ${status_code_desejado}=404
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/users/${user_id}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    error: Usuário não encontrado.
    Set Test Variable    ${response}


###Cenário 03: PUT Updates a user 200
PUT Endpoint /users/id
    [Arguments]    ${user_id}=${ID_USER}    ${payload}=${payload_put}
    ${response}    PUT On Session    
    ...    alias=${alias_base}
    ...    url=/users/${user_id}
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se atualizar o usuário foi bem sucedido  
    [Documentation]    Verifica se a resposta do PUT contém as chaves necessárias
    Dictionary Should Contain Key    ${response.json()}    name    
    Dictionary Should Contain Key    ${response.json()}    job  
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    ${timeStamp}    Set Variable     ${response.json()["updatedAt"]}
    Log    Atualização bem-sucedida em: ${timeStamp}
    Log    Nome atualizado: ${response.json()["name"]}
    Log    Cargo atualizado: ${response.json()["job"]}
    Validar Esquema JSON    ${response}    user_put_schema.json


###Cenário 04: PATCH Updates a user 200
PATCH Endpoint /users/id
    [Arguments]    ${user_id}=${ID_USER}    ${payload}=${payload_patch}
    ${response}    PATCH On Session    
    ...    alias=${alias_base}
    ...    url=/users/${user_id}
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json}
    Set Test Variable    ${response}
Validar se patch foi bem sucedido
    [Documentation]    Verifica se a resposta do PATCH contém as chaves necessárias
    Dictionary Should Contain Key    ${response.json()}    name    
    Dictionary Should Contain Key    ${response.json()}    job  
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    ${timestamp}    Set Variable     ${response.json()["updatedAt"]}
    Log    Atualização bem-sucedida em: ${timestamp}
    Log    Nome atualizado: ${response.json()["name"]}
    Log    Cargo atualizado: ${response.json()["job"]}
    Validar Esquema JSON    ${response}    user_patch_schema.json
    

###Cenário 05: Deletes a user 204
DELETE Endpoint /users/id
    [Arguments]    ${user_id}=${ID_USER}
    ${response}    DELETE On Session    
    ...    alias=${alias_base}
    ...    url=/users/${user_id}
    ...    headers=${headers}
    #Log    Response: ${response.json()} Vou deixar essa linha comentada, pois vai dar erro, já que não encontra nada dentro do response, pois foi "deletado"
    Set Test Variable    ${response}
Validar se o usuário foi deletado com sucesso
    Should Be Empty    ${response.text}
    Log    Response: Corpo da resposta vazio, conforme esperado ao deletar o usuário