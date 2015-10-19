*** Settings ***
Suite Setup       Set Image Library    C:/CustomLibrary/Images
Default Tags      RunOnFailureTest
Library           Remote    http://localhost:${PORT}

*** Variables ***
${PORT}           8270

*** Test Cases ***
Run On Failure Test
    Set Application Focus    Freelancer Desktop App
    Type Text In Pattern    UsernameField.png = 0.90    "Username"
    Type Text In Pattern    PasswordField.png = 0.90    "Password"
