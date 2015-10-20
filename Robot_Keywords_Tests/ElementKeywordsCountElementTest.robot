*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       ElementKeywordsCountElementTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images
#Suite Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Element Keywords Count Pattern Test
    Set Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
Count Patterns
    ${greenballs}=    Get Pattern Count In Active App    greenball.png = 0.99
    ${redballs}=    Get Pattern Count In Active App    redball.png = 0.99
Click A Pattern
    Click A Pattern In Active App    greenball.png = 0.99    1
    Click A Pattern In Active App    redball.png = 0.99    2