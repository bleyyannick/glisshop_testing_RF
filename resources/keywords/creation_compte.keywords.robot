*** Settings ***
Library       SeleniumLibrary
Resource      ../pages/creation_compte.robot


*** Keywords ***

Utilisateur Tente De Creer Un Compte
    [Arguments]    ${email}    ${password}    
    Creer Un Compte    ${email}    ${password}
    Verifier Creation de Compte Impossible