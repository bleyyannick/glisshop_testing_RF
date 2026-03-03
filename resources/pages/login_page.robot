*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/global_variables.robot

*** Variables ***
${INPUT_EMAIL}       css=#block2-login
${INPUT_PASSWORD}    css=#block2-password

${BOUTON_LOGIN}     xpath=//button[contains(text(),"Connexion à mon compte")]
${BOUTON_DECONNEXION}    xpath=//a[contains(text(),"Déconnexion")]  
${TITLE_CLIENT}    xpath=//*[@id="content-top"]/div[2]/div/div/div/div[2]/div/div/h1 

${EMPTY_EMAIL}
${EMPTY_PASSWORD}


*** Keywords ***

Se Deconnecter Si Connecte
    ${est_connecte}=    Run Keyword And Return Status    
    ...  Element Should Be Visible    ${BOUTON_DECONNEXION}
    IF    ${est_connecte}
        Se Deconnecter
    END

Se Deconnecter 
    Scroll Element Into View    ${BOUTON_DECONNEXION}  
    Click Element    ${BOUTON_DECONNEXION}
    

Saisir Email
    [Arguments]    ${email}
    Input Text    ${INPUT_EMAIL}    ${email}

Saisir Mot De Passe
    [Arguments]    ${password}
    Input Text    ${INPUT_PASSWORD}    ${password}

Aller Sur La Page De Connexion
    Click Element      xpath=//div/div[1]/div/div[4]/div[2]/div/div/a
    
Cliquer sur le lien "Déjà Client ?"
   Wait Until Element Is Visible        xpath=//*[@id="content-column"]/div/div[1]/ul/li[2]    timeout=10s
    Click Element      //*[@id="content-column"]/div/div[1]/ul/li[2]

Soumettre Le Formulaire De Connexion
    Click Button        ${BOUTON_LOGIN}

Remplir Le Formulaire De Connexion
    [Arguments]    ${email}    ${password}
    Saisir Email        ${email}
    Saisir Mot De Passe    ${password}


Se Connecter Avec Les Identifiants
    [Arguments]    ${email}    ${password}
    Aller Sur La Page De Connexion
    Cliquer sur le lien "Déjà Client ?"
    Remplir Le Formulaire De Connexion    ${email}    ${password}
    Soumettre Le Formulaire De Connexion    

Se Connecter Avec Un Utilisateur Valide
    Se Connecter Avec Les Identifiants    ${VALID_EMAIL}    ${VALID_PASSWORD}

Se Connecter Avec Un Utilisateur Invalide
    Se Connecter Avec Les Identifiants    ${VALID_EMAIL}    ${INVALID_PASSWORD}


Verifier Connexion Reussie
    Wait Until Element Is Visible    ${TITLE_CLIENT}    timeout=10s
    Element Should Contain    ${TITLE_CLIENT}      BIENVENUE DANS VOTRE ESPACE CLIENT

Verifier Message D'erreur De Connexion
    Wait Until Element Is Visible    css=.form-group p.text-danger    timeout=10s
    Element Should Contain    css=.form-group p.text-danger    L'identifiant et le mot de passe ne correspondent pas


    


