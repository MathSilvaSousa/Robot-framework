*** Settings ***
Documentation        Robot Framework
Library              SeleniumLibrary    timeout=200
Library              String

*** Variables ***
${url}               https://automationteststore.com/  
${navegador}         chrome
${nome}              Agumon    
${sobrenome}         Gabumon
${email}             gabumonX@digimon.com        
${endereco}          Rua Digimundo 123
${cidade}            Mundo Digital
${zip code}          01234-567
${usuario}           Garurumonx    
${senha}             Garurumon10@
${email2}            metalgreymon@digimon.com
${usuarioerror}      This login name is not available. Try different login name!
${usuario2}          WereGarurumon
${senhadif}          Garurumon10x    
${senhaerror}        Password confirmation does not match password!
${emailerror}        Email Address does not appear to be valid!
${campovazio}        Login name must be alphanumeric only and between 5 and 64 characters!


*** Keywords ***
Abrir Browser
    Open Browser    ${url}    ${navegador}     
    Maximize Browser Window

Dados Cadastrais
    Click Link                        Login or register
    Click Element                     //div[1]/div/form//button
    Wait Until Element Is Visible     xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                        id=AccountFrm_firstname        ${nome}
    Input Text                        id=AccountFrm_lastname         ${sobrenome}
    Input Text                        id=AccountFrm_address_1        ${endereco}
    Input Text                        id=AccountFrm_city             ${cidade}
    Input Text                        id=AccountFrm_postcode         ${zip code}    



*** Test Cases ***
AbrirNavegador
    Abrir Browser


FazerCadastro
    Abrir Browser
    Dados Cadastrais
    Input Text                id=AccountFrm_email    ${email}
    Click Element             xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                id=AccountFrm_loginname    ${usuario}
    Input Text                id=AccountFrm_password    ${senha}
    Input Text                id=AccountFrm_confirm    ${senha}
    Click Element             xpath=//*[@id="AccountFrm_zone_id"]/option[26]
    Element Text Should Be    xpath=//*[@id="AccountFrm_country_id"]/option[31]     Brazil
    Element Text Should Be    xpath=//*[@id="AccountFrm_zone_id"]/option[26]        Sao Paulo
    Click Element             xpath=//div[5]/div/label//input
    Click Element             xpath=//div[5]//button
    Element Text Should Be    xpath=//h1//span[1]     YOUR ACCOUNT HAS BEEN CREATED!


UsuarioIgual
    Abrir Browser
    Dados Cadastrais
    Input Text                    id=AccountFrm_email                    ${email2}
    Click Element                 xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                    id=AccountFrm_loginname                ${usuario}
    Input Text                    id=AccountFrm_password                 ${senha}
    Input Text                    id=AccountFrm_confirm                  ${senha}
    Click Element                 xpath=//*[@id="AccountFrm_zone_id"]/option[26]
    Element Text Should Be        xpath=//*[@id="AccountFrm_country_id"]/option[31]     Brazil
    Element Text Should Be        xpath=//*[@id="AccountFrm_zone_id"]/option[26]        Sao Paulo
    Click Element                 xpath=//div[5]/div/label//input
    Click Element                 xpath=//div[5]//button
    Element Text Should Be        xpath=//div[3]/fieldset/div[1]/span    ${usuarioerror}

SenhaDiferente
    Abrir Browser
    Dados Cadastrais
    Input Text                id=AccountFrm_email                    ${email2}
    Click Element             xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                id=AccountFrm_loginname                ${usuario2}
    Input Text                id=AccountFrm_password                 ${senha}
    Input Text                id=AccountFrm_confirm                  ${senhadif}
    Click Element             xpath=//*[@id="AccountFrm_zone_id"]/option[26]
    Element Text Should Be    xpath=//*[@id="AccountFrm_country_id"]/option[31]     Brazil
    Element Text Should Be    xpath=//*[@id="AccountFrm_zone_id"]/option[26]        Sao Paulo
    Click Element             xpath=//div[5]/div/label//input
    Click Element             xpath=//div[5]//button
    Element Text Should Be    xpath=//div[3]/fieldset/div[3]/span    ${senhaerror}

EmailIgual
    Abrir Browser
    Dados Cadastrais
    Input Text                   id=AccountFrm_email                   ${email}
    Click Element                xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                   id=AccountFrm_loginname               ${usuario2}
    Input Text                   id=AccountFrm_password                ${senha}
    Input Text                   id=AccountFrm_confirm                 ${senha}
    Click Element                xpath=//*[@id="AccountFrm_zone_id"]/option[26]
    Element Text Should Be       xpath=//*[@id="AccountFrm_country_id"]/option[31]     Brazil
    Element Text Should Be       xpath=//*[@id="AccountFrm_zone_id"]/option[26]        Sao Paulo
    Click Element                xpath=//div[5]/div/label//input
    Click Element                xpath=//div[5]//button
    Element Text Should Be       xpath=//div[1]/fieldset/div[3]/span   ${emailerror}
       
CampaObrigatorioVazio
    Abrir Browser    
    Dados Cadastrais
    Input Text                id=AccountFrm_email                    ${email2}
    Click Element             xpath=//*[@id="AccountFrm_country_id"]/option[31]
    Input Text                id=AccountFrm_password                 ${senha}
    Input Text                id=AccountFrm_confirm                  ${senha}
    Click Element             xpath=//*[@id="AccountFrm_zone_id"]/option[26]
    Element Text Should Be    xpath=//*[@id="AccountFrm_country_id"]/option[31]     Brazil
    Element Text Should Be    xpath=//*[@id="AccountFrm_zone_id"]/option[26]        Sao Paulo
    Click Element             xpath=//div[5]/div/label//input
    Click Element             xpath=//div[5]//button
    Element Text Should Be    xpath=//div[3]/fieldset/div[1]/span    ${campovazio}
    

