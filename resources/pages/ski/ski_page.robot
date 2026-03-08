*** Settings ***
Library    SeleniumLibrary
Resource   ../../../variables/global_variables.robot

*** Keywords ***

Attendre element visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}

Attendre element cliquable
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}
    Wait Until Element Is Enabled    ${locator}    ${default_timeout}

Cliquer element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Cliquer element interne    ${locator}

Cliquer element interne
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Click Element    ${locator}

Survol element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Survol element interne    ${locator}

Survol element interne
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Mouse Over    ${locator}

Scroller vers element
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Scroll Element Into View    ${locator}

Verifier element visible
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Element Should Be Visible    ${locator}