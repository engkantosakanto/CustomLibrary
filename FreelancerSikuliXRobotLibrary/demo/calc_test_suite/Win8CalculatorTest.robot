*** Settings ***
Suite Setup       Set Image Library    C:/demo/calc_image_library
Default Tags      Win8CalculatorTest
Library           FreelancerSikuliXRobotLibrary

*** Variables ***
${Button1}        1.png
${Button2}        2.png
${ButtonPlus}     plus.png
${ButtonEquals}    equals.png

*** Test Cases ***
Verify that 2 + 2 = 4
    Open Application    Calculator
    Set Application Focus    Calculator
    Click Pattern    ${Button2}
    Click Pattern    ${ButtonPlus}
    Click Pattern    ${Button2}
    Click Pattern    ${ButtonEquals}