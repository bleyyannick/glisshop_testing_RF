*** Variables ***

${selecteur_input_email}       css=#block2-login
${selecteur_input_password}    css=#block2-password

${selecteur_cookies}      css=button.onetrust-close-btn-handler
${selecteur_lien_creation_compte}  css=[data-id="accountShort"] a[href*="creation-de-compte"]
${xpath_onglet_deja_client}  xpath=//*[@id="content-column"]/div/div[1]/ul/li[2]
${selecteur_message_erreur_connexion}  css=.form-group p.text-danger

${msg_espace_client}    BIENVENUE DANS VOTRE ESPACE CLIENT   
${msg_erreur_connexion}    L'identifiant et le mot de passe ne correspondent pas

${empty_email}                 
${empty_password}
${special_character_email}      !@#$%^&*()_+=-{}[]|:@;'<>,.?/`~"

