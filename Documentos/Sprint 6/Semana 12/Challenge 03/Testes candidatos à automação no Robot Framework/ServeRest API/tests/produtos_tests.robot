*** Settings ***
Documentation    Cenários de teste candidatos à automação 
...              para o endpoint /produtos
Resource         ../keywords/produtos_keywords.resource
Resource         ../keywords/carrinhos_keywords.resource
Suite Setup      Iniciar sessão autenticado
Suite Teardown   Finalizar sessão

*** Test Cases ***
US003-CT01: Criar produto com todos os campos válidos
    [Tags]    Criar produto válido
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    Validar se retorna mensagem de sucesso
    Validar Status Code "201"
US003-CT02: Criar produto com nome duplicado
    [Tags]    Criar produto com name duplicado
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    Payload cadastrar produto com nome duplicado
    POST endpoint /produtos com nome duplicado
    Validar se retornar mensagem de erro
    Validar Status Code "400"
US003-CT07: Excluir produto existente que não está associado a carrinhos
    [Tags]    Excluir produto
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    DEL endpoint /produtos/id-produto
    Validar se produto foi excluído com sucesso
    Validar Status Code "200"
US003-CT08: Tentar excluir produto que está associado a carrinhos
    [Tags]    Excluir produto de carrinho ativo
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    POST endpoint /carrinhos com dados válidos
    DEL endpoint /produtos/id_produto
    Validar se mensagem informa que não pode excluir produto
    Validar Status Code "400"
US003-CT09: Tentar realizar qualquer ação na rota de produtos sem autenticação
    [Tags]    Ações na rota produtos sem token
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos com dados validos
    Payload cadastrar produto com campos válidos
    POST endpoint /produtos sem token
    GET endpoint /produtos sem token 
    GET endpoint /produtos/produto-id sem token
    Payload atualizar produto com dados válidos
    PUT endpoint /produtos/produto-id sem token
    DEL endpoint /produtos/id_produto sem token