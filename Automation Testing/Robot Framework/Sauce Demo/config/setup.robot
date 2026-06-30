*** Settings ***
Library    SeleniumLibrary
Resource   env.robot
Resource   ../resources/keywords/loginStep.robot

*** Keywords ***
Open Browser and Navigate to Sauce Demo
    Open Browser    browser=${browser}    url=${url}[${env}]
    Landed on Sauce Demo Page Successfully

Landed on Sauce Demo Page Successfully
    Wait Until Element Is Visible    locator=xpath=//div[@class="login_logo"]    timeout=10s  error=browser not loaded

Clearing Test
    Go To    url=${url}[${env}]
    Landed on Sauce Demo Page Successfully
    ${isLandingPage}=  Run Keyword And Return Status  Element Should Be Visible    xpath=//div[@class="login_logo"] 
    
    #this logic will not used because sauce demo don't have session login
    IF    ${isLandingPage} == ${False}
        Log   process logout and back to landing page
    END
