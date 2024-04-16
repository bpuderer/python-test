*** Settings ***
Name    Demo keyword arguments and importing from resource file
Library    DateTime
Resource    ../resources/helpers.resource


*** Test Cases ***
Keywords
    Keyword Arguments    ABC123
    Keyword Arguments    ABC123    XYZ456
    Keyword Arguments    ABC123    XYZ456    ${7}    ${true}    ${None}
    Keyword Arguments    ABC123    key=val
    ${temp} =    Keyword Return2    Greetings from ${TEST NAME} test!
    Log To Console    ${temp}

Return Val From Keyword
    ${temp} =    Get Current Date-time
    Log To Console    ${temp}


*** Keywords ***
Keyword Arguments
    [Arguments]    ${arg1}    ${arg2}=default arg2 val    @{varargs}    &{kwargs}
    Log To Console    First arg: ${arg1} Second arg: ${arg2} varargs: ${varargs} kwargs: ${kwargs}

Get Current Date-time
    ${date} =    Get Current Date    time_zone=UTC
    # [Return] is deprecated in Robot Framework 7.0
    RETURN    ${date}
