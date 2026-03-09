*** Settings ***
Library    SeleniumLibrary
Resource   ../../../variables/global_variables.robot

*** Keywords ***

Attendre element visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${default_timeout}

Attendre element cliquable
    [Arguments]    ${locator}
    Attendre element visible    ${locator}    
    Wait Until Element Is Enabled    ${locator}    ${default_timeout}

Cliquer element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Cliquer element interne    ${locator}

Cliquer element interne
    [Arguments]    ${locator}
    Attendre element cliquable    ${locator}
    Click Element    ${locator}

Survol element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Survol element interne    ${locator}

Survol element interne
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Mouse Over    ${locator}

Scroller vers element
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Attendre element visible    ${locator}
    

Verifier element visible
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Element Should Be Visible    ${locator}

Checker element
    [Arguments]    ${locator}
    Attendre element visible    ${locator}
    Wait Until Keyword Succeeds    5x    1s    Cliquer Checkbox Interne    ${locator}

Remplir champ
    [Arguments]    ${locator}    ${value}
    Cliquer element    ${locator}
    Input Text    ${locator}    ${value}

Cliquer Checkbox Interne
    [Arguments]    ${locator}    
    Wait Until Element Is Visible    ${locator}        ${default_timeout}
    ${checkbox}=    Get WebElement   ${locator}
    Execute Javascript               arguments[0].click()    ARGUMENTS    ${checkbox}
    Checkbox Should Be Selected      ${locator}