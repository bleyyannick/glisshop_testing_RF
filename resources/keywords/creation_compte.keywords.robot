*** Settings ***
Library       SeleniumLibrary
Resource      ../pages/creation_compte.robot


*** Keywords ***

Utilisateur tente de creer un compte
    [Arguments]    ${email}    ${password}
    Creer un compte    ${email}    ${password}
    Verifier creation de compte impossible