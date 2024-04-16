*** Variables ***
${search_field_locator}    css:textarea[title="Search"]


*** Keywords ***
Enter Text In Search Field
    [Arguments]    ${text}
    Input Text     ${search_field_locator}    ${text}

Click Google Search Button
    Click Button    Google Search

Click Suggestion
    [Arguments]      ${text}
    Click Element    xpath://span[b=" ${text}"]
