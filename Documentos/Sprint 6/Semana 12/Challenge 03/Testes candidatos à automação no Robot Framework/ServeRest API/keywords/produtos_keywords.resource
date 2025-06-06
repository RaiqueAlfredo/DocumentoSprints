*** Settings ***
Documentation    Keywords para ações no endpoint /produtos
Resource         ../support/base.robot

*** Keywords ***
###US003-CT01: Criar produto com todos os campos válidos
POST endpoint /produtos com dados validos
    [Arguments]  ${payload}=${produto_dados_validos}
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/produtos
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
    ${id_produto}    Get From Dictionary    ${response.json()}    _id
    Set Global Variable    ${id_produto}
Validar se retorna mensagem de sucesso
    [Documentation]    Verifica se retorna mensagem que o produto foi cadastrado com
    ...                sucesso
    Should Be Equal    ${response.json()["message"]}  Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}
    Log    message: ${response.json()["message"]}
    Log    _id: ${response.json()["_id"]}


###US003-CT02: Criar produto com nome duplicado
POST endpoint /produtos com nome duplicado
    [Arguments]  ${payload}=${dados_email_duplicado}  ${status_code_desejado}=400
    ${response}    POST On Session    
    ...    alias=${alias_base}
    ...    url=/produtos
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se retornar mensagem de erro
    [Documentation]    Verifica se retorna mensagem informando que já existe produto 
    ...                com este nome
    Should Be Equal    ${response.json()["message"]}   Já existe produto com esse nome
    Log    message: ${response.json()["message"]}


###US003-CT07: Excluir produto existente que não está associado a carrinhos
DEL endpoint /produtos/id-produto
    ${id_produto}    Get From Dictionary    ${response.json()}    _id
    ${response}    DELETE On Session  
    ...    alias=${alias_base}
    ...    url=/produtos/${id_produto}
    ...    headers=${headers}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}
Validar se produto foi excluído com sucesso
    [Documentation]    Verifica se retorna mensagem informando que o produto foi
    ...                excluído com sucesso
    Should Be Equal    ${response.json()["message"]}   Registro excluído com sucesso
    Log    message: ${response.json()["message"]}


###US003-CT08: Tentar excluir produto que está associado a carrinhos
DEL endpoint /produtos/id_produto
    [Arguments]    ${status_code_desejado}=400
    ${response}    DELETE On Session  
    ...    alias=${alias_base}
    ...    url=/produtos/${id_produto}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

Validar se mensagem informa que não pode excluir produto
    [Documentation]    Verifica se retorna mensagem informando que o produto não pode 
    ...                ser excluído por fazer parte de um carrinho
    Should Be Equal    ${response.json()["message"]}   Não é permitido excluir produto que faz parte de carrinho
    Should Not Be Empty    ${response.json()["idCarrinhos"]}
    Log    message: ${response.json()["message"]}
    Log    idCarrinhos: ${response.json()["idCarrinhos"]}


###US003-CT09: Tentar realizar qualquer ação na rota de produtos sem autenticação
POST endpoint /produtos sem token
    [Arguments]  ${payload}=${produto_dados_validos}  ${status_code_desejado}=401
    ${headers_sem_token}    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    authorization=none
    ${response}    Run Keyword And Continue On Failure    POST On Session    
    ...    alias=${alias_base}
    ...    url=/produtos
    ...    json=&{payload}
    ...    headers=${headers_sem_token}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

    [Documentation]  Verifica se retorna mensagem informando corretamente sobre token
    Should Be Equal  ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log    message: ${response.json()["message"]}
GET endpoint /produtos sem token
    [Arguments]    ${status_code_desejado}=401
    ${headers_sem_token}    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    authorization=none
    ${response}    Run Keyword And Continue On Failure    GET On Session    
    ...    alias=${alias_base}
    ...    url=/produtos 
    ...    headers=${headers_sem_token}
    ...    expected_status=${status_code_desejado}
    [Documentation]    Verifica se retorna mensagem sobre token inválido
    Run Keyword If    $response is not None    
    ...    Should Be Equal    ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    ...    ELSE    Log    Resposta é None, não é possível validar a mensagem
GET endpoint /produtos/produto-id sem token
    [Arguments]    ${produto_id}=${id_produto}  ${status_code_desejado}=401
    ${headers_sem_token}    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    authorization=none
    ${response}    Run Keyword And Continue On Failure    GET On Session     
    ...    alias=${alias_base}
    ...    url=/produtos/${id_produto}
    ...    headers=${headers_sem_token}
    ...    expected_status=${status_code_desejado}
    [Documentation]    Verifica se retorna mensagem sobre token inválido
    Run Keyword If    $response is not None    
    ...  Should Be Equal    ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    ...  ELSE    Log    Resposta é None, não é possível validar a mensagem
PUT endpoint /produtos/produto-id sem token
    [Arguments]    ${produto_id}=${id_produto}  
    ...            ${payload}=${atualizar_produto}  
    ...            ${status_code_desejado}=401
    ${headers_sem_token}    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    authorization=none
    ${response}    Run Keyword And Continue On Failure    PUT On Session
    ...    alias=${alias_base}
    ...    url=/produtos/${id_produto}
    ...    json=&{payload}
    ...    headers=${headers_sem_token}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

    [Documentation]  Verifica se retorna mensagem informando corretamente sobre token
    Should Be Equal  ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log    message: ${response.json()["message"]}
DEL endpoint /produtos/id_produto sem token
    [Arguments]    ${produto_id}=${id_produto}  ${status_code_desejado}=401
    ${headers_sem_token}    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    authorization=none
    ${response}    Run Keyword And Continue On Failure    DELETE On Session    
    ...    alias=${alias_base}
    ...    url=/produtos/${produto_id}
    ...    headers=${headers_sem_token}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${response.json()}
    Set Test Variable    ${response}

    [Documentation]  Verifica se retorna mensagem informando corretamente sobre token
    Should Be Equal  ${response.json()["message"]}  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log    message: ${response.json()["message"]}