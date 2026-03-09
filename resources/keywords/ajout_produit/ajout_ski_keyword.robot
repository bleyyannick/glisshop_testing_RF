*** Settings ***
Library    SeleniumLibrary
Resource   ../../../resources/pages/ski/ski_page.robot
Resource   ../../locators/ajout_ski_locators.robot

*** Keywords ***

Ouvrir le menu
    Cliquer element    ${menu_principal}

Acceder aux skis de rando homme
    Survol element     ${menu_ski_rando}    
    Cliquer element    ${menu_ski_rando_homme}

Acceder au panier
    Attendre element cliquable    ${bouton_voir_panier}
    Cliquer element    ${bouton_voir_panier}

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
    Checker element    ${checkbox_conditions_vente}

Creer une adresse de livraison
    Cliquer element    ${bouton_creer_adresse}
    Cliquer element    xpath=//*[@id="address"]//button[contains(@class,'dropdown-toggle-list')]
    Cliquer element  xpath=//*[@id="address"]//div[contains(@class,'dropdown-menu_lang')]
    Execute Javascript  [...document.querySelectorAll("#address [data-ng-click*='countryCode']")].find(el => el.textContent.includes('FRANCE')).click()
    Remplir champ    ${input_nom}    Dupont
    Remplir champ    ${input_prenom}    Jean
    Scroller vers element    ${input_numero_adresse}
    Remplir champ    ${input_numero_adresse}    10
    Scroller vers element   ${input_rue}
    Remplir champ    ${input_rue}    Rue Des Rosiers
    Scroller vers element    ${input_code_postal}
    Remplir champ    ${input_code_postal}    92210
    Scroller vers element    ${input_ville}
    Remplir champ    ${input_ville}    Clichy
    Scroller vers element    ${input_telephone}
    Remplir champ    ${input_telephone}    0601020304
    Scroller vers element    ${bouton_valide_coordonnes}
    Cliquer element    ${bouton_valide_coordonnes}
    

Valider la commande
    Accepter Les Conditions
    Cliquer element    ${bouton_valide_commande}

Verifier que le panier contient un produit
    Verifier element visible    ${badge_panier}