*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/pages/connexion_page.robot
Resource    ../resources/keywords/connexion_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Aller Sur La Page De Connexion
Test Teardown    Se Deconnecter Si Connecte
Test Template    Utilisateur Tente De Creer Un Compte



*** Test Cases ***                              EMAIL                PASSWORD 

TC-EXG-001-07 - Avec un email déjà utilisé        ${valid_email}       ${valid_password}  
TC-EXG-001-08 - Avec des champs vides        ${empty_email}       ${empty_password}  
TC-EXG-001-09 - Avec un email valide et mot de passe vide        ${valid_email}       ${empty_password}     
TC-EXG-001-10 - Avec un email vide et mot de passe valide        ${empty_email}       ${valid_password}
TC-EXG-001-11 - Avec un email non conforme et mot de passe valide        ${special_character_email}       ${valid_password}
