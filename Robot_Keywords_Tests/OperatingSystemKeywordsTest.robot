*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            CustomRobotSikuliLibrary
Default Tags       OperatingSystemKeywordsTest
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Test Cases ***
Get Env
    Get Env OS
Get Env Version
    Get Env OS Version
Confirm OS
    Confirm Env OS    Windows
    Confirm Env OS    Mac
    Confirm Env OS    Linux