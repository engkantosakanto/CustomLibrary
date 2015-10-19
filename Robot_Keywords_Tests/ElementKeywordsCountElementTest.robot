*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Element Keywords Count Pattern Test
    Set Application Focus    Availability Tests [Jenkins] - Mozilla Firefox
Count Patterns
    ${greenballs}=    Get Pattern Count In Active App    greenball.png = 0.99
    ${redballs}=    Get Pattern Count In Active App    redball.png = 0.99
Click A Pattern
    Click A Pattern In Active App    greenball.png = 0.99    1
    Click A Pattern In Active App    redball.png = 0.99    2