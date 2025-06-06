*** Settings ***
Documentation    Cenários de teste candidatos à automação 
...              para o endpoint /login
Resource         ../keywords/login_keywords.resource
Resource         ../keywords/usuarios_keywords.resource
Suite Setup      Iniciar sessão autenticado
Suite Teardown   Finalizar sessão

*** Test Cases ***
US002-CT01: Login com credenciais válidas
    [Tags]    login válido
    Payload cadastrar usuário com dados válidos
    POST endpoint /usuarios com dados validos
    Payload com dados válidos
    POST endpoint /login com dados válidos
    Validar se retorna mensagem e token
    Validar Status Code "200"
US002-CT02: Tentar login com e-mail não cadastrado
    [Tags]    login com email não cadastrado
    Payload com e-mail não cadastrado
    POST endpoint /login com email não cadastrado
    Validar se retorna mensagem adequada
    Validar Status Code "401"