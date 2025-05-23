*** Settings ***
Documentation    Cenários de testes para o endpoint /login
Resource         ../resources/login_keywords.resource

*** Test Cases ***
Cenário 01: POST Creates a session 200
    POST Endpoint /login
    Validar se o login foi bem sucedido
    Validar se o status code é 200
Cenário 02: POST Creates a session 400
    POST Endpoint /login 400
    Validar se o login foi mal sucedido
    Validar se o status code é 400