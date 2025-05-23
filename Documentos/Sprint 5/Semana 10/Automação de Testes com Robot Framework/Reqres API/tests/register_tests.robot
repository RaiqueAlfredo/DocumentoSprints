*** Settings ***
Documentation    Cenários de testes para o endpoint /register
Resource         ../resources/register_keywords.resource

*** Test Cases ***
Cenário 01: POST Creates a user 200
    POST Endpoint /register
    Validar se o usuário foi criado corretamente
    Validar Status Code 200
Cenário 02: POST Creates a user 400
    POST Endpoint /register 400
    Validar se criar usuário foi mal sucedido
    Validar Status Code 400