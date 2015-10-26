*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
Default Tags       ElementKeywordsReadTextTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Get Text In Pattern
    Switch Application Focus    Freelancer Desktop App
    ${text}=    Get Text In Pattern    LoginButton.png    Region
    ${text}=    Get Text In Pattern    LoginButton.png    Left = 200
    ${text}=    Get Text In Pattern    LoginButton.png    Right = 300
    ${text}=    Get Text In Pattern    LoginButton.png    Above = 400
    ${text}=    Get Text In Pattern    LoginButton.png    Below = 500
Get Text In Region
    Switch Application Focus    Calculator
    Set New Search Region In Active App    10, 60, -20, -270
    ${text}=    Get Text In Search Region    Region
    ${text}=    Get Text In Search Region    Left = 200
    ${text}=    Get Text In Search Region    Right = 200
    ${text}=    Get Text In Search Region    Above = 200
    ${text}=    Get Text In Search Region    Below = 200
Get Text In Pattern
    Switch Application Focus    Freelancer Desktop App
    ${text}=    Get Text In Pattern    PasswordField.png    Region
    ${text}=    Get Text In Pattern    PasswordField.png    Left = 200
    ${text}=    Get Text In Pattern    PasswordField.png    Right = 300
    ${text}=    Get Text In Pattern    PasswordField.png    Above = 400
    ${text}=    Get Text In Pattern    PasswordField.png    Below = 500