*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/connexion_locators.robot
Resource    ../../variables/global_variables.robot
      

*** Keywords ***


Aller sur glisshop
    ${prefs}=    Create Dictionary
    ...    profile.default_content_setting_values.notifications=${2}
    ...    autofill.profile_enabled=${False}
    ...    autofill.address_enabled=${False}
    ${options}=    Evaluate
    ...    sys.modules['selenium.webdriver'].ChromeOptions()
    ...    sys, selenium.webdriver
    ${headless}=    Set Variable    --headless=new
    ${size}=    Set Variable    --window-size=1920,1080
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    ${size}
    Open Browser    ${url_glisshop}    ${browser}    options=${options}
    Fermer le bandeau cookies
    
Fermer le navigateur
    Close Browser

Fermer le bandeau cookies
    Wait Until Element Is Visible        ${selecteur_cookies}        timeout=${default_timeout}
    Click Button    ${selecteur_cookies}

Se deconnecter si connecte
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${is_visible}
        Se deconnecter
    END

Se deconnecter
    Scroll Element Into View    ${xpath_bouton_deconnexion}
    Click Element    ${xpath_bouton_deconnexion}

Saisir email
    [Arguments]    ${selector}     ${email}
    Input Text    ${selector}    ${email}

Saisir mot de passe
    [Arguments]    ${selector}     ${password}
    Input Text    ${selector}    ${password}

Aller sur la page de connexion
    Wait Until Element Is Visible        ${selecteur_lien_creation_compte}   ${default_timeout}
    Wait Until Element Is Enabled        ${selecteur_lien_creation_compte}   timeout=${default_timeout}
    Click Element      ${selecteur_lien_creation_compte}
    
Cliquer sur deja client
   Wait Until Element Is Visible        ${xpath_onglet_deja_client}    timeout=${default_timeout}
   Click Element      ${xpath_onglet_deja_client}

Soumettre le formulaire de connexion
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    ${default_timeout}
    Click Button        ${xpath_bouton_login}

Remplir le formulaire de connexion
    [Arguments]    ${email}    ${password}
    Saisir email    ${selecteur_input_email}      ${email}
    Saisir mot de passe    ${selecteur_input_password}      ${password}

Se connecter avec les identifiants
    [Arguments]    ${email}    ${password}
    Aller sur la page de connexion
    Cliquer sur deja client
    Remplir le formulaire de connexion    ${email}    ${password}
    Soumettre le formulaire de connexion


# Assertions
Verifier connexion reussie
    Wait Until Element Is Visible    ${xpath_title_client}    timeout=${default_timeout}
    Element Should Contain    ${xpath_title_client}      ${msg_espace_client}

Verifier message d'erreur de connexion
    Wait Until Element Is Visible    ${selecteur_message_erreur_connexion}    timeout=${default_timeout}
    Element Should Contain    ${selecteur_message_erreur_connexion}    ${msg_erreur_connexion}

Verifier que le bouton de connexion est desactive
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_login}





