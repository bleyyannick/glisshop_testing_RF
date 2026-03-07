*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/creation_compte.keywords.robot
Resource    ../resources/keywords/connexion_keywords.robot
Resource    ../variables/global_variables.robot

Suite Setup      Aller sur glisshop
Suite Teardown   Fermer le navigateur
Test Setup       Aller sur la page de connexion
Test Teardown    Se deconnecter si connecte
Test Template    Utilisateur tente de creer un compte



*** Test Cases ***                              EMAIL                PASSWORD 

TC-EXG-001-07 - Avec un email déjà utilisé        ${valid_email}       ${valid_password}  
TC-EXG-001-08 - Avec des champs vides        ${empty_email}       ${empty_password}  
TC-EXG-001-09 - Avec un email valide et mot de passe vide        ${valid_email}       ${empty_password}     
TC-EXG-001-10 - Avec un email vide et mot de passe valide        ${empty_email}       ${valid_password}
TC-EXG-001-11 - Avec un email non conforme et mot de passe valide        ${special_character_email}       ${valid_password}
