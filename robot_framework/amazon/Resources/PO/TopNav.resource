*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary


*** Variables ***
${TOP_NAV_SEARCH_BUTTON} =  css=#nav-search > form > div.nav-right > div > input
${TOP_NAV_SEARCH_TEXT_BOX} =  id=twotabsearchtextbox


*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
    Input Text  ${TOP_NAV_SEARCH_TEXT_BOX}  ${SEARCH_TERM}

Submit Search
    Click Button  ${TOP_NAV_SEARCH_BUTTON}
