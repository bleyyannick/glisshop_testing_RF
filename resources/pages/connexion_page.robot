*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/connexion_locators.robot
Resource    ../../variables/global_variables.robot
      

*** Keywords ***


Aller Sur Glisshop
    Open Browser    ${url_glisshop}    ${browser}
    Maximize Browser Window
    Fermer Le Bandeau Cookies
    
Fermer Le Navigateur
    Close Browser

Fermer Le Bandeau Cookies
    Wait Until Element Is Visible    css=button.onetrust-close-btn-handler    timeout=${default_timeout}
    Click Button    css=button.onetrust-close-btn-handler


Se Deconnecter Si Connecte  
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${is_visible}
        Se Deconnecter
    END

Se Deconnecter 
    Scroll Element Into View    ${xpath_bouton_deconnexion}  
    Click Element    ${xpath_bouton_deconnexion}

Saisir Email
    [Arguments]    ${selector}     ${email}
    Input Text    ${selector}    ${email}

Saisir Mot De Passe
    [Arguments]    ${selector}     ${password}
    Input Text    ${selector}    ${password}

Aller Sur La Page De Connexion
    Wait Until Element Is Enabled        css=[data-id="accountShort"] a[href*="creation-de-compte"]   timeout=${default_timeout}
    Click Element      css=[data-id="accountShort"] a[href*="creation-de-compte"]
    
Cliquer sur Déjà Client
   Wait Until Element Is Visible        xpath=//*[@id="content-column"]/div/div[1]/ul/li[2]    timeout=${default_timeout}
   Click Element      //*[@id="content-column"]/div/div[1]/ul/li[2]

Soumettre Le Formulaire De Connexion
    Click Button        ${xpath_bouton_login}

Remplir Le Formulaire De Connexion
    [Arguments]    ${email}    ${password}
    Saisir Email    ${selecteur_input_email}      ${email}    
    Saisir Mot De Passe    ${selecteur_input_password}      ${password}


Se Connecter Avec Les Identifiants
    [Arguments]    ${email}    ${password}
    Aller Sur La Page De Connexion
    Cliquer sur Déjà Client 
    Remplir Le Formulaire De Connexion    ${email}    ${password}
    Soumettre Le Formulaire De Connexion 

Verifier Connexion Reussie
    Wait Until Element Is Visible    ${xpath_title_client}    timeout=${default_timeout}    
    Element Should Contain    ${xpath_title_client}      ${msg_espace_client}

Verifier Message D'erreur De Connexion
    Wait Until Element Is Visible    css=.form-group p.text-danger    timeout=${default_timeout}
    Element Should Contain    css=.form-group p.text-danger    ${msg_erreur_connexion}
    
Verifier Que Le Bouton De Connexion Est Desactive
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_login}





