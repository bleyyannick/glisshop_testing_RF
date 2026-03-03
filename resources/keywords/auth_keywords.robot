*** Settings ***
Library       SeleniumLibrary
Resource      ../variables/global_variables.robot


*** Keywords ***

Aller Sur Glisshop
    Open Browser    ${URL_GLISSHOP}    ${BROWSER}
    Maximize Browser Window
    Fermer Le Bandeau Cookies

Fermer Le Navigateur
    Close Browser

Fermer Le Bandeau Cookies
    Wait Until Element Is Visible    css=button.onetrust-close-btn-handler    timeout=10s
    Click Button    css=button.onetrust-close-btn-handler