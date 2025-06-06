*** Settings ***
Documentation    Arquivo para armazenar keywords, variáveis e librarys usadas
...              nos testes candidatos à automação
Library          RequestsLibrary
Library          Collections
Library          String
Library          OperatingSystem
Library          jsonschema
Library          FakerLibrary
Resource         ../support/variables/variaveis_api.resource

*** Keywords ***
Iniciar sessão autenticado
    Iniciar sessão
    Login e armazenar token bearer
Iniciar sessão
    Run Keyword If   '${auth_token}' != '${EMPTY}'    Set To Dictionary    ${headers}    Authorization=${auth_token}
    Create Session  alias=${alias_base}  url=${url_base}  headers=${headers}
Login e armazenar token bearer
    Payload cadastrar usuário com dados válidos
    POST endpoint /usuarios com dados validos
    Payload com dados válidos
    POST endpoint /login com dados válidos
    ${auth_token}    Set Variable  ${response.json()["authorization"]}  
    Set Global Variable    ${auth_token}
    Iniciar sessão
Finalizar sessão
    Delete All Sessions
    Log    Sessões encerradas.