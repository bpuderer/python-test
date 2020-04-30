*** Settings ***
Documentation  Amazon search results
Library  SeleniumLibrary


*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  results for "${SEARCH_TERM}"
    Sleep  2s  # just to see page before test closes
