*** Settings ***
Documentation    Cenários de testes para o endpoint /logout
Resource         ../resources/logout_keywords.resource


*** Test Cases ***
Cenário 01: POST Ends a session 200
    POST Endpoint /logout
    Validar se o status code é 200