*** Settings ***
Library    ../libraries/MyLibrary.py


*** Test Cases ***
Get Random UUID4 Using Test Library
    [Documentation]    Trivial as could just use Evaluate
    ${my_uuid} =  MyLibrary.Get Random Uuid
    Log To Console    ${my_uuid}

    ${temp} =    Evaluate    uuid.uuid4()    modules=uuid
    Log To Console    ${temp}
