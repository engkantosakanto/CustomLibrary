*** Settings ***
#Library           Remote    http://${HOST_IP}:${PORT}
Library            FreelancerSikuliXRobotLibrary
Default Tags       ScreenshotKeywordsTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen 0
    Capture Screenshot    freelancerlogo.png
    Capture Screenshot    Screen 1
    Capture Screenshot    Screen 2
    Capture Screenshot    Screen 3
