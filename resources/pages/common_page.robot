*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/common_locators.robot
Resource    ../locators/connexion_locators.robot
Resource    ../../variables/global_variables.robot

*** Keywords ***

Aller sur glisshop
    ${prefs}=    Create Dictionary
    ...    profile.default_content_setting_values.notifications=${2}
    ...    autofill.profile_enabled=${False}
    ...    autofill.address_enabled=${False}
    ${options}=    Evaluate
    ...    sys.modules['selenium.webdriver'].ChromeOptions()
    ...    sys, selenium.webdriver
    ${headless}=    Set Variable    --headless=new
    ${size}=    Set Variable    --window-size=1920,1080
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    ${size}
    Open Browser    ${url_glisshop}    ${browser}    options=${options}
    Fermer le bandeau cookies

Fermer le navigateur
    Close Browser

Fermer le bandeau cookies
    Wait Until Element Is Visible    ${selecteur_cookies}    timeout=${default_timeout}
    Click Button    ${selecteur_cookies}

Saisir dans le champ
    [Arguments]    ${selector}    ${value}
    Input Text    ${selector}    ${value}

Attendre element visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}

Attendre element cliquable
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Wait Until Element Is Enabled    ${locator}    ${default_timeout}

Attendre modal non visible
    [Arguments]    ${modal_selector}
    Wait Until Element Is Not Visible    ${modal_selector}    ${default_timeout}

Aller sur l'iframe
    [Arguments]    ${iframe}
    Attendre element cliquable    ${iframe}
    Select Frame    ${iframe}

Sortir de l'iframe
    Unselect Frame


Cliquer element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Cliquer element interne    ${locator}

Cliquer element interne
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Click Element    ${locator}

Survol element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    2s    Survol element interne    ${locator}

Survol element interne
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Mouse Over    ${locator}

Scroller vers element
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Attendre element cliquable    ${locator}

Verifier element visible
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Element Should Be Visible    ${locator}

Checker element
    [Arguments]    ${locator}    ${ng-class}
    Attendre element cliquable    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Cocher Checkbox Angular    ${locator}    ${ng-class}

Remplir champ
    [Arguments]    ${locator}    ${value}
    Attendre element cliquable    ${locator}
    Input Text    ${locator}    ${value}

Verifier Checkbox Cochee
    [Arguments]    ${locator}    ${ng_class}=ng-empty
    ${classes}=    Get Element Attribute    ${locator}    class
    Should Not Contain    ${classes}    ${ng_class}

Cocher Checkbox Angular
    [Arguments]    ${id}    ${ng_class}=ng-empty
    Execute Javascript
    ...    let el = document.getElementById('${id}');
    ...    el.checked = true;
    ...    angular.element(el).triggerHandler('change');
    Wait Until Keyword Succeeds    5x    1s
    ...    Verifier Checkbox Cochee    id=${id}    ${ng_class}