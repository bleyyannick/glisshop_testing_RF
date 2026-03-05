*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/creation_compte_locators.robot
Resource    ../../variables/global_variables.robot
Resource    connexion_page.robot


*** Keywords ***



Cliquer sur Nouveau Client
   Wait Until Element Is Visible       ${selecteur_input_create_email}     timeout=${default_timeout}
   Click Element      ${selecteur_input_create_email}


Confirmer Mot De Passe
    [Arguments]    ${password}
    Input Text    css=#rbs-user-create-account-confirm-password        ${password}

Creer Un Compte 
    [Arguments]    ${email}    ${password}
    Aller Sur La Page De Connexion
    Cliquer sur Nouveau Client
    Remplir Le Formulaire De Creation De Compte    ${email}    ${password} 

Remplir Le Formulaire De Creation De Compte
    [Arguments]    ${email}    ${password}
    Saisir Email        ${selecteur_input_create_email}      ${email}
    Saisir Mot De Passe    ${selecteur_input_create_password}      ${password}
    Confirmer Mot De Passe    ${password}

Verifier Creation de Compte Impossible
    Scroll Element Into View      ${xpath_bouton_creer_compte}
    Wait Until Element Is Visible    ${xpath_bouton_creer_compte}    timeout=${default_timeout}
    Wait Until Keyword Succeeds    3x    1s    Element Should Be Disabled    ${xpath_bouton_creer_compte}


Verifier Que Le Bouton De Connexion Est Desactive
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_login}


