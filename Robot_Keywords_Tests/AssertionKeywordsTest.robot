*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
Default Tags       AssertionKeywordsTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Assertion Keywords Tests
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
Assert Pattern Is Not Visible
    Assert Pattern Is Not Visible    Facebook.png = 0.8
    Assert Pattern Is Not Visible    freelancerlogo.png = 0.8
Assert Pattern Is Visible
    Switch Application Focus    Notepad
    Assert Pattern Is Visible    freelancerlogo.png = 0.8
    Assert Pattern Is Visible    LoginButton.png = 0.8
    Assert Pattern Is Visible    PasswordField.png = 0.8
    Assert Pattern Is Visible    UsernameField.png = 0.8
