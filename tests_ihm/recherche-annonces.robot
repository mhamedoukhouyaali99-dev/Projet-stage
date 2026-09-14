*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
La Recherche Doit Afficher Les Resultats Pour Une Destination
    Ouvrir Le Navigateur Et Accéder A L'Application
    Wait Until Element Is Visible    css=input[placeholder="Destination"]
    Input Text    css=input[placeholder="Destination"]    Paris
    Click Button    id=search_submit_button
    Wait Until Location Does Not Contain    /?    timeout=10s

Les Filtres Avances Doivent Etre Accessibles
    Ouvrir Le Navigateur Et Accéder A L'Application
    Wait Until Element Is Visible    xpath=//*[contains(normalize-space(.),'Avancée')]
    Click Element    xpath=//*[contains(normalize-space(.),'Avancée')]
    Wait Until Element Is Visible    xpath=//*[contains(normalize-space(.),'Type de pièce')]

*** Keywords ***
Fermer Le Navigateur
    Close All Browsers