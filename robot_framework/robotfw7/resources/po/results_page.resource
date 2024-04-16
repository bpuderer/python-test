*** Keywords ***
Confirm Results Page Title
    [Arguments]    ${search_value}
    Wait Until Page Contains    results
    ${page_title} =    Get Title
    Should Be Equal As Strings    ${search_value} - Google Search    ${page_title}
