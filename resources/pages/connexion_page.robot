*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/global_variables.robot

*** Variables ***
${selecteur_input_email}       css=#block2-login
${selecteur_input_password}    css=#block2-password
${selecteur_input_create_email}    css=#rbs-user-create-account-email   
${selecteur_input_create_password}    css=#rbs-user-create-account-password

${xpath_bouton_login}     xpath=//button[contains(text(),"Connexion à mon compte")]
${xpath_bouton_deconnexion}    xpath=//a[contains(text(),"Déconnexion")] 
${xpath_bouton_creer_compte}        xpath=//button[contains(text(),"Créer mon compte")]
${xpath_title_client}    css=.page-description h1

${msg_espace_client}    BIENVENUE DANS VOTRE ESPACE CLIENT   
${msg_erreur_connexion}    L'identifiant et le mot de passe ne correspondent pas

${empty_email}                 
${empty_password}
${special_character_email}      !@#$%^&*()_+=-{}[]|:@;'<>,.?/`~"       

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
    ${est_connecte}=    Run Keyword And Return Status    
    ...  Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${est_connecte}
        Se Deconnecter
    ELSE
        RETURN
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

Cliquer sur Nouveau Client
   Wait Until Element Is Visible       css=#rbs-user-create-account-email     timeout=${default_timeout}
   Click Element      css=#rbs-user-create-account-email

Soumettre Le Formulaire De Connexion
    Click Button        ${xpath_bouton_login}

Remplir Le Formulaire De Connexion
    [Arguments]    ${email}    ${password}
    Saisir Email    ${selecteur_input_email}      ${email}    
    Saisir Mot De Passe    ${selecteur_input_password}      ${password}

Confirmer Mot De Passe
    [Arguments]    ${password}
    Input Text    css=#rbs-user-create-account-confirm-password        ${password}

Remplir Le Formulaire De Creation De Compte
    [Arguments]    ${email}    ${password}
    Saisir Email        ${selecteur_input_create_email}      ${email}
    Saisir Mot De Passe    ${selecteur_input_create_password}      ${password}
    Confirmer Mot De Passe    ${password}

Se Connecter Avec Les Identifiants
    [Arguments]    ${email}    ${password}
    Aller Sur La Page De Connexion
    Cliquer sur Déjà Client 
    Remplir Le Formulaire De Connexion    ${email}    ${password}
    Soumettre Le Formulaire De Connexion 

Creer Un Compte 
    [Arguments]    ${email}    ${password}
    Aller Sur La Page De Connexion
    Cliquer sur Nouveau Client
    Remplir Le Formulaire De Creation De Compte    ${email}    ${password} 

Verifier Connexion Reussie
    Wait Until Element Is Visible    ${xpath_title_client}    timeout=${default_timeout}    
    Element Should Contain    ${xpath_title_client}      ${msg_espace_client}

Verifier Message D'erreur De Connexion
    Wait Until Element Is Visible    css=.form-group p.text-danger    timeout=${default_timeout}
    Element Should Contain    css=.form-group p.text-danger    ${msg_erreur_connexion}

Verifier Creation de Compte Impossible
    Scroll Element Into View      ${xpath_bouton_creer_compte}
    Wait Until Element Is Visible    ${xpath_bouton_creer_compte}    timeout=${default_timeout}
    Wait Until Keyword Succeeds    3x    1s    Element Should Be Disabled    ${xpath_bouton_creer_compte}

Verifier Que Le Bouton De Connexion Est Desactive
    Scroll Element Into View      ${xpath_bouton_login}
    Wait Until Element Is Visible    ${xpath_bouton_login}    timeout=${default_timeout}
    Element Should Be Disabled    ${xpath_bouton_login}

Test De Connexion
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se Connecter Avec Les Identifiants    ${email}    ${password}
    Run Keyword    ${verification_keyword}

Test De Creation De Compte
    [Arguments]    ${email}    ${password}    
    Creer Un Compte    ${email}    ${password}
    Verifier Creation de Compte Impossible


