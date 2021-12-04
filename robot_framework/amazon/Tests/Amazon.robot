*** Settings ***
Documentation  test suite documentation
Resource  ../Resources/Common.resource
Resource  ../Resources/AmazonApp.resource
#Suite Setup
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
#Suite Teardown


# https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
# $ robot -d Results -x xunit.xml -v BROWSER:firefox Tests
# -N set top level suite name
# -d reports dir
# -i include tag
# -t test   e.g. -t "Gherkin*"
# -v set variable
# -x xUnit XML
# -P append to python path.  Current path is not added automatically (???)...
# ...when using robot or python -m robot, python -m robot.run
# can also use relative paths as seen here


*** Variables ***
# robot framework variables are case insensitive
${BROWSER} =  firefox
${START_URL} =  http://www.amazon.com
${SEARCH_TERM} =  Soldering Iron


*** Test Cases ***
User should be able to search for a product
    [Documentation]  test case documentation
    [Tags]  Smoke

    AmazonApp.Search for Products
