*** Settings ***
Documentation    Cenários de testes para o endpoint /resource
Resource         ../resources/resource_keywords.resource


*** Test Cases ***
Cenário 01: GET Fetches a resource list 200
    GET Endpoint /unknown
    Validar se retornou lista correta
    Validar status code