*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Suite Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Drag and Drop
    Switch Application Focus    Freelancer Desktop App
    Wait In Seconds    1
    Drag Pattern    freelancerlogo.png
    Drop At Pattern    UsernameField.png
    Drag Pattern In Coordinates    freelancerlogo.png    10    10
    Drop Pattern At Coordinates    UsernameField.png    10    10