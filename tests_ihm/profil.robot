*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Setup    Se Connecter
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Le Profil Doit Afficher Les Informations Du Compte
    Go To    ${URL}/index.php/profile/
    Wait Until Page Contains    Profil
    Wait Until Element Is Visible    name=username
    Text Field Value Should Be    name=username    robot
    Page Should Contain    Information
    Page Should Contain    Adresse
    Page Should Contain    Personne à contacter en cas d'urgence

Le Profil Doit Proposer Les Actions Principales
    Go To    ${URL}/index.php/profile/
    Wait Until Element Is Visible    name=username
    Page Should Contain Button    Enregistrer
    Page Should Contain Button    Supprimer
    Page Should Contain Button    Parcourir

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