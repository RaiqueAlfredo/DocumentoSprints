*** Settings ***
Documentation    Cenários de testes para o endpoint /logout
Resource         ../keywords/logout_keywords.resource
Suite Setup      Iniciar sessão

*** Test Cases ***
Cenário 01: POST Ends a session 200
    POST Endpoint /logout
    Validar Status Code "200"