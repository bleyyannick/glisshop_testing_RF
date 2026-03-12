*** Settings ***
Library       SeleniumLibrary
Resource      ../keywords/common_keywords.robot

*** Keywords ***


Utilisateur tente de se connecter
    [Arguments]    ${email}    ${password}    ${verification_keyword}
    Se connecter     ${email}    ${password}
    Run Keyword    ${verification_keyword}