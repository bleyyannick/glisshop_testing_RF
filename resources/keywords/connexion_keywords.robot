*** Settings ***
Library       SeleniumLibrary
Resource      ../pages/connexion_page.robot

*** Keywords ***


Utilisateur tente de se connecter
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se connecter avec les identifiants    ${email}    ${password}
    Run Keyword    ${verification_keyword}