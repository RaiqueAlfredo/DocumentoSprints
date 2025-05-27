*** Settings ***
Documentation    Arquivos para guardar keywords, variáveis e librarys        
...              usadas  nos testes
Library          RequestsLibrary
Library          Collections
Library          String
Library          OperatingSystem
Resource         ../support/common/common.resource
Resource         ../support/variables/reqres_variaveis.resource
Resource         ../support/fixtures/static/json_login.json
Resource         ../support/fixtures/static/json_register.json
Resource         ../support/fixtures/static/json_user_patch.json
Resource         ../support/fixtures/static/json_user_put.json


*** Keywords ***
Iniciar sessão
    Create Session    alias=${alias_base}    url=${url_base}    headers=${headers}