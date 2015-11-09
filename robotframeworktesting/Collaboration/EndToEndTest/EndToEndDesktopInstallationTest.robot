*** Settings ***
Documentation     This suite is for the end to end installation of the Freelancer Desktop App
Resource          ../Resources/CommonResources/desktop_app_global_setup.robot
Resource          ../Resources/PageResources/desktop_app_login_logout.robot
Resource          ../Resources/PageResources/desktop_app_installation.robot
Default Tags      EndToEndDesktopInstallationTest    ENDTOEND    DESKTOP    COLLABORATION
Suite Setup       Freelancer Desktop App Suite Setup

*** Variables ***
${freelancerUsername}           botFLNFTDTLogin
${PASSWORD}                     free123
${freelancerFBUsername}         fagunday+fb1@freelancer.com
${freelancerFBPassword}         francisagundayfb1
${freelancerInvalidUsername}    invalidUserName
${freelancerInvalidPassword}    invalidPassword

*** Test Cases ***
Freelancer Desktop App Should Be Successfully Downloaded
    [Setup]    Setup Browser For Login Via "Home Page"
    Given User Navigates To "Freelancer Desktop App Download" Page
    When User Downloads The Freelancer Desktop App Installer
    Then The Freelancer Desktop App Installer Should Be Successfully Downloaded
    [Teardown]    Close Browser

Freelancer Desktop App Should Be Successfully Installed
    Given The Freelancer Desktop App Installer Exists In Download Directory
    When User Installs the Freelancer Desktop App
    Then The Freelancer Desktop App Should Be "Installed" Successfully

User Should Successfully Login To The Windows Desktop App
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerUsername}" and Password "${PASSWORD}" Via "Login Page"
    Then User Should Be "Logged In" Successfully
    [Teardown]    Close Freelancer Desktop App

User Should Successfully Login To The Windows Desktop App Via Facebook Login
    Given The Freelancer Desktop App Is Installed
    And User Runs the Freelancer Desktop App
    And User Is In Freelancer Desktop App Login Page
    When User Submits Credentials Username "${freelancerFBUsername}" and Password "${freelancerFBPassword}" Via "Facebook Login"
    Then User Should Be "Logged In" Successfully
    [Teardown]    Close Freelancer Desktop App

Freelancer Desktop App Should Be Successfully Uninstalled
    Given The Freelancer Desktop App Is Installed
    When User Uninstalls The Freelancer Desktop App
    Then The Freelancer Desktop App Should Be "Uninstalled" Successfully
    [Teardown]    User Deletes The Freelancer Desktop App Installer
