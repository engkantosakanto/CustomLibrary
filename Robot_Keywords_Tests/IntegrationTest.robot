*** Settings ***
Library            CustomRobotSikuliLibrary
Library            Remote    http://127.0.0.1:8270
Default Tags       IntegrationTest

*** Test Cases ***
Open Browser Then Switch To Desktop App
    Open Browser    https://www.google.com    firefox
    Input Text    id = 1st-ib    Test
    Press Key    ENTER
    Switch Application Focus    Freelancer Desktop App
