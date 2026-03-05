*** Settings ***
Library       SeleniumLibrary
Resource      ../pages/connexion_page.robot

*** Keywords ***


Utilisateur Tente De Se Connecter
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se Connecter Avec Les Identifiants    ${email}    ${password}
    Run Keyword    ${verification_keyword}