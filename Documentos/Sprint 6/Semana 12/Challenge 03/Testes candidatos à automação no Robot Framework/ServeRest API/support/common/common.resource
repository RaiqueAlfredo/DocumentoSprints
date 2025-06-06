*** Settings ***
Documentation    Keywords para ações gerais
Resource         ../../support/base.robot
Resource         ../../keywords/usuarios_keywords.resource
Resource         ../../keywords/login_keywords.resource  
                 ##Adicionei esse resource por conta de um bug dentro da extensão do robot. Percebi que aparece um erro na keyword "Validar Status Code" que ela não consegue identificar de onde vem o "response", mas mesmo que apareça esse erro, a keyword funciona. Então adicionei esse resource pra não ficar apontando um erro que não existe. E acabei usando ele no fim kkkk

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}
    Log               Status Code: ${statuscode}
Importar JSON Static
    [Arguments]    ${nome_arquivo}
    ${arquivo}     Get File  ${EXECDIR}/support/fixtures/static/${nome_arquivo}
    ${data}        Evaluate  json.loads('''${arquivo}''')    json
    RETURN         ${data}

###Payloads abaixo para usuarios_tests:
Payload cadastrar usuário com dados válidos
    ${nome}        FakerLibrary.Name
    ${email}       FakerLibrary.Email
    ${password}    FakerLibrary.Password
    
    ${dados_validos}    Create Dictionary    
    ...    nome=${nome}    
    ...    email=${email}
    ...    password=${password}
    ...    administrador=true
    Set Global Variable    ${dados_validos} 
Payload cadastrar usuário com email duplicado
    ${email}    Get From Dictionary   ${dados_validos}    email
    ${dados_email_duplicado}    Create Dictionary    
    ...    nome=Fulano1
    ...    email=${email}
    ...    password=123
    ...    administrador=true
    Set Global Variable    ${dados_email_duplicado}
Payload cadastrar usuário com email inválido
    ${json}    Importar JSON Static    json_usuarios.json
    ${dados_email_invalido}    Set Variable    ${json["user_email_invalido"]}
    Set Global Variable    ${dados_email_invalido}
Payload cadastrar usuário com campo nome vazio
    ${json}    Importar JSON Static    json_usuarios.json
    ${dados_nome_vazio}    Set Variable    ${json["user_nome_vazio"]}
    Set Global Variable    ${dados_nome_vazio}

###Payloads abaixo para login_tests:
Payload com dados válidos
    ${email}       Get From Dictionary   ${dados_validos}    email
    ${password}    Get From Dictionary   ${dados_validos}    password
    ${dados_validos_login}    Create Dictionary    
    ...    email=${email}
    ...    password=${password}
    Set Global Variable    ${dados_validos_login}
Payload com e-mail não cadastrado
    ${json}    Importar JSON Static    json_login.json
    ${dados_email_sem_cadastro}        Set Variable    ${json["email_nao_cadastrado"]}
    Set Global Variable                ${dados_email_sem_cadastro}

###Payloads abaixo para produtos_tests:
Payload cadastrar produto com campos válidos
    ${nome}        FakerLibrary.Name
    ${preco}       FakerLibrary.Random Number
    ${descricao}   FakerLibrary.Paragraph
    ${quantidade}  FakerLibrary.Random Number

    ${produto_dados_validos}    Create Dictionary    
    ...    nome=${nome}    
    ...    preco=${preco}
    ...    descricao=${descricao}
    ...    quantidade=${quantidade}
    Set Global Variable    ${produto_dados_validos}
Payload cadastrar produto com nome duplicado
    ${Nome}        Get From Dictionary   ${produto_dados_validos}    nome
    ${Preco}       FakerLibrary.Random Number
    ${Descricao}   FakerLibrary.Paragraph
    ${Quantidade}  FakerLibrary.Random Number
    ${dados_email_duplicado}    Create Dictionary    
    ...    nome=${Nome}
    ...    preco=${Preco}
    ...    descricao=${Descricao}
    ...    quantidade=${Quantidade}
    Set Global Variable    ${dados_email_duplicado}
Payload atualizar produto com dados válidos
    ${nome}        FakerLibrary.Name
    ${preco}       FakerLibrary.Random Number
    ${descricao}   FakerLibrary.Paragraph
    ${quantidade}  FakerLibrary.Random Number

    ${atualizar_produto}    Create Dictionary    
    ...    nome=${nome}    
    ...    preco=${preco}
    ...    descricao=${descricao}
    ...    quantidade=${quantidade}
    Set Global Variable    ${atualizar_produto}