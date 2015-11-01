*** Settings ***
Documentation     This suite covers the test cases for login logout functionality test of the Desktop App
Suite Setup       Set Default Pattern Library Directory
Default Tags      LoginLogoutFunctionalityTest    FUNCTIONAL    DESKTOPAPP    COLLABORATION
Resource          ../Resources/PageResources/desktop_app_login_logout.robot
Resource          ../Resources/PageResources/desktop_app_installation.robot
Resource          ../Resources/CommonResources/desktop_app_global_helper.robot

*** Variables ***
${freelancerUsername}           botFLNFTDTLogin
${freelancerFBUsername}         thecrimsonhog@gmail.com
${freelancerFBPassword}         PSalm23$$$
${freelancerInvalidUsername}    invalidUserName
${freelancerInvalidPassword}    invalidPassword

*** Test Cases ***
User Should Be Able to View the Update Checker
    Given The Freelancer Desktop App Is Installed
    When User Runs the Freelancer Desktop App
    Then The Update Checker Should Be Displayed
    [Teardown]    Close "Freelancer Desktop App" Application

User Should Successfully Login To The Windows Desktop App
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerUsername}" and Password "${PASSWORD}" Via "Login Page"
    Then User Should Be "Logged In" Successfully

User Should Successfully Logout From The Windows Desktop App
    Given User Is "Logged In"
    When User Logs Out From The Freelancer Desktop App
    Then User Should Be "Logged Out" Successfully
    [Teardown]    Close "Freelancer Desktop App" Application

User Should Successfully Login To The Windows Desktop App Via Facebook Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerFBUsername}" and Password "${freelancerFBPassword}" Via "Facebook Login"
    Then User Should Be "Logged In" Successfully
    [Teardown]    Close "Freelancer Desktop App" Application

User With Invalid Username Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerInvalidUsername}" and Password "${PASSWORD}" Via "Login Page"
    Then The "Login Invalid Username or Password" Alert Should Be Displayed
    [Teardown]    Close "Freelancer Desktop App" Application

User With Invalid Password Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerUsername}" and Password "${freelancerInvalidPassword}" Via "Login Page"
    Then The "Login Invalid Username or Password" Alert Should Be Displayed
    [Teardown]    Close "Freelancer Desktop App" Application

User With Blank Username Or Password Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${EMPTY}" and Password "${EMPTY}" Via "Login Page"
    Then The "Login Required Field" Alert Should Be Displayed
    [Teardown]    Close "Freelancer Desktop App" Application
