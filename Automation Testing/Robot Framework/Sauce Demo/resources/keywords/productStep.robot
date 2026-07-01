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
