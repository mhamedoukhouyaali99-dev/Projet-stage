*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Le Formulaire D Inscription Doit Etre Accessible
    Ouvrir Le Navigateur Et Accéder A L'Application
    Click Element    xpath=(//a[contains(normalize-space(.),"S'inscrire")])[1]
    Wait Until Element Is Visible    css=#modal-register input[name="username"]
    Element Should Be Visible    css=#modal-register input[name="useremail"]
    Element Should Be Visible    css=#modal-register input[name="register_pass"]
    Element Should Be Visible    css=#modal-register input[name="register_pass_retype"]

L Inscription Doit Refuser Des Champs Obligatoires Vides
    Ouvrir Le Navigateur Et Accéder A L'Application
    Click Element    xpath=(//a[contains(normalize-space(.),"S'inscrire")])[1]
    Wait Until Element Is Visible    css=#modal-register input[name="username"]
    Click Button    xpath=//button[contains(normalize-space(.),'Soumettre')]
    Wait Until Element Is Visible    css=#modal-register

Le Formulaire De Mot De Passe Oublie Doit Etre Accessible
    Ouvrir Le Navigateur Et Accéder A L'Application
    Click Element    xpath=(//a[contains(normalize-space(.),'Se connecter')])[1]
    Wait Until Element Is Visible    css=#modal-login
    Click Element    xpath=//*[contains(normalize-space(.),'mot de passe oublié')]
    Wait Until Element Is Visible    css=input[name="user_login_forgot"]

*** Keywords ***
Fermer Le Navigateur
    Close All Browsers