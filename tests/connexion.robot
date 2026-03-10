*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/connexion_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller sur glisshop
Suite Teardown   Fermer le navigateur
Test Setup       Aller sur la page de connexion
Test Teardown    Se deconnecter si connecte
Test Template    Utilisateur tente de se connecter


*** Test Cases ***                              EMAIL                PASSWORD              VERIFICATION

TC-EXG-001-01 - Identifiants valides            ${valid_email}       ${valid_password}     Verifier connexion reussie
TC-EXG-001-02 - Mot de passe incorrect          ${valid_email}       ${invalid_password}   Verifier message d'erreur de connexion
TC-EXG-001-03 - Email incorrect                 ${invalid_email}     ${valid_password}     Verifier message d'erreur de connexion
TC-EXG-001-04 - Champs vides                    ${empty_email}       ${empty_password}     Verifier que le bouton de connexion est desactive
TC-EXG-001-05 - Email valide et mot de passe vide        ${valid_email}       ${empty_password}     Verifier que le bouton de connexion est desactive
TC-EXG-001-06 - Email vide et mot de passe valide        ${empty_email}       ${valid_password}     Verifier que le bouton de connexion est desactive
