*** Settings ***
Documentation  Here is the suite documentation
...            and it can continue with the ellipsis
Resource  ../Resources/keywords1.resource
Resource  ../Resources/keywords2.resource


*** Variables ***
${LONG_STRING}  Here is the start of the string
...             and more on the next line

&{TEST_USER}  FirstName=First  LastName=Last  email=first.last@foo.com
${ENVIRONMENT}  qa
&{URL}  dev=https://devenv.com  qa=https://qaenv.com  prod=https://prodenv.com


*** Test Cases ***
Duplicate Keyword Import Demo
    #Say My Name  # Multiple keywords with name 'Say My Name' found. Give the full name of the keyword you want to use: keywords1.Say My Name keywords2.Say My Name
    keywords1.Say My Name
    keywords2.Say My Name
    Log  Uses first value of 'somevar' it sees: ${somevar}  WARN
    Log Variables  WARN


Dictionaries
    Log  ${TEST_USER}  WARN
    Log  ${TEST_USER.FirstName}  WARN
    Log  ${URL.${ENVIRONMENT}}  WARN


Data Driven Test
    [Template]  Parameterized Test Scenario
    1
    2
    3


Spaces
    Should Be Equal  ${SPACE}  ${SPACE * 4}  # ${SPACE} is predefined


*** Keywords ***
Parameterized Test Scenario
    [Arguments]  ${num}
    Log  Parameterized test: ${num}  WARN
