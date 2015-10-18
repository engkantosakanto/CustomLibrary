*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Test Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen
    Capture Screenshot    freelancerlogo.png