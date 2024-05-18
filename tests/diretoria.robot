*** Settings ***
Resource     ../resources/main.robot
Test Teardown    Fechar navegador


*** Test Cases ***
CT08 - Cadastro Diretoria com Sucesso
    [Setup]    Gerador de Diretorias
    Dado que usuario acesse o menu Diretorias
    Quando clicar no botao novo Cadastro
    E preencher o campo Nome da Diretoria   ${NOME_DIRETORIA}     
    Então o sistema devera cadastrar uma nova diretoria com sucesso
    Screenshot    Diretoria Cadastrada com sucesso

CT09 - Cadastrar Diretoria já cadastrada
    [Tags]    CT09
    Dado que usuario acesse o menu Diretorias
    Quando clicar no botao novo Cadastro
    E preencher o campo Nome da Diretoria    Diretoria pvpwqtqgch    
    Então o sistema devera exibir o alerta "Não é possível salvar esse registro. Diretoria já cadastrada no sistema."
    Screenshot    Diretoria já cadastrada

CT10 - Editar uma Diretoria
    [Tags]    CT10
    [Setup]    Gerador de Diretorias
    Dado que usuario acesse o menu Diretorias
    Quando selecionar uma diretoria
    E preencher o campo Nome da Diretoria   ${NOME_DIRETORIA} 
    Então o sistema devera exibir o novo nome da diretoria
    
    
# CT11 - Cadastra diretoria com nome em branco

