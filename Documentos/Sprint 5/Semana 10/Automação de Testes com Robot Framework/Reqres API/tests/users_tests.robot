*** Settings ***
Documentation    Cenários de testes para o endpoint /users
Resource         ../keywords/users_keywords.resource
Suite Setup      Iniciar sessão
Suite Teardown   Finalizar sessão

*** Test Cases ***
Cenário 01: GET Fetches a user 200
    [Tags]    Get User Id 200
    Payload Registrar Usuario Valido
    POST Endpoint /register   
    GET Endpoint /users/id
    Validar se o usuário foi encontrado corretamente
    Validar Status Code "200"
Cenário 02: GET Fetches a user 404
    [Tags]    Get User Id 404
    GET Endpoint /users/id 404 
    Validar Status Code "404"
Cenário 03: PUT Updates a user 200
    [Tags]    Update User 200
    Payload Registrar Usuario Valido
    POST Endpoint /register
    Payload PUT Usuario com sucesso
    PUT Endpoint /users/id    ${ID_USER}    ${payload_put}
    Validar se atualizar o usuário foi bem sucedido
    Validar Status Code "200"
Cenário 04: PATCH Updates a user 200
    [Tags]    Updates user 200
    Payload Registrar Usuario Valido
    POST Endpoint /register
    Payload PATCH Usuario com sucesso
    PATCH Endpoint /users/id    ${ID_USER}    ${payload_patch}
    Validar se patch foi bem sucedido
    Validar Status Code "200"
Cenário 05: DELETE Deletes a user 204
    [Tags]    Delete User 204
    Payload Registrar Usuario Valido
    POST Endpoint /register
    DELETE Endpoint /users/id    ${ID_USER}
    Validar se o usuário foi deletado com sucesso 
       ### Observação: o comportamento da API não deleta de "verdade". Então ao usar delete, ele aparece que foi sucedido, não retorna nada no response e retorna status 204, mas ele não deleta definitivamente. Pois tentei buscar o usuário pelo id fornecido ao deletar e retornou o usuário.
    Validar Status Code "204"