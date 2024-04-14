# Resource files cannot have tests
*** Variables ***
${my_var}     my_value


*** Keywords ***
Keyword Return2
    [Arguments]    ${arg}
    RETURN    You sent: ${arg}
