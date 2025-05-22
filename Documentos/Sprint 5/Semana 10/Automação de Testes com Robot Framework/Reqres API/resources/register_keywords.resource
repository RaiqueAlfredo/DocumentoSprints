*** Settings ***
Documentation    Keywords e variáveis para ações no endpoint /register
Library          RequestsLibrary
Library          String

*** Variables ***

*** Keywords ***
Criar um usuário
    ${body}    Create Dictionary  
    ...  username=string  
    ...  email=string
    ...  password=string
