*** Settings ***
Documentation  Amazon landing page
Library  SeleniumLibrary


*** Keywords ***
Load
    Go To  ${START_URL}
    Wait Until Page Contains  Amazon.com, Inc.
