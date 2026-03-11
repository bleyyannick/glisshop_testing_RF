*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/pages/ski_page.robot
Resource   ../resources/keywords/connexion_keywords.robot
Resource   ../resources/locators/ajout_ski_locators.robot
Resource   ../resources/keywords/ajout_ski_keywords.robot
Resource   ../variables/global_variables.robot
Suite Setup       Aller sur glisshop
Suite Teardown    Fermer le navigateur
Test Setup        Se connecter avec les identifiants    ${valid_email}    ${valid_password}
Test Teardown     Aller Vider le panier et se deconnecter




*** Test Cases ***

TC-EXG-002-02 Valider la commande d'un produit ajouté au panier
      Ouvrir le menu
      Acceder aux skis de rando homme
      Choisir un ski
      Choisir la taille du ski
      Ajouter le ski au panier
      Acceder au panier
      Valider la commande
      Creer une adresse de livraison
      Valider la livraison
      Procéder au paiement
    