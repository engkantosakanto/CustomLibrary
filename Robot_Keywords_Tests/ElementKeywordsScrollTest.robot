*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Test Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Sikuli Methods Test
#    Set Image Library Directory    C:/CustomLibrary/Images
#    Open Application
#    ...    C:/Program Files (x86)/Freelancer.com/Freelancer Desktop App/freelancer-desktop-app.exe
#    ...    Freelancer Desktop App
    Set Application Focus    Facebook
    Hover At Pattern    Facebook.png
    Scroll From Pattern    Facebook.png    Down = 20
    Scroll From Pattern At Coordinates    Facebook.png    Down = 20    100    100
