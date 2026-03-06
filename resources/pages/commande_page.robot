```robotframework
*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/commande_keywords.robot
Resource    ../variables/global_variables.robot


Suite Setup      Aller Sur Glisshop
Suite Teardown   Fermer Le Navigateur
Test Setup       Aller Sur La Page De Connexion
Test Teardown    Se Deconnecter Si Connecte



*** Test Cases ***

TC-EXG-002-01 - Sélectionner un produit et l'ajouter au panier
    Se Connecter Avec Des Identifiants Valides
    Selectionner Une Categorie De Produit
    Ajouter Un Produit Au Panier
    Verifier Le Panier Contient Le Produit Ajoute

TC-EXG-002-02 - Commander un produit
    Se Connecter Avec Des Identifiants Valides
    Selectionner Une Categorie De Produit
    Ajouter Un Produit Au Panier
    Passer A La Caisse
    Verifier Que La Commande Est Confirmee


TC-EXG-002-03 - Commander plusieurs produits de différentes catégories
    Se Connecter Avec Des Identifiants Valides
    Selectionner Une Categorie De Produit
    Ajouter Un Produit Au Panier
    Selectionner Une Autre Categorie De Produit
    Ajouter Un Autre Produit Au Panier
    Passer A La Caisse
    Verifier Que Le Total De La Commande Est Correct
    Verifier Que La Commande Est Confirmee
    
TC-EXG-002-04 - Commander un produit sans être connecté
    Selectionner Une Categorie De Produit
    Ajouter Un Produit Au Panier
    Passer A La Caisse
    Verifier Que L'utilisateur Est Redirige Vers La Page De Connexion

TC-EXG-002-05 - Commander un produit avec une adresse de livraison invalide
    Se Connecter Avec Des Identifiants Valides
    Ajouter Plusieurs Produits Au Panier
    Remplir Les Informations De Livraison Avec Une Adresse Invalide
    Verifier Qu'Un Message D'erreur Est Affiche Indiquant Que L'adresse Est Invalide