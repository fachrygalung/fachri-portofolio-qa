*** Settings ***
Library    SeleniumLibrary
Variables  ../locators/loginPage.py


*** Keywords ***
I click login button
    Wait Until Element Is Visible    locator=${buttonLogin}    timeout=10s    error=button login not visible
    Click Element    locator=${buttonLogin}

Input Email and Password
    [Arguments]    ${email}    ${password}
    
    #process input email
    Wait Until Element Is Visible    locator=${inputEmail}    timeout=10s    error=text input email not visible
    Input Text    locator=${inputEmail}    text=${email}

    #process input password
    Wait Until Element Is Visible    locator=${inputPass}    timeout=10s    error=text input password not visible
    Input Text    locator=${inputPass}    text=${password}

Click Button Sign In
    #signIn
    Click Element    locator=${buttonLogin}

Login Sauce Demo Success
    Wait Until Element Is Visible    locator=${buttonMyAccount}    timeout=10s    error=button my account not visible

Login Sauce Demo Failed
    Wait Until Element Is Visible    locator=${errorShown}    timeout=10s
    