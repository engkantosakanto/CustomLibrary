*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Element Keywords Click Test
    Set Application Focus    Freelancer Desktop App
Hover Test
    Hover at Pattern    LoginButton.png = 0.90
    Hover At Pattern At Coordinates    LoginButton.png = 0.90    0    10
Click Test
    Click Pattern    freelancerlogo.png = 0.90
    Click Pattern At Coordinates    freelancerlogo.png = 0.90    0    -10
Double-Click Test
    Double Click Pattern    freelancerlogo.png = 0.90
    Double Click Pattern At Coordinates    freelancerlogo.png = 0.90    0    -10
Right-Click Test
    Right Click Pattern    LoginButton.png = 0.90
    Click Pattern    freelancerlogo.png = 0.90
    #Right Click Pattern At Coordinates    LoginButton.png = 0.90    0    50
    Click Pattern    freelancerlogo.png = 0.90
Type in Username Field Test
    Type Text In Pattern    UsernameField.png = 0.90    "Username"
Type in Password Field Test
    Type Text In Pattern    PasswordField.png = 0.90    "Password"
    Type Text In Pattern At Coordinates    freelancerlogo.png = 0.90    "Offset"    0    300
    Paste Text In Pattern At Coordinates    freelancerlogo.png = 0.90    "Password"    0    400
#    Click Pattern    Password
#    Log Info    Hello World
#    Capture Active Window Screenshot
#    My Screenshot