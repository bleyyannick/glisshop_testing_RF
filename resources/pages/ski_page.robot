*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/global_variables.robot

*** Keywords ***

Attendre element visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}

Attendre element cliquable
    [Arguments]    ${locator}
    Attendre element visible    ${locator}    
    Wait Until Element Is Enabled    ${locator}    ${default_timeout}

Attendre modal non visible
    [Arguments]    ${modal_selector}
    Wait Until Element Is Not Visible      ${modal_selector}    ${default_timeout}

Cliquer element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Cliquer element interne    ${locator}

Cliquer element interne
    [Arguments]    ${locator}
    Click Element    ${locator}

Survol element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    2s    Survol element interne    ${locator}

Survol element interne
    [Arguments]    ${locator}
    Attendre element cliquable   ${locator}
    Mouse Over    ${locator}

Scroller vers element
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Attendre element cliquable   ${locator}
    

Verifier element visible
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Element Should Be Visible    ${locator}

Checker element
    [Arguments]    ${locator}  ${ng-class}
    Attendre element cliquable    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Cocher Checkbox Angular    ${locator}     ${ng-class}

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