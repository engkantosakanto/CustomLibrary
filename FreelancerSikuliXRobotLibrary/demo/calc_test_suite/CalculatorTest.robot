*** Settings ***
Suite Setup       Set Image Library    C:/CustomLibrary/FreelancerSikuliXRobotLibrary/demo/calc_image_library
Test Setup        Setup Calculator App
Test Teardown     Close Application    Calculator
Default Tags      CalculatorTest
Library           FreelancerSikuliXRobotLibrary

*** Variables ***
${Button_2}       2.png
${Button_9}       9.png
${Button_Plus}    plus.png
${Button_Equals}    equals.png
${Button_Times}    multiply.png
${Button_Clear}    c.png

*** Test Cases ***
Verify that 9 * 9 = 81
    Given User Calculates "9" "Plus" "9"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "18"

Verify that 9 + 9 = 18
    Given User Calculates "9" "Times" "9"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "81"

*** Keywords ***
User Clicks "${p_button_name}" Button
    Wait Until Keyword Succeeds    20    5    Click Pattern    ${Button_${p_button_name}}

Actual Result Should Be Equal To "${p_expected_result}"
    Set New Search Region In Active App    23, 80, -45, -304
    ${ACTUAL_ANSWER}=    Get Text In Search Region    Region
    Should Be Equal    ${ACTUAL_ANSWER}    ${p_expected_result}

User Calculates "${p_num1}" "${p_operation}" "${p_num2}"
    User Clicks "${p_num1}" Button
    User Clicks "${p_operation}" Button
    User Clicks "${p_num2}" Button

Setup Calculator App
    Open Application    C:/Windows/System32/calc.exe    Calculator
    Wait Until Keyword Succeeds    20    5    Set Application Focus    Calculator
