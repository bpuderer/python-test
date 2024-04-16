*** Settings ***
Library     SeleniumLibrary
Resource    settings.resource


*** Keywords ***
Configure Selenium
     Set Selenium Speed    ${selenium_speed}

Navigate To Homepage
    Open Browser    ${baseurl}    ${browser}
    Wait Until Page Contains    Gmail
    Page Should Contain Button    Google Search
    Page Should Contain Button    I'm Feeling Lucky
    Page Should Contain Link    Privacy
    Page Should Contain Link    Terms
    Maximize Browser Window

Exit Selenium
    Capture Page Screenshot
    Close Browser
