*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Suite Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Get Text In Pattern
    Switch Application Focus    Freelancer Desktop App
    ${text}=    Get Text In Pattern    LoginButton.png
Get Text In Pattern At 200px Area Right
    ${text}=    Get Text In Pattern At Location And Area    LoginButton.png    Right    200
Get Text In Pattern At 200px Area Left
    ${text}=    Get Text In Pattern At Location And Area    LoginButton.png    Left    200
Get Text In Pattern At 200px Area Above
    ${text}=    Get Text In Pattern At Location And Area    LoginButton.png    Above    200
Get Text In Pattern At 200px Area Below
    ${text}=    Get Text In Pattern At Location And Area    LoginButton.png    Below    200