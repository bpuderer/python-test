*** Test Cases ***
Data Driven Test
    [Documentation]    https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-templates
    [Template]  Parameterized Test Scenario
    1
    2
    3


*** Keywords ***
Parameterized Test Scenario
    [Arguments]  ${num}
    Log    Parameterized test: ${num}    WARN
