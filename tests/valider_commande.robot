*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/pages/ski_page.robot
Resource   ../resources/keywords/common_keywords.robot
Resource   ../resources/locators/ajout_ski_locators.robot
Resource   ../resources/keywords/ajout_ski_keywords.robot
Resource   ../variables/global_variables.robot
Suite Setup       Aller sur glisshop
Suite Teardown    Fermer le navigateur
Test Setup        Aller sur glisshop
Test Teardown     Aller Vider le panier et se deconnecter




*** Test Cases ***

TC-EXG-002-02 Valider la commande d'un produit ajouté au panier en étant connecté
      [Tags]    smoke
      Se connecter    ${valid_email}    ${valid_password}
      Ouvrir le menu
      Accéder à une catégorie de produits    categorie=${menu_ski_rando}
      Acceder à une sous-catégorie de produits    sous_categorie=${menu_ski_rando_homme}
      Choisir un ski
      Choisir la taille du ski
      Ajouter le ski au panier
      Acceder au panier
      Valider la commande
      Creer une adresse de livraison
      Valider la livraison
      Procéder au paiement
     # Vérifier paiement réussi


# TC-EXG-002-03 Valider la commande d'un produit ajouté au panier en étant non connecté
#      [Tags]    smoke
#      Se deconnecter si connecte
#      Ouvrir le menu
#      Accéder à une catégorie de produits    categorie=${menu_ski_rando}
#      Acceder à une sous-catégorie de produits    sous_categorie=${menu_ski_rando_homme}
#      Choisir un ski
#      Choisir la taille du ski
#      Ajouter le ski au panier
#      Valider la commande
#      Verifier redirection vers page de connexion
    