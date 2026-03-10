*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/ski_page.robot
Resource   ../locators/connexion_locators.robot
Resource   ../locators/ajout_ski_locators.robot

*** Keywords ***

Ouvrir le menu
    Cliquer element    ${menu_principal}

Acceder aux skis de rando homme
    Survol element     ${menu_ski_rando}    
    Cliquer element    ${menu_ski_rando_homme}

Acceder au panier
    Attendre element cliquable    ${bouton_voir_panier}
    Cliquer element               ${bouton_voir_panier}

Choisir un ski
    Scroller vers element    ${produit_ski}
    Attendre element cliquable    ${produit_ski}
    Cliquer element          ${produit_ski}

Choisir la taille du ski
    Cliquer element    ${taille_ski}

Ajouter le ski au panier
    Attendre element cliquable    ${bouton_ajouter_panier}
    Cliquer element    ${bouton_ajouter_panier}

Continuer les achats
    Cliquer element    ${bouton_continuer_achats}

Accepter Les Conditions
    Checker element    ${checkbox_conditions_vente}    ${ng_class_checkbox_conditions_vente}

Creer une adresse de livraison
    Cliquer element    ${bouton_creer_adresse}
    Cliquer element    ${bouton_dropdown_pays}
    Cliquer element    ${options_pays}
    Execute Javascript    ${script_option_pays}
    Remplir champ    ${input_nom}               Dupont
    Remplir champ    ${input_prenom}            Jean
    Scroller vers element    ${input_numero_adresse}
    Remplir champ    ${input_numero_adresse}    23
    Scroller vers element    ${input_rue}
    Remplir champ    ${input_rue}               Avenue Beau Soleil
    Scroller vers element    ${input_code_postal}
    Remplir champ    ${input_code_postal}      75017
    Scroller vers element    ${input_ville}
    Remplir champ    ${input_ville}             Paris
    Scroller vers element    ${input_telephone}
    Remplir champ    ${input_telephone}         0601020304
    Scroller vers element    ${bouton_valide_coordonnes}
    Cliquer element    ${bouton_valide_coordonnes}

Valider la commande
    Accepter Les Conditions
    Cliquer element    ${bouton_valide_commande}

Valider la livraison
    Attendre element visible    ${bouton_valide_livraison}
    Attendre element cliquable    ${bouton_valide_livraison}
    Scroller vers element         ${bouton_valide_livraison}
    Cliquer element               ${bouton_valide_livraison}
    

Verifier que le panier contient un produit
    Verifier element visible    ${badge_panier}

Aller vider le panier
    Go To    ${url_panier}
    Attendre element visible    xpath=//h1[contains(@class,'c-cart-page__header-title') and normalize-space()='Mon panier']
    ${bandeau_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    xpath=//p[contains(@class,'cart-locked')]//span[@data-ng-show="!cartData.productsConflict"][normalize-space()='Cliquez ici']
    IF    ${bandeau_visible}
        Cliquer element    xpath=//p[contains(@class,'cart-locked')]//span[@data-ng-show="!cartData.productsConflict"][normalize-space()='Cliquez ici']
    END
    Attendre element cliquable    xpath=//div[contains(@class,'cart-line_priceWrapper')]//span[contains(@class,'icon-close')]
    Cliquer element    xpath=//div[contains(@class,'cart-line_priceWrapper')]//span[contains(@class,'icon-close')]/..
    Attendre element visible    xpath=//h1[normalize-space()='Votre panier est vide.']
    Element Should Be Visible    xpath=//h1[normalize-space()='Votre panier est vide.']


Aller se deconnecter
    Go To    ${url_infos}
    Attendre element visible    ${xpath_bouton_deconnexion}
    Verifier element visible    ${xpath_bouton_deconnexion}
    Attendre element cliquable    ${xpath_bouton_deconnexion}
    Cliquer element    ${xpath_bouton_deconnexion}

Aller Vider le panier et se deconnecter
    Aller vider le panier
    Aller se deconnecter

Attendre iframe et switcher
    Attendre element visible   id=hosted-fields-frame-card
    Attendre element visible   id=hosted-fields-frame-expiry
    Attendre element visible   id=hosted-fields-frame-cryptogram
    
    Attendre element cliquable    id=hosted-fields-frame-card
    Select Frame    id=hosted-fields-frame-card
    Cliquer element    id=hosted-fields-card
    Remplir champ    id=hosted-fields-card    4111 1111 1111 1111
    Unselect Frame

    Attendre element cliquable   id=hosted-fields-frame-expiry
    Select Frame    id=hosted-fields-frame-expiry
    Cliquer element    id=hosted-fields-expiry
    Remplir champ    id=hosted-fields-expiry    12/29
    Unselect Frame

    Attendre element cliquable   id=hosted-fields-frame-cryptogram
    Select Frame    id=hosted-fields-frame-cryptogram
    Cliquer element    id=hosted-fields-cryptogram
    Remplir champ    id=hosted-fields-cryptogram    123
    Unselect Frame


Procéder au paiement
    Attendre iframe et switcher