*** Settings ***
Documentation  Amazon top navigation
Resource  PO/LandingPage.resource
Resource  PO/SearchResults.resource
Resource  PO/TopNav.resource


*** Keywords ***
Search for Products
    LandingPage.Load
    TopNav.Search for Products
    SearchResults.Verify Search Completed
