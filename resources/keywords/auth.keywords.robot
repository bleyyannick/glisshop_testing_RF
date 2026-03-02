*** Settings ***
Library       SeleniumLibrary


*** Variables ***
${NAME_SITE}    Glisshop
${URL}    https://www.glisshop.com
${BROWSER}    chrome


*** Keywords ***

Ouvrir Le Navigateur Sur Glisshop
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fermer Le Navigateur
    Close Browser

Fermer Le Bandeau Cookies
    Wait Until Element Is Visible    css=button.onetrust-close-btn-handler    timeout=5s
    Click Button    css=button.onetrust-close-btn-handler