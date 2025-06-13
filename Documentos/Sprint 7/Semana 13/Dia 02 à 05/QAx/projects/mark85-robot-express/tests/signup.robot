*** Settings ***
Documentation        Cenários de teste do cadastro de usuários
Resource             ../resources/base.resource
#Suite Setup         tudo aqui ocorre antes da suite (antes de todos os testes)
#Suite Teardown      tudo aqui ocorre depois da suite (depois de todos os testes)
Test Setup           Start Session  #Faz 1 vez antes de cada teste
Test Teardown        Take Screenshot  #Faz 1 vez depois de cada teste

*** Test Cases ***
Cadastrar novo usuário
    [Tags]          new_user
    ${user}         Create Dictionary    
    ...    name=Raique Alfredo
    ...    email=raique@gmail.com
    ...    password=qatest321
    Remove user from database    ${user}[email]
    Go to signup page
    Submit signup form    ${user}
    Notice should be      Boas vindas ao Mark85, o seu gerenciador de tarefas.
Não permitir o cadastro com email duplicado
    [Tags]    dup
    
    ${user}         Create Dictionary    
    ...    name=Raique Ramos
    ...    email=raique@gmail.com
    ...    password=qatest321
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    [Tags]    required
    ${user}    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${user}    Create Dictionary    
    ...    name=Wolverine
    ...    email=x-men.com.br
    ...    password=123321
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Digite um e-mail válido

Não deve cadastrar com senha abaixo de 6 digitos
    [Tags]    temp

    @{password_list}    Create List    1    12    123    1234    12345
    FOR    ${password}    IN     @{password_list}
        ${user}   Create Dictionary    
            ...    name=Raique Ramos
            ...    email=raique02@gmail.com
            ...    password=${password}
        Go to signup page
        Submit signup form    ${user}
        Alert should be    Informe uma senha com pelo menos 6 digitos
    END