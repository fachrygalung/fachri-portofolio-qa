*** Settings ***
Resource    ../resources/keywords/loginStep.robot
Resource    ../config/setup.robot

*** Test Cases ***
Successfully Login to Sauce Demo Web
    [Documentation]    expectation is logged in to sauce demo application
    [Tags]    positive
    Given Open Browser and Navigate to Sauce Demo
    When I click login button
    And Input Email and Password        ${email}[${env}]    ${pass}[${env}]
    And Click Button Sign In
    Then Login Sauce Demo Success

Failed Login to Sauce Demo Web, Email not registered
    Given Open Browser and Navigate to Sauce Demo
    When I click login button
    And Input Email and Password        abcd@yopmail.com    ${pass}[${env}]
    And Click Button Sign In
    Then Login Sauce Demo Success