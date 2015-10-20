*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       ElementKeywordsScrollTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Sikuli Methods Test
    Set Application Focus    Facebook
    Hover At Pattern    Facebook.png
    Scroll From Pattern    Facebook.png    Down = 20
    Scroll From Pattern At Coordinates    Facebook.png    Down = 20    100    100
