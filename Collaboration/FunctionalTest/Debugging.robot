*** Settings ***
Documentation     This suite covers the test cases for login logout functionality test of the Desktop App
Suite Setup       Set Default Pattern Library Directory
Default Tags      Debugging
Resource          ../Resources/PageResources/desktop_app_login_logout.robot
Resource          ../Resources/PageResources/desktop_app_installation.robot
Resource          ../Resources/CommonResources/desktop_app_global_helper.robot


*** Test Cases ***

Test 1
    Switch Application Focus    Freelancer Desktop App
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be "Visible" Before Timeout
    Set New Search Region In Active App    30, 255, -60, -512
    Click Region
    Type String    Hello World
    Set New Search Region In Active App    30, 310, -60, -512
    Click Region
    Type String    Aloha
    Set New Search Region In Active App    30, 370, -60, -512
    Click Region

Test 2
    User Runs The Freelancer Desktop App
    User Is In Freelancer Desktop App Login Page
    Type String In Textfield    Hello World    30, 255, -60, -512
    Type String In Textfield    Aloha    30, 310, -60, -512
    Click Button Region     30, 370, -60, -512


*** Keywords ***
Type String In Textfield
    [Arguments]    ${string}    ${region_coordinates}
    Set New Search Region In Active App    ${region_coordinates}
    Highlight Region    2
    Click Region
    Type String    ${string}

Click Button Region
    [Arguments]    ${button_region}
    Set New Search Region In Active App    ${button_region}
    Highlight Region    2
    Click Region


