*** Settings ***
Library    Collections


*** Variables ***
${my_var}     my_value
@{fruits}    Apple    Banana    Orange
@{colors}   Red    Yellow    Orange
&{my_dict}    name=username    password=securepswd


*** Test Cases ***
Looping Over List
    FOR    ${fruit}    IN    @{fruits}
        Log To Console    ${fruit}
    END

Looping Over Range
    [Documentation]    Loops over values from 1 to 4.
    FOR    ${index}    IN RANGE    1    5
        Log To Console    ${index}
    END

Looping Over List With Enumerate
    @{my_list} =  Create List
    Append To List  ${my_list}  first  second  third
    FOR    ${index}    ${item}    IN ENUMERATE    @{my_list}    start=1
        Log To Console    ${index}: ${item}
    END

Dictionary iteration with FOR loop
    FOR    ${key}    ${value}    IN    &{my_dict}
        Log To Console    ${key}: ${value}
    END

For Loop With Zip
    FOR    ${fruit}    ${color}    IN ZIP    ${fruits}    ${colors}
        Log To Console    ${fruit} ${color}
    END

While Loop
    [Documentation]    Limit is optional. Robot Framework has a default limit of 10K iterations
    ...
    ...                Example contains an inline IF and BREAK
    VAR    ${counter}    ${0}
    WHILE    ${counter} < 5    limit=10 seconds
        Log To Console    ${counter}
        ${counter} =    Evaluate    ${counter} + 1
    END
