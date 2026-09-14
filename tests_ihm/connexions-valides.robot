*** Settings ***
Library    Selenium2Library
Resource    commun.resource


*** Test Cases ***
Le Tableau De Bord Doit Etre Visible Apres Une Connexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que Le Tableau De Bord Est Visible
    [Teardown]    Effectuer Une Déconnexion Réussie


Le Lien De Deconnexion Devrait Etre Visible Après Une Déconnexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que Le Tableau De Bord Est Visible
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible
    

*** Keywords ***
Effectuer Une Connexion Réussie
    Ouvrir Le Navigateur Et Accéder A L'Application
    Accéder A La Page De Connexion
    Saisir Le Nom D'Utilisateur    ${UTILISATEUR VALIDE} 
    Saisir Le Mot De Passe    ${MOT DE PASSE VALIDE} 
    Soumette Le Formulaire De Connexion

Vérifier Que Le Tableau De Bord Est Visible
    Wait Until Location Contains    /index.php/dashboard/
    Title Should Be    ${TITRE PAGE TABLEAU DE BORD} 
    Page Should Contain    Tableau de bord

Effectuer Une Déconnexion Réussie
    Execute Javascript    document.querySelector('a[href*="action=logout"]').click()
    Wait Until Location Does Not Contain    /index.php/dashboard/
    
Vérifier Que Le Lien De Connexion Est Visible
    Page Should Contain    Se connecter

    
    
    
    