*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Set App Focusy
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
Press Key
    Press Key    NUM0
    Press Key    NUM1
    Press Key    NUM2
    Press Key    NUM3
    Press Key    NUM4
    Press Key    NUM5
    Press Key    NUM6
    Press Key    NUM7
    Press Key    NUM8
    Press Key    NUM9
    Type String    I am a string
    Press Key N Times    BACKSPACE    10
    Press Key N Times    x    5
    Press Two Key Combination    CTRL    a
    Wait In Seconds    1
    Press Key    DELETE
    Press Key    TAB
    Press Key    hello world!
    Press Key    ENTER
    Wait In Seconds    1
    Press Two Key Combination    WIN    d
    Wait In Seconds    1
    Press Two Key Combination    WIN    r