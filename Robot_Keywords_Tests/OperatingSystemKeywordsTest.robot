*** Settings ***
Library           CustomRobotSikuliLibrary
#Test Setup        Set Image Library    C:/CustomLibrary/Images
Test Setup        Set Image Library    C:/Users/calcifer/CustomLibrary/CustomLibrary/Images

*** Test Cases ***
Get Env
    Get Env OS
Get Env Version
    Get Env OS Version
Confirm OS
    Confirm Env OS    Windows
    Confirm Env OS    Mac
    Confirm Env OS    Linux