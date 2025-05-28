*** Settings ***
Documentation    Cenários de testes para o endpoint /resource
Resource         ../keywords/resource_keywords.resource
Suite Setup      Iniciar sessão
Suite Teardown   Finalizar sessão

*** Test Cases ***
Cenário 01: GET Fetches a resource list 200
    [Tags]    Resource List 200
    GET Endpoint /unknown
    Validar se retornou lista correta
    Validar Status Code "200"