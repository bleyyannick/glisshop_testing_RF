*** Variables ***

# --- Boutons navigation compte (partagés entre connexion et création de compte) ---
${texte_bouton_connexion}       Connexion à mon compte
${texte_bouton_deconnexion}     Déconnexion
${texte_bouton_creer_compte}    Créer mon compte

${xpath_bouton_login}           xpath=//button[normalize-space()='${texte_bouton_connexion}']
${xpath_bouton_deconnexion}     xpath=//a[normalize-space()='${texte_bouton_deconnexion}']
${xpath_bouton_creer_compte}    xpath=//button[normalize-space()='${texte_bouton_creer_compte}']
${xpath_title_client}           css=.page-description h1
${bouton_input_payeur}          css=input#full-card-name 
${bouton_paiement}              css=#project-dalenys-hosted-fields-payment-cb-form button[type="submit"]
