*** Settings ***
Documentation    Keywords para ações no endpoint /usuarios
Resource         ../support/base.robot
Library    json

*** Keywords ***
###US001-CT01: Criar usuário com todos os campos válidos
POST endpoint /usuarios com dados validos
    [Arguments]    ${payload}=${dados_validos}
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/usuarios
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se usuário foi cadastrado corretamente
    [Documentation]    Verifica se a mensagem contém o id criado para o usuário
    Should Be Equal     ${response.json()["message"]}   Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}
    Log    message: ${response.json()["message"]}
    Log    _id: ${response.json()["_id"]}

### US001-CT02: Criar usuário com e-mail duplicado
POST endpoint /usuarios com email duplicado
    [Arguments]  ${payload}=${dados_email_duplicado}  ${status_code_desejado}=400
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/usuarios
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se informa que o email está sendo usado
    [Documentation]    Verifica se retorna a mensagem informando que o email 
    ...                está sendo usado
    Should Be Equal    ${response.json()["message"]}   Este email já está sendo usado
    Log    message: ${response.json()["message"]}


###US001-CT03: Criar usuário com e-mail inválido
POST endpoint /usuarios com email inválido
    [Arguments]  ${payload}=${dados_email_invalido}  ${status_code_desejado}=400
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/usuarios
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se informar que o email é inválido
    [Documentation]    Verifica se retorna mensagem informando que o email 
    ...                é inválido
    Should Be Equal    ${response.json()["email"]}   email deve ser um email válido
    Log    email: ${response.json()["email"]}


###US001-CT06: Criar usuário com campo "nome" vazio ou ausente
POST endpoint /usuarios com campo nome vazio
    [Arguments]  ${payload}=${dados_nome_vazio}  ${status_code_desejado}=400
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/usuarios
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se informa que o campo não pode ficar vazio
    [Documentation]    Verifica se retorna mensagem informando que o campo nome
    ...                não pode ficar vazio
    Should Be Equal    ${response.json()["nome"]}   nome não pode ficar em branco
    Log    nome: ${response.json()["nome"]}