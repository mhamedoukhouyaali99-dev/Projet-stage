*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL}    http://livraison3.testacademy.fr
${NAVIGATEUR}    Chrome
${OPTIONS_CHROME}    add_argument("--headless=new"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1920,1080")
${LIEN SE CONNECTER}    xpath=(//a[@data-target="#modal-login" and not(@data-dismiss="modal")])[1]
${LIEN SE DECONNECTER}    css=a[href*="action=logout"]
${MODAL CONNEXION}    css=#modal-login
${CHAMP NOM UTILISATEUR}    css=#modal-login input[name="username"]
${CHAMP MOT DE PASSE}    css=#modal-login input[name="password"]
${UTILISATEUR VALIDE}    robot
${MOT DE PASSE VALIDE}    robot
${BOUTON SE CONNECTER}    css=#modal-login .homey_login_button
${ZONE ERREUR}    css=#modal-login .error
${TITRE PAGE TABLEAU DE BORD}    Tableau de bord - Livraison 3

*** Keywords ***
Ouvrir Le Navigateur Et Accéder A L'Application
    Open Browser    ${URL}     ${NAVIGATEUR}    options=${OPTIONS_CHROME}
    Maximize Browser Window

Accéder A La Page De Connexion
    Execute Javascript    document.querySelector('a[data-target="#modal-login"]:not([data-dismiss="modal"])').click()
    Wait Until Element Is Visible    ${MODAL CONNEXION}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}
    Scroll Element Into View    ${CHAMP NOM UTILISATEUR}

Saisir Le Nom D'Utilisateur
    [Arguments]    ${utilisateur valide}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}
    Wait Until Element Is Enabled    ${CHAMP NOM UTILISATEUR}
    Scroll Element Into View    ${CHAMP NOM UTILISATEUR}
    Execute Javascript    const field = document.querySelector('#modal-login input[name="username"]'); field.value = arguments[0]; field.dispatchEvent(new Event('input', { bubbles: true })); field.dispatchEvent(new Event('change', { bubbles: true }));    ARGUMENTS    ${utilisateur valide}

Saisir Le Mot De Passe
    [Arguments]       ${mot de passe}
    Wait Until Element Is Visible    ${CHAMP MOT DE PASSE}
    Wait Until Element Is Enabled    ${CHAMP MOT DE PASSE}
    Scroll Element Into View    ${CHAMP MOT DE PASSE}
    Execute Javascript    const field = document.querySelector('#modal-login input[name="password"]'); field.value = arguments[0]; field.dispatchEvent(new Event('input', { bubbles: true })); field.dispatchEvent(new Event('change', { bubbles: true }));    ARGUMENTS    ${mot de passe}

Soumette Le Formulaire De Connexion
    Wait Until Element Is Visible    ${MODAL CONNEXION}
    Wait Until Element Is Enabled    ${BOUTON SE CONNECTER}
    Execute Javascript    document.querySelector('#modal-login button[type="submit"]').click()

