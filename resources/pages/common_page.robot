*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/common_locators.robot
Resource    ../locators/connexion_locators.robot
Resource    ../../variables/global_variables.robot

Documentation    Keywords techniques partages (attentes, interactions UI, iframe, checkbox Angular).

*** Keywords ***

Aller sur glisshop
    [Documentation]    Ouvre Glisshop avec Chrome en mode visible et maximise la fenetre.
    ${prefs}=    Create Dictionary
    ...    profile.default_content_setting_values.notifications=${2}
    ...    autofill.profile_enabled=${False}
    ...    autofill.address_enabled=${False}
    ${options}=    Evaluate
    ...    sys.modules['selenium.webdriver'].ChromeOptions()
    ...    sys, selenium.webdriver
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --start-maximized
    Open Browser    ${url_glisshop}    ${browser}    options=${options}
    Maximize Browser Window
    Fermer le bandeau cookies

Fermer le navigateur
    [Documentation]    Ferme le navigateur courant.
    Close Browser

Fermer le bandeau cookies
    [Documentation]    Ferme le bandeau cookies si visible a l'arrivee sur le site.
    Wait Until Element Is Visible    ${selecteur_cookies}    timeout=${default_timeout}
    Click Button    ${selecteur_cookies}

Saisir dans le champ
    [Documentation]    Saisie technique bas niveau dans un champ.
    [Arguments]    ${selector}    ${value}
    Input Text    ${selector}    ${value}

Attendre element visible
    [Documentation]    Attend qu'un element soit visible selon le timeout global.
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}

Attendre element cliquable
    [Documentation]    Attend qu'un element soit visible puis active avant clic/saisie.
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds     5x    1s       Attendre element visible    ${locator}
    Wait Until Element Is Enabled    ${locator}    ${default_timeout}

Attendre modal non visible
    [Documentation]    Attend la disparition d'une modal de chargement.
    [Arguments]    ${modal_selector}
    Wait Until Element Is Not Visible    ${modal_selector}    ${default_timeout}

Aller sur l'iframe
    [Documentation]    Bascule dans une iframe apres verification de disponibilite.
    [Arguments]    ${iframe}
    Attendre element cliquable    ${iframe}
    Select Frame    ${iframe}

Sortir de l'iframe
    [Documentation]    Revient au document principal depuis une iframe.
    Unselect Frame


Cliquer element
    [Documentation]    Clique un element avec retry pour fiabiliser les actions UI.
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Cliquer element interne    ${locator}

Cliquer element interne
    [Documentation]    Etape interne de clic avec attente prealable.
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Click Element    ${locator}

Survol element
    [Documentation]    Survole un element avec retry (utile pour menus dynamiques).
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    2s    Survol element interne    ${locator}

Survol element interne
    [Documentation]    Etape interne de survol avec attente prealable.
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Mouse Over    ${locator}

Scroller vers element
    [Documentation]    Scroll jusqu'a l'element puis verifie qu'il est cliquable.
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Attendre element cliquable    ${locator}

Verifier element visible
    [Documentation]    Assertion technique de visibilite d'un element.
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Element Should Be Visible    ${locator}

Checker element
    [Documentation]    Coche une checkbox Angular puis valide le changement d'etat.
    [Arguments]    ${locator}    ${ng-class}
    Attendre element cliquable    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Cocher Checkbox Angular    ${locator}    ${ng-class}

Remplir champ
    [Documentation]    Attend puis saisit une valeur dans un champ.
    [Arguments]    ${locator}    ${value}
    Attendre element cliquable    ${locator}
    Input Text    ${locator}    ${value}

Verifier Checkbox Cochee
    [Documentation]    Verifie que la classe Angular de checkbox indique l'etat coche.
    [Arguments]    ${locator}    ${ng_class}=ng-empty
    ${classes}=    Get Element Attribute    ${locator}    class
    Should Not Contain    ${classes}    ${ng_class}

Cocher Checkbox Angular
    [Documentation]    Coche une checkbox Angular via JavaScript et declenche l'evenement change.
    [Arguments]    ${id}    ${ng_class}=ng-empty
    Execute Javascript
    ...    let el = document.getElementById('${id}');
    ...    el.checked = true;
    ...    angular.element(el).triggerHandler('change');
    Wait Until Keyword Succeeds    5x    1s
    ...    Verifier Checkbox Cochee    id=${id}    ${ng_class}