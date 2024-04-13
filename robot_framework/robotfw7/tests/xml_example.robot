*** Settings ***
Documentation    https://robotframework.org/robotframework/latest/libraries/XML.html
Library  XML


*** Variables ***
${XML_PATH}    data/xml/test.xml


*** Test Cases ***
XML Example
    # check attribute
    XML.Element Attribute Should Be    ${XML_PATH}    name    Eric Idle    actor[3]
    # or
    ${element} =    XML.Get Element    ${XML_PATH}    actor[3]
    Should Be Equal As Strings    ${element.attrib['name']}    Eric Idle

    # check text
    XML.Element Text Should Be    ${XML_PATH}    Leicester, England    actor[2]/birthplace
    # or
    ${element} =    XML.Get Element    ${XML_PATH}    actor[2]/birthplace
    Should Be Equal As Strings    ${element.text}    Leicester, England

    # element count
    ${count} =    XML.Get Element Count    ${XML_PATH}    actor
    Should Be Equal As Numbers    ${count}    5
