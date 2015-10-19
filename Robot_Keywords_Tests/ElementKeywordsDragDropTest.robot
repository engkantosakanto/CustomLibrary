*** Settings ***
Suite Setup       Set Image Library    C:/CustomLibrary/Images
Default Tags      ElementKeywordsDragDropTest
Library           Remote    http://localhost:${PORT}
#Library           CustomRobotSikuliLibrary

*** Variables ***
${PORT}           8270
${APP_NAME}       Freelancer Desktop App
${LOGO}           freelancerlogo.png
${USERNAME_FIELD}    UsernameField.png

*** Test Cases ***
Drag and Drop
    Switch Application Focus    ${APP_NAME}
    Wait In Seconds    2
    Drag Pattern    ${LOGO}
    Drop At Pattern    ${USERNAME_FIELD}
    Drag And Drop    freelancerlogo.png    UsernameField.png

Drag and Drop At Coordinates
    Drag Pattern In Coordinates    freelancerlogo.png    10    10
    Drop Pattern At Coordinates    UsernameField.png    10    10

Drag and Drop xth Pattern
    Switch Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
    Drag xth Pattern In Active App    greenball.png = 0.99    1
    Drop At xth Pattern In Active App    greenball.png = 0.99    4
    Drag And Drop From Xth Pattern    greenball.png = 0.99    2    greenball.png = 0.99    6
    Drag And Drop From Xth Pattern    greenball.png = 0.99    4    redball.png = 0.99    2
