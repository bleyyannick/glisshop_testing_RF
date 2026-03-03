*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/keywords/auth_keywords.robot

Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Teardown      Se Deconnecter Si Connecte




*** Test Cases ***
TC-EXG-001-01 - Se connecter avec des identifiants valides
    Se Connecter Avec Un Utilisateur Valide
    Verifier Connexion Reussie

TC-EXG-001-02 - Se connecter avec un mot de passe incorrect
    Se Connecter Avec Un Utilisateur Invalide
    Verifier Message D'erreur De Connexion

    
