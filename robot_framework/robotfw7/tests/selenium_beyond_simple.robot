*** Settings ***
Documentation    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Resource         ../resources/selenium_setup.resource
Resource         ../resources/po/google_home_page.resource
Resource         ../resources/po/results_page.resource
Test Setup       Run Keywords    Configure Selenium    Navigate To Home Page
Test Teardown    Exit Selenium


*** Test Cases ***
SeleniumLibrary Sanity Check
    VAR    ${search_value}    electric guitar
    #Run Keyword And Continue On Failure  Wait Until Page Contains  This text doesn't exist
    Enter Text In Search Field    ${search_value}
    #Click Suggestion    amp
    Click Google Search Button
    Confirm Results Page Title    ${search_value}
