*** Settings ***
Library      SeleniumLibrary
Library      Collections
Library      String
Variables    ../locators/productListPage.py


*** Keywords ***
Verify List Page is A to Z
    ${listElement}=    Get WebElements    ${listProductName}
    ${n}    Get Length    ${listElement}
    @{actualProductName}=    Create List
    FOR    ${i}    IN RANGE    ${n}
        ${text}    Get Text    ${listElement}[${i}]
        Append To List         ${actualProductName}        ${text}
    END

    @{expectedList}    Copy List    ${actualProductName}
    Sort List    ${expectedList}
    Lists Should Be Equal    ${actualProductName}    ${expectedList}

Verify List Page is Z to A
    ${listElement}=    Get WebElements    ${listProductName}
    ${n}    Get Length    ${listElement}
    @{actualProductName}=    Create List
    FOR    ${i}    IN RANGE    ${n}
        ${text}    Get Text    ${listElement}[${i}]
        Append To List         ${actualProductName}        ${text}
    END

    @{expectedList}    Copy List    ${actualProductName}
    Sort List    ${expectedList}
    Reverse List    ${expectedList}
    Lists Should Be Equal    ${actualProductName}    ${expectedList}

User Add To Cart by Product Name
    [Arguments]    ${productName}
    ${productCode}=  Convert To Lower Case    ${productName}
    ${productCode}=  Replace String    ${productCode}    search_for=${SPACE}    replace_with=-
    ${addToCart}=    Catenate     SEPARATOR=   ${addToCartButton}  ${productCode}
    ${removeFromCart}=    Catenate     SEPARATOR=   id=remove-${productCode}
    
    ${buttonChanged}    Set Variable    ${False}
    WHILE   ${buttonChanged} == ${False}
        Click Element    ${addToCart}
        Sleep    2s  
        ${buttonChanged}    Run Keyword And Return Status  Element Should Be Visible    ${removeFromCart}    
    END

User Removed Cart by Product Name
    [Arguments]    ${productName}
    ${productCode}=  Convert To Lower Case    ${productName}
    ${productCode}=  Replace String    ${productCode}    search_for=${SPACE}    replace_with=-
    ${removeFromCart}=    Catenate     SEPARATOR=   id=remove-${productCode}
    
    Click Element    locator=${removeFromCart}
    Sleep    2s
    Element Should Not Be Visible    locator=${removeFromCart}    message=product removed

Counter Cart Added
    Scroll Element Into View    locator=${shopCartIcon}
    Wait Until Element Is Visible    locator=${counterCart}    timeout=10s    error=counter cart not shown

Counter Cart Removed
    Scroll Element Into View    locator=${shopCartIcon}
    Wait Until Element Is Not Visible    locator=${counterCart}    timeout=10s    error=counter cart still shown