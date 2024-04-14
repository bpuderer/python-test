*** Settings ***
Documentation    $ robot -i Smoke -i Exhaustive -d reports tests/tags.robot
...
...              Using Tag names with variables does not seem to work
...              even though it is included in the documentation:
...              https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tagging-test-cases
...
...              Reported issue:
...              https://github.com/robotframework/robotframework/issues/2343
...
...              WORKS: $ robot -i host:* -d reports tests/tags.robot
...
...              FAILS: $ robot -i host:1* -d reports tests/tags.robot
...
...              FAILS: $ robot -i host:1.2.3.4 -d reports tests/tags.robot
Test Tags    functional


*** Variables ***
${HOST}    1.2.3.4


*** Test Cases ***
Own Smoke Tag
    [Tags]    smoke
    No Operation

Own Smoke and Regression Tags
    [Tags]    smoke    regression
    No Operation

Own Regression Tag
    [Tags]    regression
    No Operation

Own Exhaustive Tag
    [Tags]    exhaustive
    No Operation

Own Host Tag With Variable
    [Tags]    host:${HOST}
    Log To Console    ${TEST_TAGS}

No Own Tags
    No Operation

No Own Tags And Removed Settings Level 'functional' Tag
    [Tags]    -functional
    No Operation
