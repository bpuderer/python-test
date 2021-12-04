*** Keywords ***

Echo
    [Arguments]  ${echo_text}
    Log  ${echo_text}  level=WARN
