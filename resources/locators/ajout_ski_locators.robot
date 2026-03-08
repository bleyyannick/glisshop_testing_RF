*** Variables ***

${menu_principal}           xpath=//div[@class='navbar-toggle__wrapper']
${menu_ski_rando}           xpath=//nav//a[@title='Ski rando']
${menu_ski_rando_homme}     xpath=//nav//a[@title='Ski rando homme']

${produit_ski}              xpath=//div[contains(@class,'product-list-item')]//a[@title='Axess 92']//span[contains(text(),'Movement')]

${taille_ski}               xpath=//button[normalize-space()='185']

${bouton_ajouter_panier}    xpath=//button[normalize-space()='Ajouter au panier']
${bouton_continuer_achats}  xpath=//button[normalize-space()='Poursuivre mes achats']

${badge_panier}             xpath=//header//span[contains(@class,'badge')]