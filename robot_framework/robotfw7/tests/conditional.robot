*** Test Cases ***
If - Else If - Else Example
    VAR    ${temp}    ${0}
    IF    ${temp} > 0
        Log To Console    Positive
    ELSE IF    ${temp} < 0
        Log To Console    Negative
    ELSE
        Log To Console    Zero
    END

Inline If Statement
    VAR    ${counter2}    ${0}
    WHILE    ${counter2} != 999    limit=10 seconds
        Log To Console    ${counter2}
        ${counter2} =    Evaluate    ${counter2} + 1
        IF    ${counter2} == 3    BREAK
    END

# TODO: Try / Except / Else / Finally
# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#try-except-syntax
