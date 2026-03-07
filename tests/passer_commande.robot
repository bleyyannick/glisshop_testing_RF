*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/connexion_keywords.robot
Resource   ../resources/keywords/commande_keywords.robot
Resource   ../variables/global_variables.robot

Suite Setup       Aller sur glisshop
Suite Teardown    Fermer le navigateur
Test Setup        Aller sur la page d'accueil
Test Teardown     Vider le panier


*** Test Cases ***

TC-EXG-002-01 Ajouter plusieurs produits
    Connexion utilisateur
    Ajouter plusieurs produits
    Verifier nombre produits


TC-EXG-002-02 Commander produit valide
    Connexion utilisateur
    Commander produit valide
    Verifier commande confirmee


TC-EXG-002-03 Commander sans connexion
    Commander produit sans connexion
    Verifier redirection connexion
    Verifier commande refusee


TC-EXG-002-04 Commander plusieurs produits
    Connexion utilisateur
    Commander plusieurs produits
    Verifier commande confirmee


TC-EXG-002-05 Commander avec adresse invalide
    Connexion utilisateur
    Commander produit adresse invalide
    Verifier message erreur adresse
    Verifier commande refusee