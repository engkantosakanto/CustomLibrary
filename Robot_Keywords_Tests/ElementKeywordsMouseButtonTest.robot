*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       ElementKeywordsMouseButtonTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

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