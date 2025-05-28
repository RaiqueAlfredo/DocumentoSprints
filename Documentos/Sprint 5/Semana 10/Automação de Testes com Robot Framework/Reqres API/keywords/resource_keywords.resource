*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /resource
Resource         ../support/base.robot

*** Keywords ***
#Cenário 01: GET Fetches a resource list 200
GET Endpoint /unknown
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/unknown
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se retornou lista correta
    [Documentation]    Verifica se a resposta contém as chaves 'data' e 'support' e registra seus valores
    Dictionary Should Contain Key    ${response.json()}    data    
    Dictionary Should Contain Key    ${response.json()}    support
    ${data_length}   Get Length    ${response.json()["data"]}
    ${sup_length}    Get Length    ${response.json()["support"]}
    Log    Número de itens em data: ${data_length}
    Log    Número de itens em data: ${sup_length}