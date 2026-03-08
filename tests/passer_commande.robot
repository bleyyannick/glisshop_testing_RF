*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/commande_keywords.robot
Resource   ../variables/global_variables.robot

Suite Setup       Aller sur glisshop
Suite Teardown    Fermer le navigateur
Test Setup        Aller sur la page d'accueil
Test Teardown     Vider le panier

    
*** Test Cases ***

#TC-EXG-002-01 Ajouter un produit au panier
   # Connexion utilisateur    email=${valid_email}    password=${valid_password}
   # Ajouter un produit   type=${type}    categorie=${categorie}    nom=${produit}
   # Verifier produit dans le panier    ${produit}

# TC-EXG-002-02 Commander produit adresse valide
#     Connexion utilisateur    email=${valid_email}    password=${valid_password}
#     Commander produit adresse valide
#     Verifier commande confirmee
#
# TC-EXG-002-03 Commander sans connexion
#     Commander produit sans connexion
#     Verifier redirection connexion
#     Verifier commande refusee
#
#
# TC-EXG-002-04 Commander plusieurs produits
#     Connexion utilisateur    email=${EMAIL}    password=${PASSWORD}
#     Commander plusieurs produits
#     Verifier commande confirmee
#
# TC-EXG-002-05 Commander avec adresse invalide
#     Connexion utilisateur    email=${EMAIL}    password=${PASSWORD}
#     Commander produit adresse invalide
#     Verifier message erreur adresse
#     Verifier commande refusee
