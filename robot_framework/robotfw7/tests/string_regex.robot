*** Settings ***
Library    String


*** Test Cases ***
String Example
    ${test_str} =    Set Variable    blah var=97897987"
    # https://regex101.com/
    # https://robotframework.org/robotframework/latest/libraries/String.html#Get%20Regexp%20Matches
    ${one_group} =    Get Regexp Matches    ${test_str}    var=(.+?)"    1
    Log To Console  ${one_group}[0]
