*** Settings ***
#Library           Remote    http://${HOST_IP}:${PORT}
Library            Remote    http://127.0.0.1:8082/
Default Tags       ScreenshotKeywordsTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen 0
    Capture Screenshot    freelancerlogo.png
    Capture Screenshot    Screen 1

    Set New Search Region In Active App    30, 150, -60, -512
    Capture Screenshot    lastROI

    Capture Screenshot    Screen 2
    Capture Screenshot    Screen 3
