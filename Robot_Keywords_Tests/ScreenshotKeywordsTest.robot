*** Settings ***
Suite Setup       Set Image Library    C:/CustomLibrary/Images
Default Tags      ScreenshotKeywordsTest
#Library           Remote    http://${HOST_IP}:${PORT}
Library           CustomRobotSikuliLibrary

*** Variables ***
${PORT}           8270
${HOST_IP}        127.0.0.1

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen
    Capture Screenshot    freelancerlogo.png
