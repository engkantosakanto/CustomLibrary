*** Settings ***
#Library           Remote    http://${HOST_IP}:${PORT}
Library            FreelancerSikuliXRobotLibrary
Default Tags       ScreenshotKeywordsTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen
    Capture Screenshot    freelancerlogo.png
