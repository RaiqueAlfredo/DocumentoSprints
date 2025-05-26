*** Settings ***
Documentation    Arquivo criado pra registrar variáveis e keywords globais 
Library          RequestsLibrary

*** Variables ***
${username}      Raique
${email}         eve.holt@reqres.in
${password}      pistola
${alias_base}    ReqRes
${url_base}      https://reqres.in/api
${API_Key}       reqres-free-v1
&{headers}       accept=application/json  Content-Type=application/json  x-api-key=${API_Key}

*** Keywords ***
Iniciar sessão
    Create Session    alias=${alias_base}    url=${url_base}    headers=${headers}