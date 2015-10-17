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
    Mouse Button Down    Left
    Mouse Button Up    Left
    Mouse Button Down    Middle
    Mouse Button Up    Middle
    Mouse Button Down    Right
    Mouse Button Up    Right