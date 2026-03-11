*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/creation_compte_locators.robot
Resource    ../../variables/global_variables.robot
Resource    connexion_page.robot


*** Keywords ***



Cliquer sur nouveau client
   Wait Until Element Is Visible       ${selecteur_input_create_email}     timeout=${default_timeout}
   Click Element      ${selecteur_input_create_email}


Confirmer mot de passe
    [Arguments]    ${password}
    Input Text    css=#rbs-user-create-account-confirm-password        ${password}

Creer un compte
    [Arguments]    ${email}    ${password}
    Aller sur la page de connexion
    Cliquer sur nouveau client
    Remplir le formulaire de creation de compte    ${email}    ${password}

Remplir le formulaire de creation de compte
    [Arguments]    ${email}    ${password}
    Saisir email        ${selecteur_input_create_email}      ${email}
    Saisir mot de passe    ${selecteur_input_create_password}      ${password}
    Confirmer mot de passe    ${password}


# Assertions
Verifier creation de compte impossible
    Scroll Element Into View      ${xpath_bouton_creer_compte}
    Wait Until Element Is Visible    ${xpath_bouton_creer_compte}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_creer_compte}


Verifier que le bouton de connexion est desactive
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_login}


