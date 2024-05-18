*** Settings ***
Documentation    Arquivo que irá conter todos os imports, de libs, variaveis e keywords


Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    FakerLibrary    locale=pt_BR
Library    String
Library    DebugLibrary
Library    ./utils/gerador_senha.py

#Data
Variables  ./data/ambiente.yaml
Variables  ./data/login_admin.yaml

#Shared
Resource   ./shared/utils_keywords.robot

#Pages
Resource    ./pages/login_page.robot
Resource    ./pages/diretoria_page.robot
Resource    ./pages/usuarios_page.robot

#Keywords
Resource    ./keywords/login_kws.resource
Resource    ./keywords/diretoria_kws.resource
Resource    ./keywords/usuarios_kws.resource

#API
Resource    ./api/keywords/api_post_user.resource
