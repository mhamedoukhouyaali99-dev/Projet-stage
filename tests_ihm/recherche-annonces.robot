*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
La Recherche Doit Afficher Les Resultats Pour Une Destination
    Ouvrir Le Navigateur Et Accéder A L'Application
    Execute Javascript    const select = document.querySelector('select[name="city"]'); const option = Array.from(select.options).find(item => item.text.trim() === 'Paris'); select.value = option.value; select.dispatchEvent(new Event('change', { bubbles: true }));
    Execute Javascript    document.querySelector('#search_submit_button').click()
    Wait Until Location Contains    /index.php/search-results/    timeout=10s
    Title Should Be    Search Results - Livraison 3

Les Filtres Avances Doivent Etre Accessibles
    Ouvrir Le Navigateur Et Accéder A L'Application
    Wait Until Element Is Visible    xpath=//*[contains(normalize-space(.),'Avancée')]
    Click Element    xpath=//*[contains(normalize-space(.),'Avancée')]
    Wait Until Element Is Visible    xpath=//*[contains(normalize-space(.),'Type de pièce')]

*** Keywords ***
Fermer Le Navigateur
    Close All Browsers