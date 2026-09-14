*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Template    Une Fonction Du Compte Doit Etre Accessible
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Acces Au Profil                         /index.php/profile/
Acces Aux Reservations                  /index.php/reservations/
Acces Au Portefeuille                   /index.php/wallet-2/
Acces Aux Favoris                       /index.php/favorites/
Acces Aux Factures                      /index.php/invoices/
Acces Aux Messages                      /index.php/messages/
Acces A La Verification Du Profil       /index.php/profile/?dpage=verification
Acces Au Changement De Mot De Passe     /index.php/profile/?dpage=password-reset
Acces Au Moyen De Paiement               /index.php/profile/?dpage=payment-method

*** Keywords ***
Une Fonction Du Compte Doit Etre Accessible
    [Arguments]    ${chemin}
    Effectuer Une Connexion
    Go To    ${URL}${chemin}
    Wait Until Location Contains    ${chemin}

Effectuer Une Connexion
    Ouvrir Le Navigateur Et Accéder A L'Application
    Accéder A La Page De Connexion
    Saisir Le Nom D'Utilisateur    ${UTILISATEUR VALIDE}
    Saisir Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumette Le Formulaire De Connexion
    Wait Until Location Contains    /index.php/dashboard/

Fermer Le Navigateur
    Close All Browsers