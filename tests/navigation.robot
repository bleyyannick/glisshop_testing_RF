*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Ouverture Page Accueil
    Open Browser    https://www.glisshop.com    chrome
    Maximize Browser Window
    ${title}    Get Title    
    Log    ${title}
    Should Contain    ${title}    Glisshop
    [Teardown]    Close Browser