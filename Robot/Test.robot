*** Settings ***
Library           CustomRobotSikuliLibrary
Test Setup        Set Image Library    C:/CustomLibrary/Images
#Test Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Click an Image
#    Set Image Library Directory    C:/CustomLibrary/Images
#    Open Application
#    ...    C:/Program Files (x86)/Freelancer.com/Freelancer Desktop App/freelancer-desktop-app.exe
#    ...    Freelancer Desktop App
    Set Application Focus    Freelancer Desktop App
    Hover at Pattern    LoginButton.png = 0.90
    Hover At Pattern At Coordinates    LoginButton.png = 0.90    0    50
    Click Pattern    freelancerlogo.png = 0.90
    Click Pattern At Coordinates    freelancerlogo.png = 0.90    0    -50
    Double Click Pattern    freelancerlogo.png = 0.90
    Double Click Pattern At Coordinates    freelancerlogo.png = 0.90    0    -50
    #Right Click Pattern    LoginButton.png = 0.90
    Click Pattern    freelancerlogo.png = 0.90
    #Right Click Pattern At Coordinates    LoginButton.png = 0.90    0    50
    Click Pattern    freelancerlogo.png = 0.90
    Type Text In Pattern    UsernameField.png = 0.90    "Username"
    Type Text In Pattern    PasswordField.png = 0.90    "Password"

    Type Text In Pattern At Coordinates    freelancerlogo.png = 0.90    "Offset"    0    300
    Paste Text In Pattern At Coordinates    freelancerlogo.png = 0.90    "Password"    0    400
#    Click Pattern    Password
#    Log Info    Hello World
#    Capture Active Window Screenshot
#    My Screenshot