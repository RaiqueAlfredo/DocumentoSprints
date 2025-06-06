*** Settings ***
Documentation    Keywords para ações no endpoint /carrinhos
Resource         ../support/base.robot

*** Keywords ***
###US004-CT03: Tentar cadastrar um carrinho sem token
POST endpoint /carrinhos sem token
    [Arguments]    ${status_code_desejado}=401
    ${id_produto}   Get From Dictionary    ${response.json()}    _id
    ${quantidade}   Get From Dictionary    ${produto_dados_validos}   quantidade
    ${produto}     Create Dictionary  
    ...    idProduto=${id_produto}  
    ...    quantidade=${quantidade}
    @{produtos_lista}    Create List         ${produto}
    &{payload}           Create Dictionary   produtos=${produtos_lista}
    ${response}          POST On Session  
    ...    alias=${alias_base}
    ...    url=/carrinhos
    ...    json=&{payload}
    ...    headers=${EMPTY}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se a mensagem informa correto sobre o token
    [Documentation]  Verifica se retorna mensagem informando corretamente sobre token
    Should Be Equal  ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log    message: ${response.json()["message"]}


###US004-CT05: Tentar concluir compra sem carrinho ativo
DEL endpoint /carrinhos/concluir-compra
    ${response}    DELETE On Session  
    ...    alias=${alias_base}
    ...    url=/carrinhos/concluir-compra
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se a mensagem retornada está correta
    [Documentation]  Verifica se retorna mensagem adequada
    Should Be Equal  ${response.json()["message"]}  Não foi encontrado carrinho para esse usuário
    Log    message: ${response.json()["message"]}


###US004-CT06: Tentar cancelar compra sem token ou com token inválido
POST endpoint /carrinhos com dados válidos
    ${id_produto}   Get From Dictionary    ${response.json()}    _id
    ${quantidade}   Get From Dictionary    ${produto_dados_validos}   quantidade
    &{produto}     Create Dictionary  
    ...    idProduto=${id_produto}
    ...    quantidade=${quantidade}
    @{produtos_lista}    Create List         ${produto}
    &{payload}           Create Dictionary   produtos=${produtos_lista}
    ${response}          POST On Session  
    ...    alias=${alias_base}
    ...    url=/carrinhos
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

DEL endpoint /carrinhos/cancelar-compra
    [Arguments]    ${status_code_desejado}=401
    ${response}    DELETE On Session  
    ...    alias=${alias_base}
    ...    url=/carrinhos/cancelar-compra
    ...    headers=${EMPTY}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se informa correto sobre o token
    [Documentation]  Verifica se retorna mensagem informando corretamente sobre token
    Should Be Equal  ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log    message: ${response.json()["message"]}