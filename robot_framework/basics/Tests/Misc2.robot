*** Settings ***
Library  ../Libraries/MyCustomLibrary.py

Library  Collections
Library  Dialogs
Library  OperatingSystem
Library  String


*** Test Cases ***
Looping Demo
    #[Tags]  current
    @{my_list} =  Create List
    Append To List  ${my_list}  4  5  87

    Log  my_list: @{my_list}
    Log  third item: ${my_list}[2]
    Log  ${my_list}[1:]
    Log Many  @{my_list}[1:]

    #Pause Execution

    FOR  ${list_item}  IN  @{my_list}
        Log  ${list_item}
    END

    FOR  ${i}  IN RANGE  1  4
        Log To Console  i: ${i}
    END

    FOR  ${i}  IN RANGE  1  10
        Run Keyword If  ${i} == 3  Continue For Loop  # continue
        Run Keyword If  ${i} == 7  Exit For Loop      # break
        Log To Console  i: ${i}
    END

Parameters And Custom Keyword
    #[Tags]  current
    ${time} =  Echo Text And Get Time  Log This!
    Log  ${time}

    ${temp} =  Do Something Special  ${time}
    Log  ${temp}

Conditionals
    #[Tags]  current
    ${temp} =  Set Variable  42
    Run Keyword If  ${temp} > 42  Log  Greater than 42
    ...  ELSE IF  ${temp} < 42  Log  Less than 42
    ...  ELSE  Log  Equal to 42!

Repeat Keywords
    #[Tags]  current
    Repeat Keyword  3  Log  Repeating3
    Repeat Keyword  2 times  Log  Repeating2
    Repeat Keyword  4x  Log  Repeating4

String Example
    [Tags]  current
    ${test_str} =  Set Variable  blah var=97897987"
    # https://regex101.com/
    # https://robotframework.org/robotframework/latest/libraries/String.html#Get%20Regexp%20Matches
    ${one_group} =  Get Regexp Matches  ${test_str}  var=(.+?)"  1
    Log To Console  ${one_group}[0]

Read JSON File
    # NOTE: Path to file is from where robot is run, not from this file
    #${json} =  Get File  Inputs/JSON/test.json
    #${object} =  Evaluate  json.loads('''${json}''')  json
    ${object} =  Evaluate  json.load(open("Data/JSON/test.json", "r"))  json
    Log  Name: ${object["first_name"]} ${object["last_name"]}  WARN




*** Keywords ***
Echo Text And Get Time
    [Arguments]  ${text}
    Log  ${text}
    ${time} =  Get Time
    [Return]  ${time}
