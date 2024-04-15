*** Settings ***
Library    String


*** Variables ***
${ben home}    /home/ben


*** Test Cases ***
Get Random String Driver
    ${random_str} =    Get Random String
    Log To Console    ${random_str}

Strip String
    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#advanced-variable-features
    ${str} =    Set Variable    ${SPACE * 5}abc123${SPACE * 10}
    Log To Console    ${str.strip()}
    Log To Console    ${str.strip().upper()}
    Log To Console    \${str} value does not change: ${str}

Variables Inside Variables
    ${name} =    Set Variable    ben
    Log To Console    ${${name} home}


*** Keywords ***
Get Random String
    ${random_str} =    Generate Random String    16    [lower][numbers]~`!@#$%^&*()-_+={}[]|\;:"<>,./?
    RETURN    ${random_str}
