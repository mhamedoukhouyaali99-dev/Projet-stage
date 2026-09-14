*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Setup    Se Connecter
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Le Portefeuille Doit Afficher Ses Indicateurs
    Go To    ${URL}/index.php/wallet-2/
    Wait Until Page Contains    Portefeuille
    Page Should Contain    Dépôt de garantie
    Page Should Contain    Total des réservations
    Page Should Contain    L'histoire
    Page Should Contain    Paiements

Le Portefeuille Doit Afficher Les Etats Vides
    Go To    ${URL}/index.php/wallet-2/
    Wait Until Page Contains    Portefeuille
    Page Should Contain    Pour le moment, il n'y a aucun enregistrement.
    Page Should Contain    Pour le moment, il n'y a aucun paiement.

Les Actions Du Portefeuille Doivent Etre Accessibles
    Go To    ${URL}/index.php/wallet-2/
    Wait Until Page Contains    Portefeuille
    Page Should Contain Link    Détails
    Page Should Contain Link    Gérer
    Page Should Contain Element    xpath=//a[contains(@href,'dpage=payouts')]

*** Keywords ***
Se Connecter
    Ouvrir Le Navigateur Et Accéder A L'Application
    Accéder A La Page De Connexion
    Saisir Le Nom D'Utilisateur    ${UTILISATEUR VALIDE}
    Saisir Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumette Le Formulaire De Connexion
    Wait Until Location Contains    /index.php/dashboard/

Fermer Le Navigateur
    Close All Browsers