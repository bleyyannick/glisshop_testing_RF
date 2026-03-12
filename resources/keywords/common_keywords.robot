*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/common_page.robot


*** Keywords ***

Se deconnecter si connecte
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath_bouton_deconnexion}
    IF    ${is_visible}
        Se deconnecter
    END

Se deconnecter
    Scroll Element Into View    ${xpath_bouton_deconnexion}
    Click Element    ${xpath_bouton_deconnexion}

Aller sur la page de connexion
    Wait Until Element Is Visible    ${selecteur_lien_creation_compte}    ${default_timeout}
    Wait Until Element Is Enabled    ${selecteur_lien_creation_compte}    timeout=${default_timeout}
    Click Element    ${selecteur_lien_creation_compte}

Cliquer sur deja client
    Wait Until Element Is Visible    ${xpath_onglet_deja_client}    timeout=${default_timeout}
    Click Element    ${xpath_onglet_deja_client}

Verifier que le bouton est desactive
    [Arguments]    ${locator}
    Scroll Element Into View      ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${default_timeout}
    Element Should Be Disabled    ${locator}
