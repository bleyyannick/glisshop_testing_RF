*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/connexion_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Aller Sur La Page De Connexion
Test Teardown    Se Deconnecter Si Connecte
Test Template    Utilisateur Tente De Se Connecter


*** Test Cases ***                              EMAIL                PASSWORD              VERIFICATION

TC-EXG-001-01 - Identifiants valides            ${valid_email}       ${valid_password}     Verifier Connexion Reussie
TC-EXG-001-02 - Mot de passe incorrect          ${valid_email}       ${invalid_password}   Verifier Message D'erreur De Connexion
TC-EXG-001-03 - Email incorrect                 ${invalid_email}     ${valid_password}     Verifier Message D'erreur De Connexion
TC-EXG-001-04 - Champs vides                    ${empty_email}       ${empty_password}     Verifier Que Le Bouton De Connexion Est Desactive
TC-EXG-001-05 - Email valide et mot de passe vide        ${valid_email}       ${empty_password}     Verifier Que Le Bouton De Connexion Est Desactive
TC-EXG-001-06 - Email vide et mot de passe valide        ${empty_email}       ${valid_password}     Verifier Que Le Bouton De Connexion Est Desactive
