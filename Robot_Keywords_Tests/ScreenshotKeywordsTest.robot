*** Settings ***
Suite Setup       Set Image Library    C:/CustomLibrary/Images
Force Tags
Default Tags      ScreenshotKeywordsTest
Library           Remote    http://localhost:${PORT}

*** Variables ***
${PORT}           8270

*** Test Cases ***
Sikuli Screenshot Test
    Set Application Focus    Freelancer Desktop App
    Capture Screenshot    Activeapp
    Capture Screenshot    Screen
    Capture Screenshot    freelancerlogo.png
