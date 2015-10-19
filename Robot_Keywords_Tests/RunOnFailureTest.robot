*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Test Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Run On Failure Test

    Set Application Focus    Freelancer Desktop App
    Type Text In Pattern    UsernameField.png = 0.90    "Username"
    Type Text In Pattern    PasswordField.png = 0.90    "Password"