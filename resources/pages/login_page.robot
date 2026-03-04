*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/global_variables.robot

*** Variables ***
${INPUT_EMAIL}       css=#block2-login
${INPUT_PASSWORD}    css=#block2-password

${INPUT_CREATE_EMAIL}    css=#rbs-user-create-account-email   
${INPUT_CREATE_PASSWORD}    css=#rbs-user-create-account-password

${BOUTON_LOGIN}     xpath=//button[contains(text(),"Connexion à mon compte")]
${BOUTON_DECONNEXION}    xpath=//a[contains(text(),"Déconnexion")] 
${BOUTON_CREER_COMPTE}        xpath=//button[contains(text(),"Créer mon compte")]
${TITLE_CLIENT}    css=.page-description h1

${MSG_ESPACE_CLIENT}    BIENVENUE DANS VOTRE ESPACE CLIENT   
${MSG_ERREUR_CONNEXION}    L'identifiant et le mot de passe ne correspondent pas

${EMPTY_EMAIL}                 
${EMPTY_PASSWORD}
${SPECIAL_CHARACTER_EMAIL}      !@#$%^&*()_+=-{}[]|:;'<>,.?/`~"       

*** Keywords ***

Se Deconnecter Si Connecte
    ${est_connecte}=    Run Keyword And Return Status    
    ...  Element Should Be Visible    ${BOUTON_DECONNEXION}
    IF    ${est_connecte}
        Se Deconnecter
    ELSE
        RETURN
    END

Se Deconnecter 
    Scroll Element Into View    ${BOUTON_DECONNEXION}  
    Click Element    ${BOUTON_DECONNEXION}

Saisir Email
    [Arguments]    ${selector}     ${email}
    Input Text    ${selector}    ${email}

Saisir Mot De Passe
    [Arguments]    ${selector}     ${password}
    Input Text    ${selector}    ${password}

Aller Sur La Page De Connexion
    Click Element      css=[data-id="accountShort"]>a[href="https://www.glisshop.com/glisshop/creation-de-compte.html"]
    
Cliquer sur Déjà Client
   Wait Until Element Is Visible        xpath=//*[@id="content-column"]/div/div[1]/ul/li[2]    timeout=${DEFAULT_TIMEOUT}
   Click Element      //*[@id="content-column"]/div/div[1]/ul/li[2]

Cliquer sur Nouveau Client
   Wait Until Element Is Visible       css=#rbs-user-create-account-email     timeout=${DEFAULT_TIMEOUT}
   Click Element      css=#rbs-user-create-account-email

Soumettre Le Formulaire De Connexion
    Click Button        ${BOUTON_LOGIN}

Remplir Le Formulaire De Connexion
    [Arguments]    ${email}    ${password}
    Saisir Email    ${INPUT_EMAIL}      ${email}    
    Saisir Mot De Passe    ${INPUT_PASSWORD}      ${password}

Confirmer Mot De Passe
    [Arguments]    ${password}
    Input Text    css=#rbs-user-create-account-confirm-password        ${password}

Remplir Le Formulaire De Creation De Compte
    [Arguments]    ${email}    ${password}
    Saisir Email        ${INPUT_CREATE_EMAIL}      ${email}
    Saisir Mot De Passe    ${INPUT_CREATE_PASSWORD}      ${password}
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
    Wait Until Element Is Visible    ${TITLE_CLIENT}    timeout=${DEFAULT_TIMEOUT}    
    Element Should Contain    ${TITLE_CLIENT}      ${MSG_ESPACE_CLIENT}

Verifier Message D'erreur De Connexion
    Wait Until Element Is Visible    css=.form-group p.text-danger    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    css=.form-group p.text-danger    ${MSG_ERREUR_CONNEXION}

Verifier Creation de Compte Impossible
    Scroll Element Into View      ${BOUTON_CREER_COMPTE}
    Wait Until Element Is Visible    ${BOUTON_CREER_COMPTE}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Keyword Succeeds    5x    1s    Element Should Be Disabled    ${BOUTON_CREER_COMPTE}

Verifier Que Le Bouton De Connexion Est Desactive
    Element Should Be Disabled    ${BOUTON_LOGIN}

Test De Connexion
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se Connecter Avec Les Identifiants    ${email}    ${password}
    Run Keyword    ${verification_keyword}

Test De Creation De Compte
    [Arguments]    ${email}    ${password}    
    Creer Un Compte    ${email}    ${password}
    Verifier Creation de Compte Impossible


