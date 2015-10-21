*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       ElementKeywordsScrollTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***

Scroll X Steps
    Set Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
    Hover At Pattern At Coordinates    referencepattern.png    0    100
    Scroll X Steps    Down = 20
    Wait In Seconds    2
    Hover At Pattern At Coordinates    referencepattern.png    0    100
    Scroll X Steps    Up = 20
Scroll From Pattern
    Set Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
    Hover At Pattern At Coordinates    referencepattern.png    0    100
    Scroll From Pattern    referencepattern.png    Down = 10
    Hover At Pattern At Coordinates    referencepattern.png    0    100
    Scroll From Pattern At Coordinates    referencepattern.png    Down = 10    100    100
    Scroll From Pattern    referencepattern.png    Up = 20