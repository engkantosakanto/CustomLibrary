*** Settings ***
Library            FreelancerSikuliXRobotLibrary
#Library            Selenium2Library
Library            Remote    http://127.0.0.1:8081

Default Tags       IntegrationTest

*** Variables ***
${FF_PROFILE}    C:/FFProfile

*** Test Cases ***
Integration Test
    Open Browser    https://www.google.com    firefox
    Wait Until Keyword Succeeds    10    5    Input Text    id = lst-ib    Test
    Press Keyboard Keys    ENTER
    Switch Application Focus    Freelancer Desktop App
