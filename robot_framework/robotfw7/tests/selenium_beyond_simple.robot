*** Settings ***
Documentation    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library  SeleniumLibrary


*** Test Cases ***
SeleniumLibrary Sanity Check
    #${new_browser} =  Get Selection From User  Which browser?  chrome  firefox
    #Open Browser  https://www.google.com  ${new_browser}
    Open Browser    https://www.google.com    chrome
    Set Selenium Speed    1s
    #Run Keyword And Continue On Failure  Wait Until Page Contains  This text doesn't exist
    Wait Until Page Contains    Gmail
    Page Should Contain Button    Google Search
    Page Should Contain Button    I'm Feeling Lucky
    Page Should Contain Link    Privacy
    Page Should Contain Link    Terms
    Input Text    css:textarea[title="Search"]    electric guitar
    Click Element    xpath://span[b=" amp"]
    Capture Page Screenshot
    Close Browser
