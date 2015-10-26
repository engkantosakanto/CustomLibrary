*** Settings ***
Library           FreelancerSikuliXRobotLibrary
Resource          CalculatorTestVariables.robot

*** Keywords ***

User Clicks "${p_button_name}" Button
    Get Dir Based On OS Type and Version
    Wait Until Keyword Succeeds    10    5    Click Pattern    ${t_IMAGE_DIRECTORY}/${Button_${p_button_name}}

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
    Wait Until Keyword Succeeds    10    5    Set Application Focus    Calculator

Get Dir Based On OS Type and Version
    ${OS_type_version} =    Get Env OS Type And Version
    ${tc_image_directory} =    Set Variable If
    ...    '${OS_type_version}' == 'WINDOWS 6.1'    Win7
    ...    '${OS_type_version}' == 'WINDOWS 6.3'    Win8
    Set Test Variable    ${t_IMAGE_DIRECTORY}    ${tc_image_directory}
