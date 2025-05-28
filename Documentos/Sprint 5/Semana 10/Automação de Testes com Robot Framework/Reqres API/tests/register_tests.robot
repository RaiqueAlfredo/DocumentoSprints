*** Settings ***
Documentation    Cenários de testes para o endpoint /register
Resource         ../keywords/register_keywords.resource
Suite Setup      Iniciar sessão
Suite Teardown   Finalizar sessão

*** Test Cases ***
Cenário 01: POST Creates a user 200
    [Tags]    Register 200
    Payload Registrar Usuario Valido
    POST Endpoint /register    ${payload_register_200}
    Validar se o usuário foi criado corretamente
    Validar Status Code "200"
Cenário 02: POST Creates a user 400
    [Tags]    Register 400
    Payload Registrar Usuario Invalido
    POST Endpoint /register 400    ${payload_register_400}
    Validar se criar usuário foi mal sucedido
    Validar Status Code "400"