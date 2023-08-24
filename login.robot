*** Settings ***
Documentation        Robot Framework
Library              SeleniumLibrary    timeout=200
Library              String
          
*** Variables ***
${url}               https://automationteststore.com/  
${navegador}         chrome
${usuario}           Garurumonx 
${senha}             Garurumon10@
${nome}              Agumon
${produto0}          ck one shock for him Deodorant
${produto1}          Armani Code after shave balm
${qntpedida}         2
${mensagemsucesso}   YOUR ORDER HAS BEEN PROCESSED!


*** Keywords ***
Abrir Browser
    Open Browser    ${url}    ${navegador}     
    Maximize Browser Window

Logar 
    Click Link        Login or register
    Input Text        id=loginFrm_loginname    ${usuario}
    Input Text        id=loginFrm_password     ${senha}
    Click Element     xpath=//div[2]/div/form//button

Adicionar
    Click Element    xpath=//nav/ul/li[5]/a    
    Click Element    xpath=//div/div/div/div/ul/li[1]/div//a
    Click Element    xpath=//div[1]/div[2]/div[3]/a
    Click Element    xpath=//div[9]/div[2]/div[3]/a
    Click Element    xpath=//div[9]/div[2]/div[3]/a
    Click Element    xpath=//div[3]/ul/li/a 


*** Test Cases ***
FazerLogin
    Abrir Browser    
    Logar
    Element Text Should Be    xpath=//h1/span[2]    ${nome}

AdicionarItemNoCarrinho
    Abrir Browser
    Logar
    Adicionar
    Wait Until Element Is Visible    xpath=//form/div/div[1]/table/tbody/tr[2]/td[2]//a
    Element Text Should Be    xpath=//form/div/div[1]/table/tbody/tr[2]/td[2]//a    ${produto0}
    Element Text Should Be    xpath=//tr[3]/td[2]/a                                 ${produto1}
    
FinalizarCompra
    Abrir Browser
    Logar
    Adicionar
    Click Element                     xpath=//form/div/div[1]/div/a
    Element Text Should Be            xpath=//table[3]/tbody/tr[2]/td[4]    ${qntpedida}
    Click Element                     xpath=//div[2]/div/div/div/button
    Wait Until Element Is Visible     xpath=//section/a
    Element Text Should Be            xpath=//div/div/div/h1/span[1]        ${mensagemsucesso}

RemoverItem
    Abrir Browser
    Logar
    Adicionar
    Click Element    xpath=//tr[2]/td[7]/a