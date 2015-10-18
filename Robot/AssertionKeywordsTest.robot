*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Suite Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Assertion Tests
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
    Assert Pattern Is Visible    freelancerlogo.png = 0.8
    Assert Pattern Is Visible    LoginButton.png = 0.8
    Assert Pattern Is Visible    PasswordField.png = 0.8
    Assert Pattern Is Visible    UsernameField.png = 0.8
    Assert Pattern Is Not Visible    Facebook.png = 0.8