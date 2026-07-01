*** Settings ***
Resource           ../resources/keywords/productStep.robot
Resource           ../config/setup.robot
Suite Setup        Open Browser and Navigate to Sauce Demo    withLogin=${True}
Test Teardown      Clearing Test                              backToLogin=${False}

*** Test Cases ***
As User, I want to sorting product by Name A to Z
    [Tags]     positive
    Given User on Product Item Page
    When Change Filter by Name A to Z
    Then Verify List Page is A to Z

As User, I want to sorting product by Name Z to A
    [Tags]     positive
    Given User on Product Item Page
    When Change Filter by Name Z to A
    Then Verify List Page is Z to A

As User, I want to add product to cart
    [Tags]    positive
    Given User on Product Item Page
    When User Add To Cart by Product Name    productName=Sauce Labs Backpack
    Then Counter Cart Added

As User, I want to remove product from cart via product list
    [Tags]    positive
    Given User on Product Item Page
    When User Removed Cart by Product Name    productName=Sauce Labs Backpack
    Then Counter Cart Removed