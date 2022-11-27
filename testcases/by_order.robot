*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.0s

*** Test Cases ***
robotframework-testing_selenium-002
    [Setup]  Run Keywords  Open Browser  https://ppe-shoponline.lotuss.com/th  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    Wait Until Element Is Visible   //*[@id="header-login-link"] 
    click    xpath=//*[@id="header-login-link"]
    Wait Until Element Is Visible  xpath=//input[@id="username"]
    click    xpath=//input[@id="username"]
    type    xpath=//input[@id="username"]    0525100015
    Wait Until Element Is Visible  xpath=//input[@id='password']
    click    xpath=//input[@id='password']
    type    xpath=//input[@id='password']    Lotus@1234
    Wait Until Element Is Visible  id=login
    click    id=login
    Wait Until Element Is Visible  //*[@id="spa-root"]/div[2]/div/div/div/div[2]/button  5s
    click    //*[@id="spa-root"]/div[2]/div/div/div/div[2]/button
    Wait Until Element Is Visible  id=product-card-undefined  20s    
    click    id=product-card-undefined
    Wait Until Element Is Visible  xpath=//button[@id='add-to-cart-btn-0']/span
    click    xpath=//button[@id='add-to-cart-btn-0']/span
    Wait Until Element Is Visible  xpath=//div[@id='delivery-method-schedule-for-later-btn']/div[2]/div/div/p
    click    xpath=//div[@id='delivery-method-schedule-for-later-btn']/div[2]/div/div/p
    Wait Until Element Is Visible  xpath=//div[@id='delivery-type-home-delivery-btn']/div[2]/div/div/p
    click    xpath=//div[@id='delivery-type-home-delivery-btn']/div[2]/div/div/p
    Wait Until Element Is Visible  xpath=//div[@id='content-select-address']/div[2]
    click    xpath=//div[@id='content-select-address']/div[2]
    Wait Until Element Is Visible  id=branch-select-pre-order
    click    id=branch-select-pre-order
    Wait Until Element Is Visible  id=slot-booking
    sleep  3s
    click    id=slot-booking
    Wait Until Element Is Visible  xpath=//div[@id='content-select-address']/div[2]
    click    xpath=//div[@id='content-select-address']/div[2]
    Wait Until Element Is Visible  id=branch-select-pre-order
    click    id=branch-select-pre-order
    Wait Until Element Is Visible  id=book-slot-id-1
    click    id=book-slot-id-1
    Wait Until Element Is Visible   id=confirm-pickuptime-pre-order
    click    id=confirm-pickuptime-pre-order
    Wait Until Element Is Visible  xpath=//div[@id='cart-icon-button']/div/div/div
    click    xpath=//div[@id='cart-icon-button']/div/div/div
    Wait Until Element Is Visible  xpath=//img[@alt='cart-icon']
    click    xpath=//img[@alt='cart-icon']
    Wait Until Element Is Visible  id=cart-check-out
    click    id=cart-check-out
    Wait Until Element Is Visible  xpath=//img[@alt='Pay on Delivery']
    click    xpath=//img[@alt='Pay on Delivery']
    Wait Until Element Is Visible  id=place-order-order-summary
    click    id=place-order-order-summary
    Wait Until Element Is Visible  id=back-to-homepage-btn
    click    id=back-to-homepage-btn
    Wait Until Element Is Visible  id=subheader-order-history
    click    id=subheader-order-history
    # [Teardown]  Close Browser

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
