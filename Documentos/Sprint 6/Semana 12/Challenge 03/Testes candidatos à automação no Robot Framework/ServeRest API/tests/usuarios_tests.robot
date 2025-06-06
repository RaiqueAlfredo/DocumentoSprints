*** Settings ***
Documentation    Cenários de teste candidatos à automação 
...              para o endpoint /usuarios
Resource         ../keywords/usuarios_keywords.resource
Suite Setup      Iniciar sessão autenticado
Suite Teardown   Finalizar sessão

*** Test Cases ***
US001-CT01: Criar usuário com todos os campos válidos
    [Tags]    Criar user valido
    Payload cadastrar usuário com dados válidos
    POST endpoint /usuarios com dados validos
    Validar se usuário foi cadastrado corretamente
    Validar Status Code "201" 
US001-CT02: Criar usuário com e-mail duplicado
    [Tags]    Criar user com email duplicado
    Payload cadastrar usuário com dados válidos
    POST endpoint /usuarios com dados validos
    Payload cadastrar usuário com email duplicado
    POST endpoint /usuarios com email duplicado
    Validar se informa que o email está sendo usado
    Validar Status Code "400"

US001-CT03: Criar usuário com e-mail inválido
    [Tags]    Criar user com email invalido
    Payload cadastrar usuário com email inválido
    POST endpoint /usuarios com email inválido
    Validar se informar que o email é inválido
    Validar Status Code "400"
US001-CT06: Criar usuário com campo "nome" vazio ou ausente
    [Tags]    Criar user com nome vazio
    Payload cadastrar usuário com campo nome vazio
    POST endpoint /usuarios com campo nome vazio
    Validar se informa que o campo não pode ficar vazio
    Validar Status Code "400"