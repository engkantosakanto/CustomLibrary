*** Settings ***
Documentation     This suite is for the end to end installation of the Desktop App
Resource          ../Resources/CommonResources/desktop_app_global_setup.robot
Resource          ../Resources/PageResources/desktop_app_login_logout.robot
Resource          ../Resources/PageResources/desktop_app_installation.robot
Suite Setup       Freelancer Desktop App Suite Setup
Default Tags      Debugging

*** Variables ***
${freelancerUsername}           botFLNFTDTLogin
${PASSWORD}                     free123
${freelancerFBUsername}         thecrimsonhog@gmail.com
${freelancerFBPassword}         PSalm23$$$
${freelancerInvalidUsername}    invalidUserName
${freelancerInvalidPassword}    invalidPassword

*** Test Cases ***
Freelancer Desktop App Should Be Successfully Installed
    Set Focus To "Programs and Features" Window
    Press Keyboard Key    CTRL + w