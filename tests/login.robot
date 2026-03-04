*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/keywords/auth_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Aller Sur La Page De Connexion
Test Teardown    Se Deconnecter Si Connecte
Test Template    Test De Connexion


*** Test Cases ***                              EMAIL                PASSWORD              VERIFICATION

TC-EXG-001-01 - Identifiants valides            ${VALID_EMAIL}       ${VALID_PASSWORD}     Verifier Connexion Reussie
TC-EXG-001-02 - Mot de passe incorrect          ${VALID_EMAIL}       ${INVALID_PASSWORD}   Verifier Message D'erreur De Connexion
TC-EXG-001-03 - Email incorrect                 ${INVALID_EMAIL}     ${VALID_PASSWORD}     Verifier Message D'erreur De Connexion
TC-EXG-001-04 - Champs vides                    ${EMPTY_EMAIL}       ${EMPTY_PASSWORD}     Verifier Que Le Bouton De Connexion Est Desactive
TC-EXG-001-05 - Email valide et mot de passe vide        ${VALID_EMAIL}       ${EMPTY_PASSWORD}     Verifier Que Le Bouton De Connexion Est Desactive
TC-EXG-001-06 - Email vide et mot de passe valide        ${EMPTY_EMAIL}       ${VALID_PASSWORD}     Verifier Que Le Bouton De Connexion Est Desactive

