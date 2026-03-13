*** Settings ***
Library       SeleniumLibrary
Resource      ../keywords/common_keywords.robot

Documentation    Keyword metier de scenario de connexion.

*** Keywords ***


Utilisateur tente de se connecter
    [Documentation]    Execute une tentative de connexion puis le keyword de verification attendu.
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se connecter     ${email}    ${password}
    Run Keyword    ${verification_keyword}