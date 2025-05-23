*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /resource
Library          RequestsLibrary
Library    Collections
Resource         ../resources/variables.resource
*** Variables ***

*** Keywords ***
#Cenário 01: GET Fetches a resource list 200
GET Endpoint /unknown
    Iniciar sessão
    ${response}    GET On Session    
    ...    alias=${alias_base}
    ...    url=/unknown
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

Validar se retornou lista correta
   ${list_data}  Get From Dictionary    ${response.json()}    data
   ${support_content}  Get From Dictionary    ${response.json()}    support
   Log    data: ${list_data}
   Log    support: ${support_content}

Validar status code
    Should Be True    ${response.status_code} == 200
    Log    Status code: ${response.status_code}