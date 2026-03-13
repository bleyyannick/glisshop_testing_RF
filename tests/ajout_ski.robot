*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/common_keywords.robot
Resource   ../resources/locators/ajout_ski_locators.robot
Resource   ../resources/keywords/ajout_ski_keywords.robot
Resource   ../variables/global_variables.robot
Suite Setup       Aller sur glisshop
Suite Teardown    Fermer le navigateur
Test Setup        Se connecter    ${valid_email}    ${valid_password}
Test Teardown     Aller vider le panier et se deconnecter




*** Test Cases ***

TC-EXG-002-01 Ajouter une paire de ski au panier
      [Tags]    smoke
      Ouvrir le menu
      Accéder à une catégorie de produits    categorie=${menu_ski_rando}
      Acceder à une sous-catégorie de produits    sous_categorie=${menu_ski_rando_homme}
      Choisir un ski
      Choisir la taille du ski
      Ajouter le ski au panier
      Continuer les achats
      Verifier que le panier contient un produit

     
    