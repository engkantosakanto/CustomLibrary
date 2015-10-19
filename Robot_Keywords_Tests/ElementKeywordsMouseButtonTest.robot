*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

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