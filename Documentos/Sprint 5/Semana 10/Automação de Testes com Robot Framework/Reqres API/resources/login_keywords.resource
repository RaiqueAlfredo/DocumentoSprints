*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /login
Library          RequestsLibrary

*** Variables ***
${username}      string
${email}         string
${password}      string
${API_Key}       reqres-free-v1
&{headers}       accept=application/json  Content-Type=application/json  x-api-key=${API_Key}


*** Keywords ***
Criar uma sessão
    Create Session    alias=ReqRes    url=https://reqres.in/api    headers=${headers}

POST Endpoint /login
    &{payload}  Create Dictionary  
    ...  username=${username}
    ...  email=${email}
    ...  password=${password} 

    ${response}  POST On Session    
    ...    alias=ReqRes    
    ...    url=/login    
    ...    json=${payload}
    Log To Console    Response: ${response.json()}
    Set Global Variable    ${response}