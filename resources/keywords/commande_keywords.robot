*** Keywords ***

# Panier
Ajouter un produit
    [Arguments]    ${produit}
    Ajouter produit au panier    ${produit}
    Verifier nombre de produits dans le panier    1    

Ajouter plusieurs produits
    [Arguments]    @{produits}
    Ajouter plusieurs produits au panier    @{produits}
    Verifier nombre de produits dans le panier    ${len(@{produits})}

# Commandes
Commande produit
    [Arguments]    ${produit}    ${adresse}    ${carte}
    Ajouter un produit    ${produit}
    Proceder au paiement
    Remplir adresse de livraison valide    ${adresse}
    Payer avec carte valide    ${carte}
    Verifier commande confirmee

Commande plusieurs produits
    [Arguments]    @{produits}    ${adresse}    ${carte}
    Ajouter plusieurs produits    @{produits}
    Proceder au paiement
    Remplir adresse de livraison valide    ${adresse}
    Payer avec carte valide    ${carte}
    Verifier commande confirmee

Commande produit adresse invalide
    [Arguments]    ${produit}    ${adresse}    ${carte}
    Ajouter un produit    ${produit}
    Proceder au paiement
    Remplir adresse de livraison invalide    ${adresse}
    Payer avec carte valide    ${carte}
    Verifier message erreur adresse invalide

Commande sans connexion
    [Arguments]    ${produit}
    Ajouter un produit    ${produit}
    Proceder au paiement
    Verifier redirection vers connexion