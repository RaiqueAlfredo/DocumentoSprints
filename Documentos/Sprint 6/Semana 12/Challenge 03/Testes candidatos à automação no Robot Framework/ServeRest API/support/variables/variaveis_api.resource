*** Settings ***
Documentation    Arquivo para armazenar variáveis globais da API ServeRest
Resource         ../../support/common/common.resource

*** Variables ***
${alias_base}     ServeRest
${url_base}       https://compassuol.serverest.dev
${auth_token}     ${EMPTY}
&{headers}        accept=application/json  Content-Type=application/json