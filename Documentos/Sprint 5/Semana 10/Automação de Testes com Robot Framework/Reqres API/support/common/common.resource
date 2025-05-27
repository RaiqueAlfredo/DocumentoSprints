*** Settings ***
Documentation    Keywords e variáveis para ações gerais 
Library          OperatingSystem
Resource         ../../keywords/register_keywords.resource

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}
    Log    Status Code: ${statuscode}

Importar JSON Estatico
    [Arguments]   ${nome_arquivo}
    ${arquivo}    Get File  ${EXECDIR}/support/fixtures/static/${nome_arquivo}
    ${data}       Evaluate    json.loads('''${arquivo}''')    json
    [return]      ${data}

Payload Login Usuario Valido
    ${json}                Importar JSON Estatico    json_login.json
    ${payload__login_200}  Set Variable    ${json["login_valido"]}
    Set Global Variable    ${payload__login_200}

Payload Login Usuario Invalido
    ${json}                Importar JSON Estatico    json_login.json
    ${payload__login_400}  Set Variable    ${json["login_invalido"]}
    Set Global Variable    ${payload__login_400}

Payload Registrar Usuario Valido
    ${json}                  Importar JSON Estatico    json_register.json
    ${payload_register_200}  Set Variable    ${json["register_valido"]}
    Set Global Variable    ${payload_register_200}

Payload Registrar Usuario Invalido
    ${json}    Importar JSON Estatico    json_register.json
    ${payload_register_400}  Set Variable    ${json["register_invalido"]}
    Set Global Variable    ${payload_register_400}

Payload PATCH Usuario com sucesso
    ${json}                Importar JSON Estatico    json_user_patch.json
    ${payload_patch}       Set Variable    ${json["patch"]}
    Set Global Variable    ${payload_patch}

Payload PUT Usuario com sucesso
    ${json}                Importar JSON Estatico    json_user_put.json
    ${payload_put}         Set Variable    ${json["put"]}
    Set Global Variable    ${payload_put}