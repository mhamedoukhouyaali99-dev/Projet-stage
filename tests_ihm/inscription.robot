*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Le Formulaire D Inscription Doit Etre Accessible
    Ouvrir Le Navigateur Et Accéder A L'Application
    Execute Javascript    document.querySelector('a[data-target="#modal-register"]').click()
    Wait Until Element Is Visible    css=#modal-register input[name="username"]
    Element Should Be Visible    css=#modal-register input[name="useremail"]
    Element Should Be Visible    css=#modal-register input[name="register_pass"]
    Element Should Be Visible    css=#modal-register input[name="register_pass_retype"]

L Inscription Doit Refuser Des Champs Obligatoires Vides
    Ouvrir Le Navigateur Et Accéder A L'Application
    Execute Javascript    document.querySelector('a[data-target="#modal-register"]').click()
    Wait Until Element Is Visible    css=#modal-register input[name="username"]
    Execute Javascript    document.querySelector('#modal-register button[type="submit"]').click()
    Wait Until Element Is Visible    css=#modal-register

Le Formulaire De Mot De Passe Oublie Doit Etre Accessible
    Ouvrir Le Navigateur Et Accéder A L'Application
    Execute Javascript    document.querySelector('a[data-target="#modal-login"]:not([data-dismiss="modal"])').click()
    Wait Until Element Is Visible    css=#modal-login
    Execute Javascript    document.querySelector('#modal-login a[href*="forgot"], #modal-login [data-target="#modal-login-forgot-password"]').click()
    Wait Until Element Is Visible    css=input[name="user_login_forgot"]

*** Keywords ***
Fermer Le Navigateur
    Close All Browsers