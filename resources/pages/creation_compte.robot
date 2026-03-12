*** Settings ***
Library    SeleniumLibrary
Resource    common_page.robot
Resource    ../locators/creation_compte_locators.robot
Resource    connexion_page.robot


*** Keywords ***

Cliquer sur nouveau client
   Wait Until Element Is Visible       ${selecteur_input_create_email}     timeout=${default_timeout}
   Click Element      ${selecteur_input_create_email}

Confirmer mot de passe
    [Arguments]    ${password}
    Saisir dans le champ    ${selecteur_input_create_confirm_password}    ${password}

Creer un compte
    [Arguments]    ${email}    ${password}
    Aller sur la page de connexion
    Cliquer sur nouveau client
    Remplir le formulaire de creation de compte    ${email}    ${password}

Remplir le formulaire de creation de compte
    [Arguments]    ${email}    ${password}
    Saisir dans le champ    ${selecteur_input_create_email}      ${email}
    Saisir dans le champ    ${selecteur_input_create_password}      ${password}
    Confirmer mot de passe    ${password}


# Assertions
Verifier creation de compte impossible
    Verifier que le bouton est desactive    ${xpath_bouton_creer_compte}


