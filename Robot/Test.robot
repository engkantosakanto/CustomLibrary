*** Settings ***
Library           CustomRobotSikuliLibrary
Test Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Click an Image
#    Set Image Library Directory    C:/CustomLibrary/Images
#    Open Application
#    ...    C:/Program Files (x86)/Freelancer.com/Freelancer Desktop App/freelancer-desktop-app.exe
#    ...    Freelancer Desktop App
#    Set Application Focus    Freelancer Desktop App
    Click Element    UsernameField.png
    Log Info    Hello World
    Capture Active Window Screenshot
#    My Screenshot