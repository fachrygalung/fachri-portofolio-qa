*** Settings ***
Library    SeleniumLibrary
Resource   env.robot
Resource   ../resources/keywords/loginStep.robot

*** Keywords ***
Open Browser and Navigate to Sauce Demo
    Open Browser    browser=${browser}    url=${url}[${env}]
    Wait Until Element Is Visible    locator=xpath=//h1[@id="logo"]  timeout=10s  error=browser not loaded

Clearing Test
    Go To    url=${url}[${env}]
    Wait Until Element Is Visible    locator=xpath=//h1[@id="logo"]  timeout=10s  error=browser not loaded
    ${isLoggedIn}=  Run Keyword And Return Status  Element Should Be Visible    xpath=//a[@id="customer_logout_link"]

    IF    ${isLoggedIn} == ${False}
        Log    login
    END
