*** Settings ***
Library           Remote    http://localhost:${PORT}
Default Tags      WaitingKeywordsTest
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Wait In Seconds
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    10
Wait For Pattern To Be Visible
    Wait For Pattern To Be Visible    PasswordField.png = 0.8
Wait Until Pattern Is Visible In 10 seconds
    Wait Until Pattern Is Visible    PasswordField.png = 0.8    10
Wait Until Pattern Is Visible Forever
    Wait Until Pattern Is Visible    PasswordField.png = 0.8    FOREVER
Wait Until Pattern Vanish in 10 seconds
    Wait Until Pattern Vanish    PasswordField.png = 0.8    10
Wait For Pattern To Vanish
    Wait For Pattern To Vanish    PasswordField.png = 0.8
Wait Until Pattern Vanish FOREVER
    Wait Until Pattern Vanish    PasswordField.png = 0.8    FOREVER