*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /login
Resource         ../support/base.robot

*** Keywords ***
#Cenário 01: POST Creates a session 200
POST Endpoint /login
    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login    
    ...    json=${payload__login_200}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi bem sucedido
    Dictionary Should Contain Key    ${response.json()}  token
    ${token}  Get From Dictionary    ${response.json()}   token
    Log    token: ${token}


#Cenário 02: POST Creates a session 400
POST Endpoint /login 400
    ${status_code_desejado}    Set Variable    400
    ${response}  POST On Session    
    ...    alias=${alias_base}    
    ...    url=/login    
    ...    json=&{payload__login_400}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se o login foi mal sucedido
    Dictionary Should Contain Item    
    ...    ${response.json()}    
    ...    error    
    ...    Missing password
    ${mensagem_de_erro}    Get From Dictionary    ${response.json()}    error
    Log    error: ${mensagem_de_erro}