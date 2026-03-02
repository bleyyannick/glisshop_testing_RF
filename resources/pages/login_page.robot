*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_EMAIL}       css=#block2-login
${INPUT_PASSWORD}    css=#block2-password

${BUTTON_LOGIN}     xpath=//button[contains(text(),"Connexion à mon compte")]
${TITLE_CLIENT}    xpath=//*[@id="content-top"]/div[2]/div/div/div/div[2]/div/div/h1        


*** Keywords ***
Saisir Email
    [Arguments]    ${email}
    Input Text    ${INPUT_EMAIL}    ${email}

Saisir Mot De Passe
    [Arguments]    ${password}
    Input Text    ${INPUT_PASSWORD}    ${password}

Se Connecter Avec Les Identifiants
    [Arguments]    ${email}    ${password}
    Click Element      xpath=//div/div[1]/div/div[4]/div[2]/div/div/a
    Click Element      //*[@id="content-column"]/div/div[1]/ul/li[2]/a
    Saisir Email        ${email}
    Saisir Mot De Passe    ${password}
    Click Button        ${BUTTON_LOGIN}


Verifier Connexion Reussie
    Wait Until Element Is Visible    ${TITLE_CLIENT}    timeout=5s
    Element Text Should Be    ${TITLE_CLIENT}      BIENVENUE DANS VOTRE ESPACE CLIENT