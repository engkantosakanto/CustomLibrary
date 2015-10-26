*** Settings ***
#Library           Remote    http://${HOST_IP}:${PORT}
Library           FreelancerSikuliXRobotLibrary
Default Tags      WaitingKeywordsTest
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Wait In Seconds
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    10
Wait For Pattern To Be Visible
    Wait For Pattern To Be Visible    PasswordField.png = 0.8
    Switch Application Focus    Calculator
    Wait For Pattern To Be Visible    calc.png
Wait Until Pattern Is Visible In 10 seconds
    Switch Application Focus    Calculator
    Wait Until Pattern Is Visible    calc.png    10
    Switch Application Focus    Freelancer Desktop App
    Wait Until Pattern Is Visible    PasswordField.png = 0.8    10
Wait Until Pattern Is Visible Forever
    Wait Until Pattern Is Visible    PasswordField.png = 0.8    FOREVER
Wait Until Pattern Vanish in 10 seconds
    Wait Until Pattern Vanish    PasswordField.png = 0.8    10
Wait For Pattern To Vanish
    Wait For Pattern To Vanish    PasswordField.png = 0.8
Wait Until Pattern Vanish FOREVER
    Wait Until Pattern Vanish    PasswordField.png = 0.8    FOREVER