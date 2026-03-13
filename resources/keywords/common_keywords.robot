*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/common_page.robot

Documentation    Keywords metier partages pour connexion/deconnexion.


*** Keywords ***

Se deconnecter si connecte
    [Documentation]    Deconnecte l'utilisateur uniquement si le lien est visible.
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${is_visible}
        Se deconnecter
    END

Se connecter
    [Documentation]    Enchaine les etapes metier de connexion utilisateur.
    [Arguments]    ${email}    ${password}
    Aller sur la page de connexion
    Cliquer sur deja client
    Remplir le formulaire de connexion    ${email}    ${password}
    Soumettre le formulaire de connexion


Soumettre le formulaire de connexion
    [Documentation]    Soumet le formulaire de connexion.
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    ${default_timeout}
    Click Button        ${xpath_bouton_login}

Remplir le formulaire de connexion
    [Documentation]    Renseigne email et mot de passe du formulaire de connexion.
    [Arguments]    ${email}    ${password}
    Saisir dans le champ    ${selecteur_input_email}      ${email}
    Saisir dans le champ    ${selecteur_input_password}      ${password}


Verifier que le bouton de connexion est desactive
    [Documentation]    Assertion metier: bouton de connexion desactive.
    Verifier que le bouton est desactive    ${xpath_bouton_login}


# Assertions
Verifier connexion reussie
    [Documentation]    Assertion metier: l'espace client est affiche.
    Wait Until Element Is Visible    ${xpath_title_client}    timeout=${default_timeout}
    Element Should Contain    ${xpath_title_client}      ${msg_espace_client}

Verifier message d'erreur de connexion
    [Documentation]    Assertion metier: message d'erreur attendu affiche.
    Wait Until Element Is Visible    ${selecteur_message_erreur_connexion}    timeout=${default_timeout}
    Element Should Contain    ${selecteur_message_erreur_connexion}    ${msg_erreur_connexion}

Se deconnecter
    [Documentation]    Clique sur le bouton de deconnexion.
    Scroll Element Into View    ${xpath_bouton_deconnexion}
    Click Element    ${xpath_bouton_deconnexion}

Aller sur la page de connexion
    [Documentation]    Ouvre la page/zone de connexion depuis l'entete.
    Wait Until Element Is Visible    ${selecteur_lien_creation_compte}    ${default_timeout}
    Wait Until Element Is Enabled    ${selecteur_lien_creation_compte}    timeout=${default_timeout}
    Click Element    ${selecteur_lien_creation_compte}

Cliquer sur deja client
    [Documentation]    Selectionne l'onglet deja client du formulaire.
    Wait Until Element Is Visible    ${xpath_onglet_deja_client}    timeout=${default_timeout}
    Click Element    ${xpath_onglet_deja_client}

Verifier que le bouton est desactive
    [Documentation]    Assertion generique de bouton desactive.
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${default_timeout}
    Element Should Be Disabled    ${locator}
