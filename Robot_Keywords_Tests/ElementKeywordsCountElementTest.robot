*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
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
    Click Nth Pattern In Active App    greenball.png = 0.99    1
    Click Nth Pattern In Active App    redball.png = 0.99    2
Hover In A Pattern
    Hover At Nth Pattern In Active App    greenball.png = 0.99    1
    Hover At Nth Pattern In Active App    redball.png = 0.99    2
    Hover At Nth Pattern In Active App    greenball.png = 0.99    3
    Hover At Nth Pattern In Active App    redball.png = 0.99    4
    Hover At Nth Pattern In Active App    greenball.png = 0.99    5
    Hover At Nth Pattern In Active App    redball.png = 0.99    6
    Hover At Nth Pattern In Active App    greenball.png = 0.99    7
    Hover At Nth Pattern In Active App    redball.png = 0.99    8
    Hover At Nth Pattern In Active App    greenball.png = 0.99    9
    Hover At Nth Pattern In Active App    redball.png = 0.99    10
    Hover At Nth Pattern In Active App    greenball.png = 0.99    11
    Hover At Nth Pattern In Active App    redball.png = 0.99    12