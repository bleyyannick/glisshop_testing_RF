*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/locators/commande_locators.robot

*** Keywords ***

# Selection de produits
Ajouter produit au panier
    [Arguments]    ${produit}
    [Documentation]    Ajoute un produit spécifique au panier


Ajouter plusieurs produits au panier
    [Arguments]    @{produits}
    [Documentation]    Ajoute plusieurs produits au panier
    

# Checkout
Proceder au paiement
    [Documentation]    Clique sur le bouton “Procéder au paiement”
   

Remplir adresse de livraison valide
    [Arguments]    ${adresse}
    [Documentation]    Remplit le formulaire avec une adresse valide
    

Remplir adresse de livraison invalide
    [Arguments]    ${adresse}
    [Documentation]    Remplit le formulaire avec une adresse invalide
    

Payer avec carte valide
    [Arguments]    ${carte}
    [Documentation]    Remplit les informations de carte et valide le paiement
    

# Assertions
Verifier nombre de produits dans le panier
    [Arguments]    ${nombre_attendu}
    [Documentation]    Vérifie que le nombre de produits dans le panier correspond à la valeur attendue

Verifier commande confirmee
    [Documentation]    Vérifie que la confirmation de commande est affichée

Verifier commande refusee
    [Documentation]    Vérifie que la commande n’a pas été acceptée

Verifier redirection vers connexion
    [Documentation]    Vérifie que la page de connexion ou de création de compte est affichée
   
Verifier message erreur adresse invalide
    [Documentation]    Vérifie qu’un message d’erreur est affiché pour une adresse invalide
