*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/ski_page.robot
Resource   ../locators/ajout_ski_locators.robot

*** Keywords ***

Ouvrir le menu
    Wait Until Element Is Not Visible    ${modal_chargement}    timeout=10s
    Cliquer element    ${menu_principal}

Acceder aux skis de rando homme
    Survol element     ${menu_ski_rando}    
    Cliquer element    ${menu_ski_rando_homme}

Acceder au panier
    Cliquer element               ${bouton_voir_panier}

Choisir un ski
    Scroller vers element    ${produit_ski}
    Cliquer element          ${produit_ski}

Choisir la taille du ski
    Cliquer element    ${taille_ski}

Ajouter le ski au panier
    Cliquer element    ${bouton_ajouter_panier}

Continuer les achats
    Cliquer element    ${bouton_continuer_achats}

Accepter Les Conditions
    Checker element    ${checkbox_conditions_vente}    ${ng_class_checkbox_conditions_vente}

Creer une adresse de livraison
    Attendre element visible    ${bouton_creer_adresse}    
    Cliquer element    ${bouton_creer_adresse}
    Attendre element visible    ${bouton_dropdown_pays}
    Cliquer element    ${bouton_dropdown_pays}
    Attendre element visible    ${options_pays}
    Cliquer element    ${options_pays}
    Execute Javascript    ${script_option_pays}
    
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
    Accepter Les Conditions
    Cliquer element    ${bouton_valide_commande}

Valider la livraison
    Attendre element cliquable    ${bouton_valide_livraison}
    Scroller vers element         ${bouton_valide_livraison}
    Cliquer element               ${bouton_valide_livraison}
    

Verifier que le panier contient un produit
    Verifier element visible    ${badge_panier}

Aller vider le panier
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
    Go To    ${url_infos}
    Attendre element visible    ${xpath_bouton_deconnexion}
    Cliquer element    ${xpath_bouton_deconnexion}

Aller Vider le panier et se deconnecter
    Aller vider le panier
    Aller se deconnecter

Attendre iframe et switcher
    Attendre element visible   ${iframe_carte}
    Attendre element visible   ${iframe_expiration}
    Attendre element visible   ${iframe_cryptogramme}
    
    Attendre element cliquable    ${iframe_carte}
    Select Frame    ${iframe_carte}
    Cliquer element    ${input_numero_carte}
    Remplir champ    ${input_numero_carte}    4111 1111 1111 1111
    Unselect Frame

    Attendre element cliquable   ${iframe_expiration}
    Select Frame    ${iframe_expiration}
    Cliquer element    ${input_date_expiration}
    Remplir champ    ${input_date_expiration}    12/29
    Unselect Frame

    Attendre element cliquable   ${iframe_cryptogramme}
    Select Frame    ${iframe_cryptogramme}
    Cliquer element    ${input_cryptogramme}
    Remplir champ    ${input_cryptogramme}    123
    Unselect Frame


Procéder au paiement
    Attendre iframe et switcher