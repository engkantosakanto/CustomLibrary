*** Settings ***
Library           Remote    http://localhost:${PORT}
Suite Setup       Set Image Library    C:/CustomLibrary/Images

*** Variables ***
${PORT}           8270

*** Test Cases ***
Get Env
    Get Env OS
Get Env Version
    Get Env OS Version
Confirm OS
    Confirm Env OS    Windows
    Confirm Env OS    Mac
    Confirm Env OS    Linux