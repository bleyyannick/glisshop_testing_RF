*** Variables ***

${modal_chargement}         css=div.modal-ajax-waiting-modal
${url_panier}               https://www.glisshop.com/glisshop/mon-panier.html
${url_infos}                https://www.glisshop.com/mon-compte/mes-informations.html
        
${menu_principal}           css=button[data-target='.navbar-responsive-collapse-mainMenu']
${menu_ski_rando}           xpath=//nav//a[@title='Ski rando']
${menu_ski_rando_homme}     xpath=//nav//a[@title='Ski rando homme']

${produit_ski}              xpath=//div[contains(@class,'product-list-item')]//a[@title='Axess 92']//span[contains(text(),'Movement')]
${taille_ski}               xpath=//button[normalize-space()='185']

${bouton_ajouter_panier}    xpath=//button[normalize-space()='Ajouter au panier']
${bouton_voir_panier}       xpath=//a[@href and contains(normalize-space(), 'Voir mon panier')]
${bouton_continuer_achats}  xpath=//button[normalize-space()='Poursuivre mes achats']
${bouton_valide_commande}   xpath=//a[@title='Passer la commande']
${checkbox_conditions_vente}  acceptTermsAndConditions
${ng_class_checkbox_conditions_vente}  ng-empty
${bouton_valide_coordonnes}  xpath=//button[normalize-space()='Valider mes coordonnées']

${badge_panier}             xpath=//header//span[contains(@class,'badge')]
${modal}                    xpath=//div[contains(@class,'modal-footer')]

#Bouton de création d'adresse de livraison
${bouton_creer_adresse}       xpath=//button[normalize-space()='Créer une nouvelle adresse']
${bouton_dropdown_pays}      xpath=//*[@id="address"]//button[contains(@class,'dropdown-toggle-list')]
${options_pays}             xpath=//*[@id="address"]//div[contains(@class,'dropdown-menu_lang')]
${script_option_pays}        [...document.querySelectorAll("#address [data-ng-click*='countryCode']")].find(el => el.textContent.includes('FRANCE')).click()


#Formulaire adresse de livraison
${input_nom}                xpath=//input[@type='text' and contains(@id,'lastname')]
${input_prenom}             xpath=//input[@type='text' and contains(@id,'firstname')]
${input_telephone}          xpath=//input[@type='text' and contains(@id,'phone')]
${input_numero_adresse}            xpath=//input[@type='text' and contains(@id,'streetNumber')]
${input_code_postal}        xpath=//input[@type='text' and contains(@id,'zipCode')]
${input_ville}             xpath=//input[@type='text' and contains(@id,'locality')]   
${input_rue}              xpath=//input[@placeholder="Adresse: rue, avenue, lieu dit... *"] 

${bouton_valide_livraison}  xpath=//button[normalize-space()='Valider la livraison']

${header_mon_panier}         xpath=//h1[contains(@class,'c-cart-page__header-title') and normalize-space()='Mon panier']
${bandeau_panier_cliquez_ici}  xpath=//p[contains(@class,'cart-locked')]//span[@data-ng-show="!cartData.productsConflict"][normalize-space()='Cliquez ici']
${bouton_supprimer_produit_panier}  xpath=//div[contains(@class,'cart-line_priceWrapper')]//span[contains(@class,'icon-close')]/..
${header_panier_vide}        xpath=//h1[normalize-space()='Votre panier est vide.']

${iframe_carte}              id=hosted-fields-frame-card
${iframe_expiration}         id=hosted-fields-frame-expiry
${iframe_cryptogramme}       id=hosted-fields-frame-cryptogram
${input_numero_carte}        id=hosted-fields-card
${input_date_expiration}     id=hosted-fields-expiry
${input_cryptogramme}        id=hosted-fields-cryptogram
