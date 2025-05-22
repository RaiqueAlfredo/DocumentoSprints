*** Settings ***
Documentation    Cenários de testes para o endpoint /register
Library          RequestsLibrary
Resource         ../resources/register_keywords.resource

*** Variables ***

*** Test Cases ***
Cenário 01: POST Creates a user 200
    Criar um usuário
Cenário 02: POST Creates a user 400
    Criar um usuário