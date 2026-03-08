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

Choisir un ski
    Scroller vers element    ${produit_ski}
    Cliquer element          ${produit_ski}

Choisir la taille du ski
    Cliquer element    ${taille_ski}

Ajouter le ski au panier
    Cliquer element    ${bouton_ajouter_panier}

Continuer les achats
    Cliquer element    ${bouton_continuer_achats}

Verifier que le panier contient un produit
    Verifier element visible    ${badge_panier}