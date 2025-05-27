*** Settings ***
Documentation    Cenários de testes para o endpoint /login
Resource         ../keywords/login_keywords.resource
Suite Setup      Iniciar sessão

*** Test Cases ***
Cenário 01: POST Creates a session 200
    Payload Login Usuario Valido
    POST Endpoint /login
    Validar se o login foi bem sucedido
    Validar Status Code "200"
Cenário 02: POST Creates a session 400
    Payload Login Usuario Invalido
    POST Endpoint /login 400
    Validar se o login foi mal sucedido
    Validar Status Code "400"