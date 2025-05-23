*** Settings ***
Documentation    Cenários de testes para o endpoint /users
Resource         ../resources/users_keywords.resource

*** Test Cases ***
Cenário 01: GET Fetches a user 200
    POST Endpoint /register
    GET Endpoint /users/id
    Validar se o usuário foi encontrado corretamente
    Validar se o status code é 200

Cenário 02: GET Fetches a user 404
    GET Endpoint /users/id 404 
    Validar se o status code é 404


Cenário 03: PUT Updates a user 200
    POST Endpoint /register
    PUT Endpoint /users/id
    Validar se atualizar o usuário foi bem sucedido
    Validar se o status code retornado é 200

Cenário 04: DELETE Deletes a user 204
    POST Endpoint /register
    DELETE Endpoint /users/id
    Validar se o usuário foi deletado com sucesso 
       ### Observação: o comportamento da API não deleta de "verdade". Então ao usar delete, ele aparece que foi sucedido, não retorna nada no response e retorna status 204, mas ele não deleta definitivamente. Pois tentei buscar o usuário pelo id fornecido ao deletar e retornou o usuário.
    Validar se o status code é 204
