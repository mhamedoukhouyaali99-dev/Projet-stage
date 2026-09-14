*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
La Page Devenir Un Hote Doit Presenter Le Parcours
    Ouvrir Le Navigateur Et Accéder A L'Application
    Go To    ${URL}/index.php/become-a-host/
    Wait Until Page Contains    Become a Host
    Page Should Contain    How To Become a Homey Host
    Page Should Contain    1. List Your Place
    Page Should Contain    2. Welcome Your Guests
    Page Should Contain    3. Earn Money

Le Formulaire Devenir Un Hote Doit Contenir Les Champs Requis
    Ouvrir Le Navigateur Et Accéder A L'Application
    Go To    ${URL}/index.php/become-a-host/
    Wait Until Element Is Visible    name=username
    Element Should Be Visible    name=useremail
    Element Should Be Visible    name=register_pass
    Element Should Be Visible    name=register_pass_retype
    Element Should Be Visible    name=term_condition
    Page Should Contain Link    termes et conditions

Le Formulaire Devenir Un Hote Doit Accepter Des Donnees Valides
    Ouvrir Le Navigateur Et Accéder A L'Application
    Go To    ${URL}/index.php/become-a-host/
    Wait Until Element Is Visible    name=username
    Input Text    name=username    robot_hote_test
    Input Text    name=useremail    robot.hote.test@example.com
    Input Text    name=register_pass    RobotHote123!
    Input Text    name=register_pass_retype    RobotHote123!
    Select Checkbox    name=term_condition
    Text Field Value Should Be    name=username    robot_hote_test
    Text Field Value Should Be    name=useremail    robot.hote.test@example.com
    Text Field Value Should Be    name=register_pass    RobotHote123!
    Text Field Value Should Be    name=register_pass_retype    RobotHote123!
    Checkbox Should Be Selected    name=term_condition

*** Keywords ***
Fermer Le Navigateur
    Close All Browsers