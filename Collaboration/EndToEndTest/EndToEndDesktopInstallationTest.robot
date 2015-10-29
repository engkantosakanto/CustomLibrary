*** Settings ***
Documentation     This suite is for the end to end installation of the Desktop App
Suite Setup       Set Default Pattern Library Directory
Suite Teardown    Close Browser
Default Tags      EndToEndDesktopInstallationTest    ENDTOEND    DESKTOP    COLLABORATION
Resource          ../Resources/PageResources/desktop_app_installation.robot
Resource          ../../Resources/CommonResources/global_helper.robot


*** Variables ***
${freelancerUsername}    botFLNFTDTLogin
${freelancerFBUsername}    thecrimsonhog@gmail.com
${freelancerInvalidUsername}    invalidUserName
${freelancerInvalidPassword}    invalidPassword

*** Test Cases ***
Freelancer Desktop App Should Be Successfully Downloaded
    [Setup]    Setup Browser For Login Via "Home Page"
    Given User Navigates To "Desktop App Download" Page
    When User Downloads The Desktop App Installer
    Then The Desktop App Installer Should Be Successfully Downloaded

Freelancer Desktop App Should Be Successfully Installed
    Given The Desktop App Installer Exists In Download Directory
    When User Runs the Desktop App Installer
    Then The Desktop App Installer Should Be Successfully Installed
    [Teardown]    Stop All Processes

User Should Successfully Login To The Desktop App
    Given The Desktop App Is Installed
    When User Runs The Freelancer Desktop App
    Then The Update Checker Should Be Displayed
    When User Is In Desktop App Login Page
    And User Submits Credentials Username "${freelancerUsername}" and Password "${PASSWORD}" via "Login Page"
    Then User Should Be Logged In Successfully
    When User Logs Out From The Desktop App
    Then User Should Be Successfully Logged Out
    [Teardown]    Close "Freelancer Desktop App" Application

User Should Successfully Login To The Desktop App Via Facebook Login
    Given The Desktop App Is Installed
    When User Runs the Desktop App
    Then The Update Checker Should Be Displayed
    When User Is In Desktop App Login Page
    And User "${freelancerUsername}" Logs In Via "Facebook Login"
    Then User Should Be Logged In Successfully
    When User Logs Out From The Desktop App
    User Should Be Successfully Logged Out
    [Teardown]    Close "Freelancer Desktop App" Application

Freelancer Desktop App Should Be Successfully Uninstalled
    Given The Desktop App Is Installed
    User Uninstalls The Desktop App
    The Desktop App Installer Should Be Successfully Uninstalled
    [Teardown]    Run Keywords    User Deletes TheDesktop App Installer    Stop All Processes
