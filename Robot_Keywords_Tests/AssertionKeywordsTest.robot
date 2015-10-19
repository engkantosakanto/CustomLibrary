*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Assertion Keywords Tests
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
Assert Pattern Is Visible
    Assert Pattern Is Visible    freelancerlogo.png = 0.8
    Assert Pattern Is Visible    LoginButton.png = 0.8
    Assert Pattern Is Visible    PasswordField.png = 0.8
    Assert Pattern Is Visible    UsernameField.png = 0.8
Assert Pattern Is Not Visible
    Assert Pattern Is Not Visible    Facebook.png = 0.8