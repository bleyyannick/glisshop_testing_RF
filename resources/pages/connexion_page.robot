*** Settings ***
Library    SeleniumLibrary
Resource    common_page.robot
Resource    ../keywords/common_keywords.robot

      

*** Keywords ***


Soumettre le formulaire de connexion
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    ${default_timeout}
    Click Button        ${xpath_bouton_login}

Remplir le formulaire de connexion
    [Arguments]    ${email}    ${password}
    Saisir dans le champ    ${selecteur_input_email}      ${email}
    Saisir dans le champ    ${selecteur_input_password}      ${password}



Verifier que le bouton de connexion est desactive
    Verifier que le bouton est desactive    ${xpath_bouton_login}

# Assertions
Verifier connexion reussie
    Wait Until Element Is Visible    ${xpath_title_client}    timeout=${default_timeout}
    Element Should Contain    ${xpath_title_client}      ${msg_espace_client}

Verifier message d'erreur de connexion
    Wait Until Element Is Visible    ${selecteur_message_erreur_connexion}    timeout=${default_timeout}
    Element Should Contain    ${selecteur_message_erreur_connexion}    ${msg_erreur_connexion}





