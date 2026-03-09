*** Variables ***

${menu_principal}           xpath=//div[@class='navbar-toggle__wrapper']
${menu_ski_rando}           xpath=//nav//a[@title='Ski rando']
${menu_ski_rando_homme}     xpath=//nav//a[@title='Ski rando homme']

${produit_ski}              xpath=//div[contains(@class,'product-list-item')]//a[@title='Axess 92']//span[contains(text(),'Movement')]

${taille_ski}               xpath=//button[normalize-space()='185']

${bouton_ajouter_panier}    xpath=//button[normalize-space()='Ajouter au panier']
${bouton_voir_panier}       xpath=//a[@href and contains(normalize-space(), 'Voir mon panier')]
${bouton_continuer_achats}  xpath=//button[normalize-space()='Poursuivre mes achats']
${bouton_valide_commande}   xpath=//a[@title='Passer la commande']
${checkbox_conditions_vente}  id=acceptTermsAndConditions
${bouton_valide_coordonnes}  xpath=//button[normalize-space()='Valider mes coordonnées']

${badge_panier}             xpath=//header//span[contains(@class,'badge')]
${modal}                    xpath=//div[contains(@class,'modal-footer')]


${bouton_creer_adresse}       xpath=//button[normalize-space()='Créer une nouvelle adresse']
${bouton_dropdown_pays}      xpath=//*[@id="address"]//button[contains(@class,'dropdown-toggle-list')]
${script_option_pays}        [...document.querySelectorAll("#address [data-ng-click*='countryCode']")].find(el => el.textContent.includes('FRANCE')).click()


#Formulaire adresse de livraison
${input_nom}                xpath=//input[@type='text' and contains(@id,'lastname')]
${input_prenom}             xpath=//input[@type='text' and contains(@id,'firstname')]
${input_telephone}          xpath=//input[@type='text' and contains(@id,'phone')]
${input_numero_adresse}            xpath=//input[@type='text' and contains(@id,'streetNumber')]
${input_code_postal}        xpath=//input[@type='text' and contains(@id,'zipCode')]
${input_ville}             xpath=//input[@type='text' and contains(@id,'locality')]   
${input_rue}              xpath=//input[@placeholder="Adresse: rue, avenue, lieu dit... *"] 
