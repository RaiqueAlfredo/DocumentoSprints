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
    Dictionary Should Contain Key    ${response.json()}    data
    Dictionary Should Contain Key    ${response.json()}    support
    Log    data: ${response.json()["data"]}
    Log    support: ${response.json()["support"]}