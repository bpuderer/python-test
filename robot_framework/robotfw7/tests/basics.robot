*** Settings ***
Name    Custom Suite Name For basics.robot
Metadata    Free Suite Metadata    Shows as documentation in reports
Metadata    Robot Framework    7.0
Library    Dialogs
Library    Collections
Resource    ../resources/helpers.resource
Resource    ../resources/settings.resource


*** Variables ***
@{my_list}    Apple    Banana    Orange
&{my_dict}    name=my_value1    password=my_value2


*** Test Cases ***
Hello World Test
    [Documentation]    Hello world test obviously
    ...
    ...                Second line of documentation
    Log    Hello world!
    Log To Console    Hello world! Console edition
    Log Variables


Hello World Test 2
    ${str}     Set Variable    Hello world 2! Console edition
    Log To Console    ${str}
    Dialogs.Execute Manual Step    Choose wisely


List Slice
    # The returned list can be assigned both to ${scalar} and @{list} variables.
    @{items} =    Create List    first    second    third
    ${items}[-1]    Set Variable    last
    Log To Console    ${items}[-1]
    Log Many    @{items}[1:]
    Log Many    ${items}[1:]


Dict
    &{dict1} =     Create Dictionary    key1=dict1val1
    Set To Dictionary    ${dict1}    key2=dict1val2
    Log To Console    ${dict1}[key1]
    Log To Console    ${dict1.key2}
    Dictionary Should Contain Item    ${dict1}    key1    dict1val1
    Dictionary Should Contain Item    ${dict1}    key2    dict1val2
    ${val} =    Get From Dictionary    ${dict1}    key1
    Log To Console    ${val}

    ${dict2} =     Create Dictionary    key1=dict2val1
    ${dict2.key2} =    Set Variable    key2=dict2val2
    Log To Console    ${dict2.key1}
    Log To Console    ${dict2.key2}


Env Variables
    Log    %{PATH}


Eval
    ${nested} =    Evaluate    [['a', 'b', 'c'], {'key': ['x', 'y']}]
    Log    ${nested}[1][key][0]


Variables Section Demo
    # ${my_var} is defined in settings.resource
    Log    ${my_var}
    Log    ${my_list}
    Log    ${my_dict}


Variable From Command Line
    # robot -v from_command_line:123 hw.robot
    # global and overrides
    # Log To Console   ${from_command_line}
    No Operation


New For RF7 - VAR
    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#var-syntax
    # The VAR marker is case-sensitive and it must be followed by a variable name and value.
    VAR    ${my_var2}     my_value
    VAR    @{my_list2}    Apple    Banana    Orange
    VAR    &{my_dict2}    name=my_value1    password=my_value2
    Log To Console    ${my_var2}
    Log To Console    ${my_list2}
    Log To Console    ${my_dict2}
