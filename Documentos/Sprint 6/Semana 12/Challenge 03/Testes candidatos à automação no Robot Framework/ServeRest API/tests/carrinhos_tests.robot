*** Settings ***
Documentation    Cenários de teste candidatos à automação 
...              para o endpoint /carrinhos
Resource         ../keywords/carrinhos_keywords.resource
Resource         ../keywords/produtos_keywords.resource
Suite Setup      Iniciar sessão autenticado
Suite Teardown   Finalizar sessão

*** Test Cases ***
US004-CT03: Tentar cadastrar um carrinho sem token
    [Tags]  Cadastrar carrinho sem token
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    POST endpoint /carrinhos sem token
    Validar se a mensagem informa correto sobre o token
    Validar Status Code "401"
US004-CT05: Tentar concluir compra sem carrinho ativo
    [Tags]    Concluir compra sem carrinho
    DEL endpoint /carrinhos/concluir-compra
    Validar se a mensagem retornada está correta
    Validar Status Code "200"
US004-CT06: Tentar cancelar compra sem token ou com token inválido
    [Tags]    Cancelar compra sem token
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    POST endpoint /carrinhos com dados válidos
    DEL endpoint /carrinhos/cancelar-compra
    Validar se informa correto sobre o token
    Validar Status Code "401"