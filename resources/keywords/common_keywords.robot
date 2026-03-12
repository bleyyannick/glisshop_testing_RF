*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/common_page.robot


*** Keywords ***

Se deconnecter si connecte
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${is_visible}
        Se deconnecter
    END

Se connecter
    [Arguments]    ${email}    ${password}
    Aller sur la page de connexion
    Cliquer sur deja client
    Remplir le formulaire de connexion    ${email}    ${password}
    Soumettre le formulaire de connexion


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

Se deconnecter
    Scroll Element Into View    ${xpath_bouton_deconnexion}
    Click Element    ${xpath_bouton_deconnexion}

Aller sur la page de connexion
    Wait Until Element Is Visible    ${selecteur_lien_creation_compte}    ${default_timeout}
    Wait Until Element Is Enabled    ${selecteur_lien_creation_compte}    timeout=${default_timeout}
    Click Element    ${selecteur_lien_creation_compte}

Cliquer sur deja client
    Wait Until Element Is Visible    ${xpath_onglet_deja_client}    timeout=${default_timeout}
    Click Element    ${xpath_onglet_deja_client}

Verifier que le bouton est desactive
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${default_timeout}
    Element Should Be Disabled    ${locator}
