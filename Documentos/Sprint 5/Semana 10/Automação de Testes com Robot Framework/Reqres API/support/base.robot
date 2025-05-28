*** Settings ***
Documentation    Arquivos para guardar keywords, variáveis e librarys        
...              usadas  nos testes
Library          RequestsLibrary
Library          Collections
Library          String
Library          OperatingSystem
Library          jsonschema
Resource         ../support/common/common.resource
Resource         ../support/variables/reqres_variaveis.resource


*** Keywords ***
Iniciar sessão
    Create Session    alias=${alias_base}    url=${url_base}    headers=${headers}

Finalizar sessão
    Delete All Sessions
    Log    Todas as sessões foram encerradas