*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/common_page.robot
Resource   ../locators/ajout_ski_locators.robot

Documentation    Keywords metier du parcours ajout au panier, livraison et paiement.

*** Keywords ***

Ouvrir le menu
    [Documentation]    Ouvre le menu principal apres disparition du chargement initial.
    Wait Until Element Is Not Visible    ${modal_chargement}     ${default_timeout}   
    Cliquer element    ${menu_principal}

Acceder à une sous-catégorie de produits
    [Documentation]    Cliquer sur la sous-catégorie affichée sur le menu
    [Arguments]    ${sous_categorie}
    Survol element     ${sous_categorie}    
    Cliquer element    ${sous_categorie}

Accéder à une catégorie de produits
    [Documentation]    Cliquer sur la catégorie affichée sur le menu
    [Arguments]    ${categorie}
    Survol element     ${categorie}

Acceder au panier
    [Documentation]    Accede au panier depuis la modale d'ajout.
    Cliquer element               ${bouton_voir_panier}

Choisir un ski
    [Documentation]    Selectionne un produit ski sur la liste.
    Scroller vers element    ${produit_ski}
    Cliquer element          ${produit_ski}

Choisir la taille du ski
    [Documentation]    Selectionne la taille du ski avant ajout panier.
    Cliquer element    ${taille_ski}

Ajouter le ski au panier
    [Documentation]    Ajoute le produit configure au panier.
    Cliquer element    ${bouton_ajouter_panier}

Continuer les achats
    Cliquer element    ${bouton_continuer_achats}

Accepter les conditions
    [Documentation]    Coche les CGV avant validation de commande.
    Checker element    ${checkbox_conditions_vente}    ${ng_class_checkbox_conditions_vente}

Creer une adresse de livraison
    [Documentation]    Renseigne et valide une adresse de livraison complete.
    Attendre element visible    ${bouton_creer_adresse}    
    Cliquer element    ${bouton_creer_adresse}
    Attendre element visible    ${bouton_dropdown_pays}
    Cliquer element    ${bouton_dropdown_pays}
    Attendre element visible    ${options_pays}
    Cliquer element    ${options_pays}
    Execute Javascript    ${script_option_pays}
    #  données utilisateurs fictives pour test à variabiliser !
    Remplir champ    ${input_nom}               Dupont
    Remplir champ    ${input_prenom}            Jean
    Scroller vers element    ${input_numero_adresse}
    Remplir champ    ${input_numero_adresse}    23
    Scroller vers element    ${input_rue}
    Remplir champ    ${input_rue}               Avenue Beau Soleil
    Scroller vers element    ${input_code_postal}
    Attendre element cliquable    ${input_code_postal}
    Remplir champ    ${input_code_postal}      75017
    Scroller vers element    ${input_ville}
    Attendre element cliquable    ${input_ville}
    Remplir champ    ${input_ville}             Paris
    Scroller vers element    ${input_telephone}
    Remplir champ    ${input_telephone}         0601020304
    Scroller vers element    ${bouton_valide_coordonnes}
    Cliquer element    ${bouton_valide_coordonnes}

Valider la commande
    [Documentation]    Valide l'etape commande apres acceptation des conditions.
    Accepter les conditions
    Cliquer element    ${bouton_valide_commande}

Valider la livraison
    [Documentation]    Valide l'etape livraison.
    Attendre element cliquable    ${bouton_valide_livraison}
    Scroller vers element         ${bouton_valide_livraison}
    Cliquer element               ${bouton_valide_livraison}
    
Verifier paiement réussi
    [Documentation]    Verifie la presence du bouton de paiement en fin de parcours.
    Attendre element cliquable   ${bouton_paiement}
    Element Should Be Visible    ${bouton_paiement}

Verifier que le panier contient un produit
    [Documentation]    Assertion: verifie la presence du badge panier.
    Verifier element visible    ${badge_panier}

Aller vider le panier
    [Documentation]    Vide le panier en gerant le bandeau de verrouillage si present.
    Go To    ${url_panier}
    Attendre element visible    ${header_mon_panier}
    ${bandeau_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${bandeau_panier_cliquez_ici}
    IF    ${bandeau_visible}
        Cliquer element    ${bandeau_panier_cliquez_ici}
    END
    Attendre element cliquable    ${bouton_supprimer_produit_panier}
    Cliquer element    ${bouton_supprimer_produit_panier}
    Attendre element visible    ${header_panier_vide}
    Element Should Be Visible    ${header_panier_vide}


Aller se deconnecter
    [Documentation]    Navigue vers le compte puis declenche la deconnexion.
    Go To    ${url_infos}
    Attendre element visible    ${xpath_bouton_deconnexion}
    Cliquer element    ${xpath_bouton_deconnexion}

Aller vider le panier et se deconnecter
    [Documentation]    Nettoyage de fin de test: panier vide puis deconnexion.
    Aller vider le panier
    Aller se deconnecter


Remplir le champ de paiement
    [Documentation]    Saisit une donnee de paiement dans l'iframe active puis en sort.
    [Arguments]  ${input_paiement}     ${donnees_paiement}   
     Cliquer element    ${input_paiement}
     Remplir champ    ${input_paiement}    ${donnees_paiement}
     Sortir de l'iframe


Remplir les informations de paiement
    [Documentation]    Renseigne carte, expiration, cryptogramme et nom du payeur.
    Attendre element cliquable   ${iframe_carte}
    Attendre element cliquable   ${iframe_expiration}
    Attendre element cliquable   ${iframe_cryptogramme}
    
    Aller sur l'iframe    ${iframe_carte}
    Remplir le champ de paiement    ${input_numero_carte}    ${donnees_paiement}

    Aller sur l'iframe    ${iframe_expiration}
    Remplir le champ de paiement    ${input_date_expiration}    ${donnees_date_expiration}

    Aller sur l'iframe    ${iframe_cryptogramme}
    Remplir le champ de paiement    ${input_cryptogramme}    ${donnees_cryptogramme}
    Remplir le champ de paiement    ${bouton_input_payeur}    ${donnees_nom_payeur}

Procéder au paiement
    [Documentation]    Etape metier de saisie des informations de paiement.
    Remplir les informations de paiement