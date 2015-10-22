*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
Default Tags       ElementKeywordsDragDropTest
Suite Setup        Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Drag and Drop
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    2
    Drag Pattern    freelancerlogo.png
    Drop At Pattern    UsernameField.png
    Drag And Drop Element    freelancerlogo.png    UsernameField.png
Drag and Drop At Coordinates
    Drag Pattern In Coordinates    freelancerlogo.png    10    10
    Drop Pattern At Coordinates    UsernameField.png    10    10
Drag and Drop nth Pattern
    Switch Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
    Drag nth Pattern In Active App    greenball.png = 0.99    1
    Drop At nth Pattern In Active App    greenball.png = 0.99    4
    Drag And Drop From nth Pattern    greenball.png = 0.99    2    greenball.png = 0.99    6
    Drag And Drop From nth Pattern    greenball.png = 0.99    4    redball.png = 0.99    2