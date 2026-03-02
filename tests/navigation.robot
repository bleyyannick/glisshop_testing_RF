*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/keywords/auth.keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Ouvrir Le Navigateur Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Fermer Le Bandeau Cookies



*** Test Cases ***
TC-EXG-001-01 Créer un compte avec des données valides
    Se Connecter Avec Les Identifiants           ${VALID_EMAIL}    ${VALID_PASSWORD}
    Verifier Connexion Reussie

    
