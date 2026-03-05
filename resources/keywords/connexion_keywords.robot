*** Settings ***
Library       SeleniumLibrary
Resource      ../resources/pages/connexion_page.robot
Resource      ../variables/global_variables.robot

*** Keywords ***


Utilisateur Tente De Se Connecter
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se Connecter Avec Les Identifiants    ${email}    ${password}
    Run Keyword    ${verification_keyword}

Utilisateur Tente De Creer Un Compte
    [Arguments]    ${email}    ${password}    
    Creer Un Compte    ${email}    ${password}
    Verifier Creation de Compte Impossible