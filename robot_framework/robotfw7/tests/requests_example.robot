*** Settings ***
Documentation    https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
...
...              See Response Object section
Library  RequestsLibrary


*** Test Cases ***
Get Requests JSON
    #Create Session    github    https://api.github.com
    #${resp} =    GET On Session    github    /users/bpuderer    expected_status=200
    #Should Be Equal As Strings    ${resp.json()['location']}    Atlanta, GA

    ${resp2} =    GET    https://api.github.com/users/bpuderer    expected_status=200
    Should Be Equal As Strings    ${resp2.json()['location']}    Atlanta, GA
