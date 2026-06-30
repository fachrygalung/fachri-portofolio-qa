*** Settings ***
Resource   env.robot
Resource   ../resources/keywords/loginStep.robot

*** Variables ***
${hamburgMenu}        id=react-burger-menu-btn
${productListMenu}    id=inventory_sidebar_link
${titlePage}          xpath=//span[@data-test="title"]

*** Keywords ***
Open Browser and Navigate to Sauce Demo
    [Arguments]    ${withLogin}=${False}

    ${options}    Get browser options
    Open Browser    browser=${browser}    url=${url}[${env}]    options=${options}
    Landed on Sauce Demo Page Successfully

    IF    ${withLogin}
        User Input Username    username=${username}[${env}]
        User Input Password    password=${pass}[${env}]
        I Click Login Button
        User Login Sauce Demo Successfully
    END
    
Landed on Sauce Demo Page Successfully
    Wait Until Element Is Visible    locator=xpath=//div[@class="login_logo"]    timeout=10s  error=browser not loaded

Clearing Test
    [Arguments]  ${backToLogin}=${True}

    IF    ${backToLogin}
        Go To    url=${url}[${env}]
        Landed on Sauce Demo Page Successfully
        ${isLandingPage}=  Run Keyword And Return Status  Element Should Be Visible    xpath=//div[@class="login_logo"] 
        
        #this logic will not used because sauce demo don't have session login
        IF    ${isLandingPage} == ${False}
            Log   process logout and back to landing page
        END
    ELSE
        ${pageName}=    Get Text    locator=${titlePage}
        
        IF    $pageName != 'Products'
            Wait Until Element Is Visible    locator=${hamburgMenu}    timeout=10s    error=hamburg menu not visible on page
            Click Element    locator=${hamburgMenu}

            Wait Until Element Is Visible    locator=${productListMenu}    timeout=10s    error=product list menu not visible in option
            Click Button    locator=${productListMenu}

            Wait Until Element Is Visible    locator=${titlePage}    timeout=10s
            Element Text Should Be    locator=${titlePage}    expected=Products    message=wrong page    ignore_case=True
        END
        
    END
    
    
Get browser options
    IF    '${browser}' == 'chrome'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ELSE IF    '${browser}' == 'edge'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys

    ELSE IF    '${browser}' == 'firefox'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys

    ELSE
        Fail    Browser '${browser}' is not supported.
    END

    #conditional if enable headless option
    IF    ${Headless}
        Call Method    ${options}    add_argument    --headless\=new
    END
    
    RETURN    ${options}