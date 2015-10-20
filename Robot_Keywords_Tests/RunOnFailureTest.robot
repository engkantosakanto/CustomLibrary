*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       RunOnFailureTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Run On Failure Test
    Set Application Focus    Freelancer Desktop App
    Type Text In Pattern    UsernameField.png = 0.90    "Username"
    Type Text In Pattern    PasswordField.png = 0.90    "Password"
