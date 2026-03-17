*** Settings ***
Documentation       Keyword metier de scenario de creation de compte.

Library             SeleniumLibrary
Resource            ../pages/creation_compte.robot


*** Keywords ***
Utilisateur tente de creer un compte
    [Documentation]    Lance une tentative de creation de compte et verifie son impossibilite.
    [Arguments]    ${email}    ${password}
    Creer un compte    ${email}    ${password}
    Verifier creation de compte impossible
