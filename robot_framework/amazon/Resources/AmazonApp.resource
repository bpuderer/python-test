*** Settings ***
Documentation  Amazon top navigation
Resource  Resources/PO/LandingPage.resource
Resource  Resources/PO/SearchResults.resource
Resource  Resources/PO/TopNav.resource


*** Keywords ***
Search for Products
    LandingPage.Load
    TopNav.Search for Products
    SearchResults.Verify Search Completed
