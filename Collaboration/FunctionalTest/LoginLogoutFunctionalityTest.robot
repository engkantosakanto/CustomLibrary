*** Settings ***
Documentation     This suite covers the test cases for login logout functionality test of the Freelancer Desktop App
Resource          ../Resources/CommonResources/desktop_app_global_setup.robot
Resource          ../Resources/PageResources/desktop_app_login_logout.robot
Resource          ../Resources/PageResources/desktop_app_installation.robot
Default Tags      LoginLogoutFunctionalityTest    FUNCTIONAL    DESKTOPAPP    COLLABORATION
Suite Setup       Freelancer Desktop App Suite Setup

*** Variables ***
${freelancerUsername}           botFLNFTDTLogin
${freelancerFBUsername}         fagunday+fb1@freelancer.com
${freelancerFBPassword}         francisagundayfb1
${freelancerInvalidUsername}    invalidUserName
${freelancerInvalidPassword}    invalidPassword

*** Test Cases ***
User Should Be Able to View the Update Checker
    Given The Freelancer Desktop App Is Installed
    When User Runs the Freelancer Desktop App
    Then The Update Checker Should Be Displayed
    [Teardown]    Close Freelancer Desktop App

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
    [Teardown]    Close Freelancer Desktop App

User Should Successfully Login To The Windows Desktop App Via Facebook Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerFBUsername}" and Password "${freelancerFBPassword}" Via "Facebook Login"
    Then User Should Be "Logged In" Successfully
    [Teardown]    Close Freelancer Desktop App

User With Invalid Username Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerInvalidUsername}" and Password "${PASSWORD}" Via "Login Page"
    Then The "Login Invalid Username or Password" Alert Should Be Displayed
    [Teardown]    Close Freelancer Desktop App

User With Invalid Password Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerUsername}" and Password "${freelancerInvalidPassword}" Via "Login Page"
    Then The "Login Invalid Username or Password" Alert Should Be Displayed
    [Teardown]    Close Freelancer Desktop App

User With Blank Username Or Password Should Not Be Able To Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${EMPTY}" and Password "${EMPTY}" Via "Login Page"
    Then The "Login Required Field" Alert Should Be Displayed
    [Teardown]    Close Freelancer Desktop App

User Should Be Able To View The Facebook Login Cancelled Alert
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User "Launches" Facebook Login
    And User "Cancels" Facebook Login
    Then The "FB Login Cancelled" Alert Should Be Displayed
    [Teardown]    Close Freelancer Desktop App
