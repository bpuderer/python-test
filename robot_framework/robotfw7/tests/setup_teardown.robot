*** Settings ***
Name    Setup and Teardown Demo
Suite Setup       Log To Console    Suite Setup
Test Setup        Log To Console    Settings Test Setup
Test Teardown     Log To Console    Settings Test Teardown
Suite Teardown    Log To Console    Suite Teardown
# use Builtin Run Keywords to execute multiple keywords in a sequence


*** Test Cases ***
Test With Own Setup And Teardown
    [Setup]           Log To Console    TC setup
    [Teardown]        Log To Console    TC teardown
    Log To Console    Test [Setup] and [Teardown] override Settings Test Setup and Test Teardown


Test With No Setup And Teardown Set
    Log To Console    Uses Settings Test Setup and Test Teardown
