*** Settings ***
Documentation    Cenários de testes para o endpoint /login
Library          RequestsLibrary
Resource         ../resources/login_keywords.resource

*** Test Cases ***
Cenário 01: POST Creates a session 200
    [tags]    Login 
    Criar uma sessão
    POST Endpoint /login
Cenário 02: POST Creates a session 400
    Criar uma sessão