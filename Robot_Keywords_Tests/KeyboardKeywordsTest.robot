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
    Press Keyboard Keys    NUM0
    Press Keyboard Keys    NUM1
    Press Keyboard Keys    NUM2
    Press Keyboard Keys    NUM3
    Press Keyboard Keys    NUM4
    Press Keyboard Keys    NUM5
    Press Keyboard Keys    NUM6
    Press Keyboard Keys    NUM7
    Press Keyboard Keys    NUM8
    Press Keyboard Keys    NUM9
    Type String    I am a string
    Press Key N Times    BACKSPACE    10
    Press Key N Times    x    5
    Press Keyboard Keys    CTRL + a
    Wait In Seconds    1
    Press Keyboard Keys    DELETE
    Press Keyboard Keys    TAB
    Press Keyboard Keys    hello world!
    Press Keyboard Keys    ENTER
    Wait In Seconds    1
    Press Keyboard Keys    WIN + d
    Wait In Seconds    1
    Press Keyboard Keys    WIN + r
    Press Keyboard Keys    CTRL + ALT + DELETE