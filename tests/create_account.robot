*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/keywords/auth_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Aller Sur La Page De Connexion
Test Teardown    Se Deconnecter Si Connecte
Test Template    Test De Creation De Compte



*** Test Cases ***                              EMAIL                PASSWORD 

TC-EXG-001-07 - Avec un email déjà utilisé        ${VALID_EMAIL}       ${VALID_PASSWORD}  
TC-EXG-001-08 - Avec des champs vides        ${EMPTY_EMAIL}       ${EMPTY_PASSWORD}  
TC-EXG-001-09 - Avec un email valide et mot de passe vide        ${VALID_EMAIL}       ${EMPTY_PASSWORD}     
TC-EXG-001-10 - Avec un email vide et mot de passe valide        ${EMPTY_EMAIL}       ${VALID_PASSWORD}
TC-EXG-001-11 - Avec un email non conforme et mot de passe valide        ${SPECIAL_CHARACTER_EMAIL}       ${VALID_PASSWORD}
