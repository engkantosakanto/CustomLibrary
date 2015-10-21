*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
Default Tags       KeyboardKeywordsTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Set App Focusy
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
Press Key
    Press Keyboard Key    NUM0
    Press Keyboard Key    NUM1
    Press Keyboard Key    NUM2
    Press Keyboard Key    NUM3
    Press Keyboard Key    NUM4
    Press Keyboard Key    NUM5
    Press Keyboard Key    NUM6
    Press Keyboard Key    NUM7
    Press Keyboard Key    NUM8
    Press Keyboard Key    NUM9
    Type String    I am a string
    Press Key N Times    BACKSPACE    10
    Press Key N Times    x    5
    Press Two Key Combination    CTRL    a
    Wait In Seconds    1
    Press Keyboard Key    DELETE
    Press Keyboard Key    TAB
    Press Keyboard Key    hello world!
    Press Keyboard Key    ENTER
    Wait In Seconds    1
    Press Two Key Combination    WIN    d
    Wait In Seconds    1
    Press Two Key Combination    WIN    r