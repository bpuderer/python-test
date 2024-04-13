*** Settings ***
Name    Demo keyword arguments and importing from resource file
Resource    ../resources/test.resource


*** Test Cases ***
Keywords
    Keyword Arguments    ABC123
    Keyword Arguments    ABC123    XYZ456
    Keyword Arguments    ABC123    XYZ456    ${7}    ${true}    ${None}
    Keyword Arguments    ABC123    key=val
    ${temp} =    Keyword Return2    Greetings from ${TEST NAME} test!
    Log To Console    ${temp}


*** Keywords ***
Keyword Arguments
    [Arguments]    ${arg1}    ${arg2}=default arg2 val    @{varargs}    &{kwargs}
    Log To Console    First arg: ${arg1} Second arg: ${arg2} varargs: ${varargs} kwargs: ${kwargs}
