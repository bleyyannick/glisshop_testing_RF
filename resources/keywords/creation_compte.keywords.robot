*** Settings ***
Library       SeleniumLibrary
Resource      ../pages/creation_compte.robot

Documentation    Keyword metier de scenario de creation de compte.


*** Keywords ***

Utilisateur tente de creer un compte
    [Documentation]    Lance une tentative de creation de compte et verifie son impossibilite.
    [Arguments]    ${email}    ${password}
    Creer un compte    ${email}    ${password}
    Verifier creation de compte impossible