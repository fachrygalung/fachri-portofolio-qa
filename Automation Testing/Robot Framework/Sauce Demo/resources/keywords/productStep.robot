*** Settings ***
Library        SeleniumLibrary    run_on_failure=${False}
Library        Collections
Library        String
Variables      ../locators/productListPage.py
Variables      ../locators/productDetailPage.py

*** Keywords ***
Change Filter by Name A to Z
    Select From List By Value    ${selectSorting}    az
    ${value}  Get Selected List Values    ${selectSorting} 
    ${value}  Get From List    ${value}    0
    Should Be Equal As Strings    ${value}    az

Change Filter by Name Z to A
    Select From List By Value    ${selectSorting}    za
    ${value}  Get Selected List Values    ${selectSorting} 
    ${value}  Get From List    ${value}    0
    Should Be Equal As Strings    ${value}    za
    
Change Filter by Price High to Low
    Select From List By Value    ${selectSorting}    hilo
    ${value}  Get Selected List Values    ${selectSorting} 
    ${value}  Get From List    ${value}    0
    Should Be Equal As Strings    ${value}    hilo

Change Filter by Price Low to High
    Select From List By Value    ${selectSorting}    lohi
    ${value}  Get Selected List Values    ${selectSorting} 
    ${value}  Get From List    ${value}    0
    Should Be Equal As Strings    ${value}    lohi

User on Product Item Page
    ${page}=  Get Text    ${titlePage}
    Should Be Equal As Strings    ${page}    Products    ignore_case=True

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