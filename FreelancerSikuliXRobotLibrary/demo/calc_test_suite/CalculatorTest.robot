*** Settings ***
Library           FreelancerSikuliXRobotLibrary
Resource          CalculatorTestVariables.robot
Resource          CalculatorTestHelpers.robot
Suite Setup       Set Image Library    ${IMAGE_LIBRARY}
Test Setup        Setup Calculator App
Test Teardown     Close Application    Calculator
Default Tags      DemoTest

*** Test Cases ***
Verify that 9 * 9 = 81
    Given User Calculates "9" "Plus" "9"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "18"

Verify that 9 + 9 = 18
    Given User Calculates "9" "Times" "9"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "81"

Verify that 9 + 2 = 10
    Given User Calculates "9" "Plus" "2"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "11"

Verify that 9 * 2 = 18
    Given User Calculates "9" "Times" "2"
    When User Clicks "Equals" Button
    Then Actual Result Should Be Equal To "18"