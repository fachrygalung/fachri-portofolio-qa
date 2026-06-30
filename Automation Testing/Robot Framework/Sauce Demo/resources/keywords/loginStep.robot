*** Settings ***
Library    SeleniumLibrary
Variables  ../locators/loginPage.py

*** Keywords ***
I Click Login Button
    Wait Until Element Is Visible    locator=${buttonLogin}    timeout=10s    error=button login not visible
    Click Element    locator=${buttonLogin}

User Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    locator=${inputUsername}    timeout=10s    error=text input username not visible
    Input Text    locator=${inputUsername}    text=${username}

User Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    locator=${inputPass}    timeout=10s    error=text input passwrod not visible
    Input Text    locator=${inputPass}    text=${password}

User Login Sauce Demo Successfully
    Wait Until Element Is Visible    locator=${shopCartIcon}    timeout=10s    error=shop cart icon not visible

User Login Sauce Demo Failed
    Wait Until Element Is Visible    locator=${errorShown}    timeout=10s
    ${text}    Get Text    locator=${errorShown}
    Set Test Message    message=showing alert message "${text}"
    