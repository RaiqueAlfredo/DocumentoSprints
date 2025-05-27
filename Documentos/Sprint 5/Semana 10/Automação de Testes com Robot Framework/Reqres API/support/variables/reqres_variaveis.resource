*** Settings ***
Documentation    Arquivo onde armazeno variáveis globais da API

*** Variables ***
${alias_base}    ReqRes
${url_base}      https://reqres.in/api
${API_Key}       reqres-free-v1
&{headers}       accept=application/json  Content-Type=application/json
...              x-api-key=${API_Key}