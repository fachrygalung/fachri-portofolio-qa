*** Settings ***
Resource    ../resources/keywords/loginStep.robot
Resource    ../config/setup.robot
Suite Setup    Open Browser and Navigate to Sauce Demo
Test Teardown    Clearing Test

*** Test Cases ***
Successfully Login to Sauce Demo Web
    [Documentation]    expectation is logged in to sauce demo application
    [Tags]    positive
    Given Landed on Sauce Demo Page Successfully
    When User Input Username                 username=${username}[${env}]
    And User Input Password                  password=${pass}[${env}]
    And I Click Login Button
    Then User Login Sauce Demo Successfully

Failed Login to Sauce Demo Web, Username and Password is Empty
    [Documentation]     expectation is showing error alert
    [Tags]    negative
    Given Landed on Sauce Demo Page Successfully
    When I Click Login Button
    Then User Login Sauce Demo Failed

Failed Login to Sauce Demo Web, Password is Empty
    [Documentation]     expectation is showing error alert password empty
    [Tags]    negative
    Given Landed on Sauce Demo Page Successfully
    When User Input Username                 username=${username}[${env}]
    And I Click Login Button
    Then User Login Sauce Demo Failed