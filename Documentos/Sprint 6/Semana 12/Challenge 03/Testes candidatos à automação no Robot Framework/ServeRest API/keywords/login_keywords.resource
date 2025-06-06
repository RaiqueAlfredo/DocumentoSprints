*** Settings ***
Documentation    Keywords para ações no endpoint /login
Resource         ../support/base.robot

*** Keywords ***
###US002-CT01: Login com credenciais válidas
POST endpoint /login com dados válidos
    [Arguments]    ${payload}=${dados_validos_login}
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/login
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se retorna mensagem e token
    [Documentation]    Verifica se contém mensagem informando que o login foi bem 
    ...                sucedido e se retorna o token.
    Should Be Equal        ${response.json()["message"]}   Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}
    Log    message: ${response.json()["message"]}
    Log    authorization: ${response.json()["authorization"]}


###US002-CT02: Tentar login com e-mail não cadastrado
POST endpoint /login com email não cadastrado
    [Arguments]    ${payload}=${dados_email_sem_cadastro}  ${status_code_desejado}=401
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/login
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se retorna mensagem adequada
    [Documentation]    Verifica se contém mensagem informando que o email é inválido 
    Should Be Equal        ${response.json()["message"]}   Email e/ou senha inválidos
    Log    message: ${response.json()["message"]}
    
    