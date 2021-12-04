*** Settings ***
Documentation  test suite documentation
Library  Collections
Library  Dialogs
Library  RequestsLibrary
Library  SeleniumLibrary
Library  XML
Resource  ../Resources/MiscApp.resource


*** Variables ***
# case insensitive
@{MY_LIST_VARIABLE} =  First thing  Second thing
${XML_PATH} =  Inputs/XML/test.xml


*** Test Cases ***

Gherkin style test case
    [Documentation]  gherkin style test case
    # robot does not support regex on steps
    Given MiscApp.Echo  something
    And MiscApp.Echo  something else
    When MiscApp.Echo  something again
    Then MiscApp.Echo  different thing


Set variable in test case
    ${my_new_variable} =  Set Variable  My new variable
    Log  ${my_new_variable}


Access list variable 1
    Log  ${MY_LIST_VARIABLE}[0]
    Log  ${MY_LIST_VARIABLE}[1]


Access list variable 2
    @{my_list_variable} =  Create List  One  Two
    Log  ${my_list_variable}[0]
    Log  ${my_list_variable}[1]


Ignore failures and dialog demo
    ${new_browser} =  Get Selection From User  Which browser?  chrome  firefox
    Open Browser  http://www.amazon.com  ${new_browser}
    Run Keyword And Continue On Failure  Wait Until Page Contains  This text doesn't exist
    Repeat Keyword  2 times  MiscApp.Echo  Test kept going!
    Log Variables
    Close Browser


Get Requests JSON
    Create Session  github  http://api.github.com
    ${resp} =  GET On Session  github  /users/bpuderer
    Should Be Equal As Strings  ${resp.status_code}  200
    Log  ${resp.json()}
    ${json} =  Set Variable  ${resp.json()}
    Should Be Equal As Strings  ${json['name']}  Ben Puderer


XML Example
    [Tags]  Current

    # check attribute
    XML.Element Attribute Should Be  ${XML_PATH}  name  Eric Idle  actor[3]
    # or
    ${element} =  XML.Get Element  ${XML_PATH}  actor[3]
    Should Be Equal As Strings  ${element.attrib['name']}  Eric Idle

    # check text
    XML.Element Text Should Be  ${XML_PATH}  Leicester, England  actor[2]/birthplace
    # or
    ${element} =  XML.Get Element  ${XML_PATH}  actor[2]/birthplace
    Should Be Equal As Strings  ${element.text}  Leicester, England

    # element count
    ${count} =  XML.Get Element Count  ${XML_PATH}  actor
    Should Be Equal As Numbers  ${count}  5
